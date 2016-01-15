//
//  TYAsyncNetworking.h
//  tianyanAR
//
//  Created by 向伟 on 15/11/30.
//  Copyright © 2015年 Steven2761. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^HandleBlock)(NSData *data);
typedef void (^RefreshBlock)();
typedef void (^ErrorBlock)(NSError *error);
@interface TYAsyncNetworking : NSObject  <NSURLConnectionDataDelegate>

/**
 *联网请求获得数据
 */
+(instancetype)request:(NSString *)urlString andWithHandler:(HandleBlock)hBlock andWithRefresh:(RefreshBlock)rBlock andWithError:(ErrorBlock)eBlock;
@end
