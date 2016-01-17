# XWCollectionViewWaterFlow
collectionView瀑布流效果，图片高度自适应，可以后台返回高度，或者从后台返回的图片地址去获取图片高度
##实现往下滑动导航栏透明度渐变的效果  仿QQ空间效果展示
#使用方法
##1、导入头文件#import "XWWaterFlowLayout.h"  这个是重写了collectionview的布局方法
##2、写布局属性并且实现协议代理
  XWWaterFlowLayout *layout = [[XWWaterFlowLayout alloc]init];
        layout.delegate = self;
        layout.columnsCount = 2;
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:layout];
#实现协议的代理方法
      #pragma mark -XWWaterFlowLayoutDelegate-
     -(CGFloat) waterFlowLayout:(XWWaterFlowLayout *)waterFlowLayout heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath *)indexPath{
    
    ImageModel *model = self.dataArray[indexPath.item];
    
    CGFloat height = [[NSString stringWithFormat:@"%@",model.coverHeight] integerValue];
    CGFloat Width = [[NSString stringWithFormat:@"%@",model.coverWidth] integerValue];
    NSLog(@"height = %lf,widht = %lf,scale = %lf",height,Width,height/Width*width);
    return height/Width *width;
    
}


#效果
![waterFlow icon](http://a4.qpic.cn/psb?/2932833f-be8b-4313-8b40-99918076f4a8/WNfCDauFr*TNCns0LLINVLRBS.HGU6SDfHNgfJsKoeU!/b/dFsBAAAAAAAA&ek=1&kp=1&pt=0&bo=KwEtAisBLQICCCw!&sce=0-12-12&rf=0-18)
