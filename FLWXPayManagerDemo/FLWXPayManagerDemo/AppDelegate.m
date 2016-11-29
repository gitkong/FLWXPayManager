//
//  AppDelegate.m
//  FLWXPayManagerDemo
//
//  Created by clarence on 16/11/29.
//  Copyright © 2016年 gitKong. All rights reserved.
//

#import "AppDelegate.h"
#import "WXApi.h"
#import "FLTopupViewController.h"// 充值
#import "FLPayViewController.h"// 支付
#import "FLWXPayManager.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
   
//    return  [WXApi handleOpenURL:url delegate:[[FLTopupViewController alloc] init]] || [WXApi handleOpenURL:url delegate:[[FLPayViewController alloc] init]];
    return [FLWXPAYMANAGER fl_handleUrl:url];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    
//    return [WXApi handleOpenURL:url delegate:[[FLTopupViewController alloc] init]] || [WXApi handleOpenURL:url delegate:[[FLPayViewController alloc] init]];
    return [FLWXPAYMANAGER fl_handleUrl:url];
}

- (BOOL)application:(UIApplication *)application openURL:(nonnull NSURL *)url options:(nonnull NSDictionary<NSString *,id> *)options{
    
//    return [WXApi handleOpenURL:url delegate:[[FLTopupViewController alloc] init]] || [WXApi handleOpenURL:url delegate:[[FLPayViewController alloc] init]];
    return [FLWXPAYMANAGER fl_handleUrl:url];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    UITabBarController *tabVc = [[UITabBarController alloc] init];
    [self addChildController:[[FLPayViewController alloc] init] title:@"付款" at:tabVc];
    [self addChildController:[[FLTopupViewController alloc] init] title:@"充值" at:tabVc];
    self.window = [[UIWindow alloc] init];
    self.window.rootViewController = tabVc;
    [self.window makeKeyAndVisible];
    
    [FLWXPAYMANAGER fl_registerAppWithUrlSchemes:@"wxb4ba3c02aa476ea1"];
    return YES;
}

- (void)addChildController:(UIViewController *)vc title:(NSString *)title at:(UITabBarController *)tabVc{
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    vc.title = title;
    nav.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:nil selectedImage:nil];
    [tabVc addChildViewController:nav];
}


@end
