//
//  ImageModel.h
//  WaterFlow
//
//  Created by Edwin on 15/12/27.
//  Copyright © 2015年 EdwinXiang. All rights reserved.
//
/**
 "clicks" : "0",
 "commentCount" : "125",
 "coverHeight" : "165",
 "coverUrl" : "http://s1.dwstatic.com/group1/M00/A4/54/23c650dc8956e027e835a4914e3e89af.jpg",
 "coverWidth" : "195",
 "created" : "1446799377",
 "description" : "",
 "destUrl" : "http://box.dwstatic.com/unsupport.php?lolboxAction=toAlbumDetail&albumId=118401&type=jiongTu",
 "galleryId" : "118401",
 "modify_time" : "2015-11-23 20:51:14",
 "picsum" : "56",
 "title" : "撸啊撸囧人囧事第179期 Faker打滚时其他队友的表情是酱紫的",
 "updated" : "1446812446"
 */
#import <Foundation/Foundation.h>

@interface ImageModel : NSObject
/**
 *  点击数
 */
@property (nonatomic,copy) NSString *clicks;
/**
 *  评论数
 */
@property (nonatomic,copy) NSString *commentCount;
/**
 *  高度
 */
@property (nonatomic,copy) NSString *coverHeight;
/**
 *  图片地址
 */
@property (nonatomic,copy) NSString *coverUrl;
/**
 *  宽度
 */
@property (nonatomic,copy) NSString *coverWidth;
/**
 *  创建时间
 */
@property (nonatomic,copy) NSString *created;
/**
 *  描述
 */
@property (nonatomic,copy) NSString *description;
/**
 *  连接地址
 */
@property (nonatomic,copy) NSString *destUrl;
/**
 *
 */
@property (nonatomic,copy) NSString *galleryId;
/**
 *  修改时间
 */
@property (nonatomic,copy) NSString *modify_time;
@property (nonatomic,copy) NSString *picsum;
/**
 *  标题
 */
@property (nonatomic,copy) NSString *title;
/**
 *  更新时间
 */
@property (nonatomic,copy) NSString *updated;

+(NSMutableArray *)parasingDataFromDic:(NSDictionary *)dic;
@end
