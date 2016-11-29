//
//  FLWXPayManager.m
//  FLWXPayManagerDemo
//
//  Created by clarence on 16/11/29.
//  Copyright © 2016年 gitKong. All rights reserved.
//

#import "FLWXPayManager.h"

@interface FLWXPayManager ()<WXApiDelegate>
@property (nonatomic,copy)void(^callBack)(enum WXErrCode errCode);
@end

@implementation FLWXPayManager

+ (instancetype)shareManager{
    static FLWXPayManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (BOOL)fl_handleUrl:(NSURL *)url{
    return [WXApi handleOpenURL:url delegate:self];
}

- (BOOL)fl_registerAppWithUrlSchemes:(NSString *)urlSchemes{
    return [WXApi registerApp:urlSchemes];
}

- (BOOL)fl_payWithPayReq:(PayReq *)req callBack:(void(^)(enum WXErrCode errCode))callBack{
    // 存储回调
    self.callBack = callBack;
    // 发起支付
    return [WXApi sendReq:req];
}

#pragma mark - WXApiDelegate
- (void)onResp:(BaseResp *)resp {
    // 判断支付类型
    if([resp isKindOfClass:[PayResp class]]){
        //支付返回结果，实际支付结果需要去微信服务器端查询
        if (self.callBack) {
            self.callBack(resp.errCode);
        }
    }
    
}


@end
