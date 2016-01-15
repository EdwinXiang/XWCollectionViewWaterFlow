//
//  TYAccount.h
//  tianyanAR
//
//  Created by 向伟 on 15/11/23.
//  Copyright © 2015年 Steven2761. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TYAccount : NSObject

/**
 *  登录的用户名
 */
@property(nonatomic,copy)NSString *loginUser;

/**
 *  登录的密码
 */
@property(nonatomic,copy)NSString *loginPwd;
/**
 *  判断用户是否登录
 */
@property(nonatomic,assign,getter=isLogin)BOOL login;

/**
 *  注册的用户
 */
@property(nonatomic,copy)NSString *registerUser;

/**
 *  注册的密码
 */
@property(nonatomic,copy)NSString *registerPwd;


+(instancetype)shareAccount;

/**
 *  保存最新的登录用户数据到沙盒
 */
-(void)saveToSandBox;
@end
