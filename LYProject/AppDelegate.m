//
//  AppDelegate.m
//  LYProject
//
//  Created by 李营 on 2018/9/20.
//  Copyright © 2018年 liying. All rights reserved.
//

#import "AppDelegate.h"
#import "LYNavigationController.h"
#import "ViewController.h"
#import "TabBarControllerConfig.h"
#import "LYNavigationBar.h"
#import "AdvertiseHelper.h"
#import "SYSafeCategory.h"
#import "LYUserDefaults.h"
#import "LYUserDefaults+LYProperties.h"
#import "IntroducePagesHelper.h"
#import "Router.h"
#import <WebKit/WebKit.h>

@interface AppDelegate ()<RouterResultDelegate>

@end

@implementation AppDelegate

- (UIWindow *)window
{
    if(!_window)
    {
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _window.backgroundColor = [UIColor whiteColor];
        [_window makeKeyAndVisible];
    }
    return _window;
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //设置导航栏
    [self setNavBarAppearence];
    
//     self.window.rootViewController = [[LYNavigationController alloc] initWithRootViewController:[ViewController new]];
//    [CYLPlusButtonSubclass registerPlusButton];
    TabBarControllerConfig *tabBarControllerConfig = [[TabBarControllerConfig alloc] init];
    CYLTabBarController *tabBarController = tabBarControllerConfig.tabBarController;
    [self.window setRootViewController:tabBarController];
    
    //引导页
    [self setupIntroductoryPage];
    //注册路由结果代理
    [Router setRouterResultDeleget:self];
    
    //启动广告
    [self setupAdveriseView];
    //注册广告点击事件
    [self adveriseClick];
    //避免崩溃---针对数组增加、查询、插入为空的统一处理，防止这类问题闪退的情况
    [SYSafeCategory callSafeCategory];
    return YES;
}

- (void)setNavBarAppearence
{
    
    // 设置导航栏默认的背景颜色
    [LYNavigationBar ly_setDefaultNavBarBarTintColor:[UIColor orangeColor]];
    // 设置导航栏所有按钮的默认颜色
    [LYNavigationBar ly_setDefaultNavBarTintColor:[UIColor whiteColor]];
    [LYNavigationBar ly_setDefaultNavBarBackgroundImage:[UIImage imageWithColor:[UIColor orangeColor]]];
    // 设置导航栏标题默认颜色
    [LYNavigationBar ly_setDefaultNavBarTitleColor:[UIColor whiteColor]];
    // 统一设置状态栏样式
    [LYNavigationBar ly_setDefaultStatusBarStyle:UIStatusBarStyleLightContent];
    // 如果需要设置导航栏底部分割线隐藏，可以在这里统一设置
    [LYNavigationBar ly_setDefaultNavBarShadowImageHidden:NO];
}

#pragma mark 引导页
-(void)setupIntroductoryPage
{
    if (YYUserDefault.isNoFirstLaunch)
    {
        return;
    }
    YYUserDefault.isNoFirstLaunch=YES;
    NSArray *images=@[@"introductoryPage1",@"introductoryPage2",@"introductoryPage3",@"introductoryPage4"];
    [IntroducePagesHelper showIntroductoryPageView:images];
}

#pragma mark 启动广告
-(void)setupAdveriseView
{
    // TODO 请求广告接口 获取广告图片
    
    //现在了一些固定的图片url代替
    NSArray *imageArray = @[@"http://imgsrc.baidu.com/forum/pic/item/9213b07eca80653846dc8fab97dda144ad348257.jpg", @"http://pic.paopaoche.net/up/2012-2/20122220201612322865.png", @"http://img5.pcpop.com/ArticleImages/picshow/0x0/20110801/2011080114495843125.jpg", @"http://www.mangowed.com/uploads/allimg/130410/1-130410215449417.jpg"];
    
    [AdvertiseHelper showAdvertiseView:imageArray];
}
#pragma mark - 广告点击事件
- (void)adveriseClick{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushToAd) name:NotificationContants_Advertise_Key object:nil];
}

- (void)pushToAd{
    
}



#pragma mark - RouterResultDelegate
-(void)routerResult:(RouterModel *)model{
    CYLTabBarController *tab = (CYLTabBarController *)self.window.rootViewController;
    UINavigationController *nav = (UINavigationController *)tab.viewControllers.firstObject;
    if (model.routerType == RouterTypeLocal) {
        
        NSInteger actionStyle = [[model.param objectForKey:@"actionStyle"]integerValue];
        if ([model.controller respondsToSelector:@selector(setRouterActionStyle:)]) {
            ((BaseViewController *)model.controller).routerActionStyle = actionStyle;
        }
        if (actionStyle == 0) {
            if ([nav isKindOfClass:[UINavigationController class]]) {
                [nav pushViewController:model.controller animated:YES];
            }
        }else if(actionStyle == 1){
            LYNavigationController *navCon = [[LYNavigationController alloc]initWithRootViewController:model.controller];
            if ([nav isKindOfClass:[UINavigationController class]]) {
                if(@available(iOS 13.0,*)){
                    navCon.modalPresentationStyle = UIModalPresentationFullScreen;
                }
                [nav.viewControllers.lastObject presentViewController:navCon animated:YES completion:nil];
            }else{
                if(@available(iOS 13.0,*)){
                    nav.modalPresentationStyle = UIModalPresentationFullScreen;
                }
                // 设置导航栏默认的背景颜色
                  [nav presentViewController:model.controller animated:YES completion:nil];
            }
        }
    }else if(model.routerType == RouterTypeWap){
        NSInteger actionStyle = [[[Router parseParamFromUrl:model.url]objectForKey:@"actionStyle"]integerValue];
        WKWebView *webController = [[WKWebView alloc]init];
        [nav pushViewController:webController animated:YES];
    }
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
