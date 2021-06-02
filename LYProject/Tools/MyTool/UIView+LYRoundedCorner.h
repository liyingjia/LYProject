//
//  UIView+LYRoundedCorner.h
//  ForInCrachDemo
//
//  Created by liying on 2018/9/19.
//  Copyright © 2018年 liying. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LYRoundedCorner)


/**
 设置某个圆角

 @param view 设置圆角的view
 @param size 圆角大小
 @param left 上左
 @param right 上右
 @param bottomLeft 下左
 @param bottomRight 下右
 */
- (void)ly_setRadius:(UIView *)view size:(CGSize)size left:(BOOL)left right:(BOOL)right bottomLeft:(BOOL)bottomLeft bottomRight:(BOOL)bottomRight;

/**
 设置某个边的边框
 
 @param view 设置边框的view
 @param top 上
 @param left 左
 @param bottom 下
 @param right 右
 @param color 颜色
  @param width 宽度
 */
- (void)ly_setBorderWithView:(UIView *)view top:(BOOL)top left:(BOOL)left bottom:(BOOL)bottom right:(BOOL)right borderColor:(UIColor *)color borderWidth:(CGFloat)width;

@end
