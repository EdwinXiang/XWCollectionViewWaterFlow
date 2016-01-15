//
//  XWWaterFlowLayout.h
//  WaterFlow
//
//  Created by Edwin on 15/12/27.
//  Copyright © 2015年 EdwinXiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XWWaterFlowLayout;
@protocol XWWaterFlowLayoutDelegate <NSObject>
@optional
-(CGFloat) waterFlowLayout:(XWWaterFlowLayout *)waterFlowLayout heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath *)indexPath;
@end
@interface XWWaterFlowLayout : UICollectionViewLayout

@property (nonatomic,strong) id<XWWaterFlowLayoutDelegate> delegate;

@property (nonatomic, assign) UIEdgeInsets sectionInset;
/** 每一列之间的间距 */
@property (nonatomic, assign) CGFloat columnMargin;
/** 每一行之间的间距 */
@property (nonatomic, assign) CGFloat rowMargin;
/** 显示多少列 */
@property (nonatomic, assign) int columnsCount;

@end
