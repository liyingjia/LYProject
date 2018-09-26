//
//  LYCustomNavigationBar.h
//  LYProject
//
//  Created by 李营 on 2018/9/25.
//  Copyright © 2018年 liying. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYCustomNavigationBar : UIView

@property (nonatomic, copy) void(^onClickLeftButton)(void);
@property (nonatomic, copy) void(^onClickRightButton)(void);

@property (nonatomic, copy)   NSString *title;
@property (nonatomic, strong) UIColor  *titleLabelColor;
@property (nonatomic, strong) UIFont   *titleLabelFont;
@property (nonatomic, strong) UIColor  *barBackgroundColor;
@property (nonatomic, strong) UIImage  *barBackgroundImage;

+ (instancetype)CustomNavigationBar;

- (void)ly_setBottomLineHidden:(BOOL)hidden;
- (void)ly_setBackgroundAlpha:(CGFloat)alpha;
- (void)ly_setTintColor:(UIColor *)color;

// 默认返回事件
- (void)ly_setLeftButtonWithNormal:(UIImage *)normal highlighted:(UIImage *)highlighted;
- (void)ly_setLeftButtonWithImage:(UIImage *)image;
- (void)ly_setLeftButtonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor;
//创建右侧按钮
- (void)ly_setRightButtonWithNormal:(UIImage *)normal highlighted:(UIImage *)highlighted;
- (void)ly_setRightButtonWithImage:(UIImage *)image;
- (void)ly_setRightButtonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor;

@end
