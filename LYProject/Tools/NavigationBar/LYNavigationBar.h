//
//  LYNavigationBar.h
//  LYProject
//
//  Created by 李营 on 2018/9/25.
//  Copyright © 2018年 liying. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LYCustomNavigationBar;

@interface LYNavigationBar : UIView
+ (BOOL)isIphoneX;
+ (CGFloat)navBarBottom;
+ (CGFloat)tabBarHeight;
+ (CGFloat)screenWidth;
+ (CGFloat)screenHeight;
@end

#pragma mark - Default
@interface LYNavigationBar (LYDefault)

/// 局部使用该库       待开发
//+ (void)ly_local;
/// 广泛使用该库       default 暂时是默认， ly_local 完成后，ly_local就会变成默认
+ (void)ly_widely;

/// 局部使用该库时，设置需要用到的控制器      待开发
//+ (void)ly_setWhitelist:(NSArray<NSString *> *)list;
/// 广泛使用该库时，设置需要屏蔽的控制器
+ (void)ly_setBlacklist:(NSArray<NSString *> *)list;

/** set default barTintColor of UINavigationBar */
+ (void)ly_setDefaultNavBarBarTintColor:(UIColor *)color;

/** set default barBackgroundImage of UINavigationBar */
/** warning: ly_setDefaultNavBarBackgroundImage is deprecated! place use lyCustomNavigationBar */
+ (void)ly_setDefaultNavBarBackgroundImage:(UIImage *)image;

/** set default tintColor of UINavigationBar */
+ (void)ly_setDefaultNavBarTintColor:(UIColor *)color;

/** set default titleColor of UINavigationBar */
+ (void)ly_setDefaultNavBarTitleColor:(UIColor *)color;

/** set default statusBarStyle of UIStatusBar */
+ (void)ly_setDefaultStatusBarStyle:(UIStatusBarStyle)style;

/** set default shadowImage isHidden of UINavigationBar */
+ (void)ly_setDefaultNavBarShadowImageHidden:(BOOL)hidden;

@end

#pragma mark - UINavigationBar
@interface UINavigationBar (LYAddition) <UINavigationBarDelegate>

/** 设置导航栏所有BarButtonItem的透明度 */
- (void)ly_setBarButtonItemsAlpha:(CGFloat)alpha hasSystemBackIndicator:(BOOL)hasSystemBackIndicator;

/** 设置导航栏在垂直方向上平移多少距离 */
- (void)ly_setTranslationY:(CGFloat)translationY;

/** 获取当前导航栏在垂直方向上偏移了多少 */
- (CGFloat)ly_getTranslationY;

@end




#pragma mark - UIViewController
@interface UIViewController (LYAddition)

/** record current ViewController navigationBar backgroundImage */
/** warning: ly_setDefaultNavBarBackgroundImage is deprecated! place use lyCustomNavigationBar */
//- (void)ly_setNavBarBackgroundImage:(UIImage *)image;
- (UIImage *)ly_navBarBackgroundImage;

/** record current ViewController navigationBar barTintColor */
- (void)ly_setNavBarBarTintColor:(UIColor *)color;
- (UIColor *)ly_navBarBarTintColor;

/** record current ViewController navigationBar backgroundAlpha */
- (void)ly_setNavBarBackgroundAlpha:(CGFloat)alpha;
- (CGFloat)ly_navBarBackgroundAlpha;

/** record current ViewController navigationBar tintColor */
- (void)ly_setNavBarTintColor:(UIColor *)color;
- (UIColor *)ly_navBarTintColor;

/** record current ViewController titleColor */
- (void)ly_setNavBarTitleColor:(UIColor *)color;
- (UIColor *)ly_navBarTitleColor;

/** record current ViewController statusBarStyle */
- (void)ly_setStatusBarStyle:(UIStatusBarStyle)style;
- (UIStatusBarStyle)ly_statusBarStyle;

/** record current ViewController navigationBar shadowImage hidden */
- (void)ly_setNavBarShadowImageHidden:(BOOL)hidden;
- (BOOL)ly_navBarShadowImageHidden;

/** record current ViewController custom navigationBar */
/** warning: ly_setDefaultNavBarBackgroundImage is deprecated! place use lyCustomNavigationBar */
//- (void)ly_setCustomNavBar:(lyCustomNavigationBar *)navBar;

@end
