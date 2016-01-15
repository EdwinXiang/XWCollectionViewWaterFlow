//
//  TYAccount.m
//  tianyanAR
//
//  Created by 向伟 on 15/11/23.
//  Copyright © 2015年 Steven2761. All rights reserved.
//

#import "TYAccount.h"
#define kUserKey @"user"
#define kPwdKey @"pwd"
#define kLoginKey @"login"
@implementation TYAccount

+(instancetype)shareAccount{
    return [[self alloc] init];
}

#pragma mark 分配内存创建对象
+(instancetype)allocWithZone:(struct _NSZone *)zone{
    NSLog(@"%s",__func__);
    static TYAccount *acount;
    
    // 为了线程安全
    // 三个线程同时调用这个方法
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //        if (acount == nil) {
        acount = [super allocWithZone:zone];
        
        //从沙盒获取上次的用户登录信息
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        acount.loginUser = [defaults objectForKey:kUserKey];
        acount.loginPwd = [defaults objectForKey:kPwdKey];
        acount.login = [defaults boolForKey:kLoginKey];
        //        }
    });

    return acount;
    
}


-(void)saveToSandBox{
    
    // 保存user pwd login
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.loginUser forKey:kUserKey];
    [defaults setObject:self.loginPwd forKey:kPwdKey];
    [defaults setBool:self.isLogin forKey:kLoginKey];
    [defaults synchronize];
    
}
@end
