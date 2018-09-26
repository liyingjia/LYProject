//
//  UIView+Extension.m
//  LYProject
//
//  Created by 李营 on 2018/9/21.
//  Copyright © 2018年 liying. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

-(void)setLy_x:(CGFloat)ly_x
{
    CGRect frame = self.frame;
    frame.origin.x = ly_x;
    self.frame = frame;
}

- (CGFloat)ly_x
{
    return self.frame.origin.x;
}

- (CGFloat)ly_left {
    return self.frame.origin.x;
}


-(void)setLy_left:(CGFloat)ly_left{
    CGRect frame = self.frame;
    frame.origin.x = ly_left;
    self.frame = frame;
}

- (CGFloat)ly_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setLy_right:(CGFloat)ly_right {
    CGRect frame = self.frame;
    frame.origin.x = ly_right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)ly_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setLy_bottom:(CGFloat)ly_bottom {
    CGRect frame = self.frame;
    frame.origin.y = ly_bottom - frame.size.height;
    self.frame = frame;
}

- (void)setLy_y:(CGFloat)ly_y
{
    CGRect frame = self.frame;
    frame.origin.y = ly_y;
    self.frame = frame;
}

- (CGFloat)ly_y
{
    return self.frame.origin.y;
}

- (void)setLy_width:(CGFloat)ly_width
{
    CGRect frame = self.frame;
    frame.size.width = ly_width;
    self.frame = frame;
}

- (CGFloat)ly_width
{
    return self.frame.size.width;
}

- (void)setLy_height:(CGFloat)ly_height
{
    CGRect frame = self.frame;
    frame.size.height = ly_height;
    self.frame = frame;
}

- (CGFloat)ly_height
{
    return self.frame.size.height;
}

- (void)setLy_centerX:(CGFloat)ly_centerX
{
    CGPoint center = self.center;
    center.x = ly_centerX;
    self.center = center;
}

- (CGFloat)ly_centerX
{
    return self.center.x;
}
- (void)setLy_centerY:(CGFloat)ly_centerY
{
    CGPoint center = self.center;
    center.y = ly_centerY;
    self.center = center;
}

- (CGFloat)ly_centerY
{
    return self.center.y;
}


- (void)setLy_size:(CGSize)ly_size
{
    //    self.width = size.width;
    //    self.height = size.height;
    CGRect frame = self.frame;
    frame.size = ly_size;
    self.frame = frame;
}

- (CGSize)ly_size
{
    return self.frame.size;
}
- (void)setLy_frame:(CGRect)ly_frame
{
    CGRect frame = ly_frame;
    self.ly_frame = frame;
}
- (CGRect)ly_frame
{
    return self.frame;
}


@end
