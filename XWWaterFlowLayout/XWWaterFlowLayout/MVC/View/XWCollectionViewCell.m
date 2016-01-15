//
//  XWCollectionViewCell.m
//  WaterFlow
//
//  Created by Edwin on 15/12/27.
//  Copyright © 2015年 EdwinXiang. All rights reserved.
//

#import "XWCollectionViewCell.h"
#import "UIImageView+WebCache.h"
@interface XWCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end

@implementation XWCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}


-(void)setModel:(ImageModel *)model{
    
    _model = model;
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.coverUrl]];
    
//        self.titleLabel.text = [NSString stringWithFormat:@"%@",model.title];
}
@end
