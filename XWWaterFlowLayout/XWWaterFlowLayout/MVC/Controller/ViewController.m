//
//  ViewController.m
//  WaterFlow
//
//  Created by Edwin on 15/12/27.
//  Copyright © 2015年 EdwinXiang. All rights reserved.
//

#import "ViewController.h"
#import "XWWaterFlowLayout.h"
#import "XWCollectionViewCell.h"
#import "ImageModel.h"
#import "TYAsyncNetworking.h"
#import "UIImageView+WebCache.h"
#import "SDWebImageManager.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define imageUrl @"http://box.dwstatic.com/apiAlbum.php?action=l&albumsTag=jiongTu&p=2&v=117&OSType=iOS8.4&versionName=2.2.7"
#define RGB_COLOR(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
#define MAIN_SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.width

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,XWWaterFlowLayoutDelegate>

@property (nonatomic,strong) UICollectionView *collectionView;

@property (nonatomic,strong) NSMutableArray *dataArray;


@end


static NSString *ID = @"images";

@implementation ViewController

- (NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc]init];
    }
    return _dataArray;
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"图片集";
    self.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    
    [self downLoad];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        XWWaterFlowLayout *layout = [[XWWaterFlowLayout alloc]init];
        layout.delegate = self;
        layout.columnsCount = 2;
        
        UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:layout];
        collectionView.backgroundColor = [UIColor whiteColor];
        collectionView.dataSource = self;
        collectionView.delegate = self;
        [collectionView registerNib:[UINib nibWithNibName:@"XWCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:ID];
        [self.view addSubview:collectionView];
        self.collectionView = collectionView;
    });
   

}


#pragma mark -XWWaterFlowLayoutDelegate-
-(CGFloat) waterFlowLayout:(XWWaterFlowLayout *)waterFlowLayout heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath *)indexPath{
    
    ImageModel *model = self.dataArray[indexPath.item];
    
    CGFloat height = [[NSString stringWithFormat:@"%@",model.coverHeight] integerValue];
    CGFloat Width = [[NSString stringWithFormat:@"%@",model.coverWidth] integerValue];
    NSLog(@"height = %lf,widht = %lf,scale = %lf",height,Width,height/Width*width);
    return height/Width *width;
    
}
#pragma mark -- collectionView 代理方法
//返回数据个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
//返回cell的类型
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
   XWCollectionViewCell  *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    ImageModel *model = self.dataArray[indexPath.item];
    cell.model = model;
    cell.layer.borderWidth = 1.0;
    cell.layer.borderColor = RGB_COLOR(155, 155, 155, 0.7).CGColor;
    return cell;
}

/**
 *  cell的点击方法
 */
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ImageModel *model = self.dataArray[indexPath.item];
    NSLog(@"%@",model.destUrl);
}

#pragma mark --导航栏颜色透明度变化 高度变化
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
 
    CGFloat x = scrollView.contentOffset.y/250;
    self.navigationController.navigationBar.alpha = 1-x;
    self.collectionView.frame = CGRectMake(0,64-64*x, ScreenWidth, ScreenHeight);
}

#pragma mark --下载数据
-(void)downLoad{
    
    [TYAsyncNetworking request:imageUrl andWithHandler:^(NSData *data) {
        
        NSDictionary *dataDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        self.dataArray = [ImageModel parasingDataFromDic:dataDic];
    } andWithRefresh:^{
        
        [self.collectionView reloadData];
    } andWithError:^(NSError *error) {
        NSLog(@"error = %@",[error localizedDescription]);
    }];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
