//
//  UIView+LYRoundedCorner.h
//  ForInCrachDemo
//
//  Created by 李营 on 2018/9/19.
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

@end
