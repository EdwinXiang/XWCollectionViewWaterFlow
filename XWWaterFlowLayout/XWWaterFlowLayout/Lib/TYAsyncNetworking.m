//
//  TYAsyncNetworking.m
//  tianyanAR
//
//  Created by 向伟 on 15/11/30.
//  Copyright © 2015年 Steven2761. All rights reserved.
//

#import "TYAsyncNetworking.h"

#define TYLanguage @"TYLanguage"
@interface TYAsyncNetworking ()

@property(nonatomic,strong)NSMutableData *data;
@property(nonatomic,copy)HandleBlock hBlock;
@property(nonatomic,copy)RefreshBlock rBlock;
@property(nonatomic,copy)ErrorBlock eBlock;

@end

@implementation TYAsyncNetworking

/**
 *从服务器获得响应
 */
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    //抹去以前的数据
    [self.data setLength:0];
}

/**
 *从服务器获得数据
 */
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.data appendData:data];
}

/**
 *完成加载
 */
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        if (self.hBlock) {
            self.hBlock(self.data);
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            if (self.rBlock) {
                self.rBlock();
            }
        });
    });
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    if (self.eBlock) {
        self.eBlock(error);
    }
}
/**
 *联网请求
 */
+(instancetype)request:(NSString *)urlString andWithHandler:(HandleBlock)hBlock andWithRefresh:(RefreshBlock)rBlock andWithError:(ErrorBlock)eBlock
{
    return [[self alloc]initWithRequest:urlString andWithHandler:hBlock andWithRefresh:rBlock andWithError:eBlock];
}

-(instancetype)initWithRequest:(NSString *)urlString andWithHandler:(HandleBlock)hBlock andWithRefresh:(RefreshBlock)rBlock andWithError:(ErrorBlock)eBlock
{
    if (self = [super init]) {
        NSURL *url = [NSURL URLWithString:urlString];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
            request.cachePolicy = NSURLRequestReloadIgnoringCacheData;
        request.cachePolicy = NSURLRequestReturnCacheDataElseLoad;
        NSURLConnection *conection = [NSURLConnection connectionWithRequest:request delegate:self];
        self.data = [NSMutableData data];
        self.hBlock = hBlock;
        self.rBlock = rBlock;
        self.eBlock = eBlock;
        [conection start];
    }
    return self;
}
@end
