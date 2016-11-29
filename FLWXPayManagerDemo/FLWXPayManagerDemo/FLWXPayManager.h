//
//  FLWXPayManager.h
//  FLWXPayManagerDemo
//
//  Created by clarence on 16/11/29.
//  Copyright © 2016年 gitKong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WXApi.h"

#define FLWXPAYMANAGER [FLWXPayManager shareManager]

@interface FLWXPayManager : NSObject

+ (instancetype)shareManager;
/**
 *  @author Clarence
 *
 *  跳转url
 */
- (BOOL)fl_handleUrl:(NSURL *)url;
/**
 *  @author Clarence
 *
 *  第一次启动的时候需要注册
 */
- (BOOL)fl_registerAppWithUrlSchemes:(NSString *)urlSchemes;
/**
 *  @author Clarence
 *
 *  发起支付
 */
- (BOOL)fl_payWithPayReq:(PayReq *)req callBack:(void(^)(enum WXErrCode errCode))callBack;

@end
