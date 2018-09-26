//
//  UIView+LYRoundedCorner.m
//  ForInCrachDemo
//
//  Created by 李营 on 2018/9/19.
//  Copyright © 2018年 liying. All rights reserved.
//

#import "UIView+LYRoundedCorner.h"

@implementation UIView (LYRoundedCorner)

/**设置某个圆角**/
- (void)ly_setRadius:(UIView *)view size:(CGSize)size left:(BOOL)left right:(BOOL)right bottomLeft:(BOOL)bottomLeft bottomRight:(BOOL)bottomRight{
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

@end
