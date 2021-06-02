//
//  UIViewController+GetCurrentVC.m
//  ZSYApp
//
//  Created by HuiXinYun on 2017/8/25.
//  Copyright © 2017年 汇桔云专业版. All rights reserved.
//

#import "UIViewController+GetCurrentVC.h"

@implementation UIViewController (GetCurrentVC)
+ (UIViewController *)findCurrentViewController:(UIViewController *)vc {
    if ([vc.presentedViewController isKindOfClass:[UIAlertController class]]) {
        return vc;
    } else if (vc.presentedViewController) {
        
        // Return presented view controller
        return [UIViewController findCurrentViewController:vc.presentedViewController];
        
    } else if ([vc isKindOfClass:[UISplitViewController class]]) {
        
        // Return right hand side
        UISplitViewController* svc = (UISplitViewController*) vc;
        if (svc.viewControllers.count > 0)
            return [UIViewController findCurrentViewController:svc.viewControllers.lastObject];
        else
            return vc;
        
    } else if ([vc isKindOfClass:[UINavigationController class]]) {
        
        // Return top view
        UINavigationController* svc = (UINavigationController*) vc;
        if (svc.viewControllers.count > 0)
            return [UIViewController findCurrentViewController:svc.topViewController];
        else
            return vc;
        
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        
        // Return visible view
        UITabBarController* svc = (UITabBarController*) vc;
        if (svc.viewControllers.count > 0)
            return [UIViewController findCurrentViewController:svc.selectedViewController];
        else
            return vc;
        
    }
    return vc;
}
+ (UIViewController *)currentViewController {
    UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    return [UIViewController findCurrentViewController:vc];
}
@end
