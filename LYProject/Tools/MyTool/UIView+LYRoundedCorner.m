//
//  UIView+LYRoundedCorner.m
//  ForInCrachDemo
//
//  Created by liying on 2018/9/19.
//  Copyright © 2018年 liying. All rights reserved.
//

#import "UIView+LYRoundedCorner.h"

@implementation UIView (LYRoundedCorner)

/**设置某个圆角**/
- (void)ly_setRadius:(UIView *)view size:(CGSize)size left:(BOOL)left right:(BOOL)right bottomLeft:(BOOL)bottomLeft bottomRight:(BOOL)bottomRight{
    [self layoutIfNeeded];//这句代码很重要，不能忘了
    UIRectCorner topLeft = 0;
    UIRectCorner topRight = 0;
    UIRectCorner BottomLeft = 0;
    UIRectCorner BottomRight = 0;
    if (left) {
        topLeft = UIRectCornerTopLeft;
    }
    if (right) {
        topRight = UIRectCornerTopRight;
    }
    if (bottomLeft) {
        BottomLeft = UIRectCornerBottomLeft;
    }
    if (bottomRight) {
        BottomRight = UIRectCornerBottomRight;
    }
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:topLeft|topRight|BottomLeft|BottomRight cornerRadii:size];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = view.bounds;
    maskLayer.path = maskPath.CGPath;
    view.layer.mask = maskLayer;
}

- (void)ly_setBorderWithView:(UIView *)view top:(BOOL)top left:(BOOL)left bottom:(BOOL)bottom right:(BOOL)right borderColor:(UIColor *)color borderWidth:(CGFloat)width
{
    if (top) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, 0, view.frame.size.width, width);
        layer.backgroundColor = color.CGColor;
        [view.layer addSublayer:layer];
    }
    if (left) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, 0, width, view.frame.size.height);
        layer.backgroundColor = color.CGColor;
        [view.layer addSublayer:layer];
    }
    if (bottom) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, view.frame.size.height - width, view.frame.size.width, width);
        layer.backgroundColor = color.CGColor;
        [view.layer addSublayer:layer];
    }
    if (right) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(view.frame.size.width - width, 0, width, view.frame.size.height);
        layer.backgroundColor = color.CGColor;
        [view.layer addSublayer:layer];
    }
}

@end
