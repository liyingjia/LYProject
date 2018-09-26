//
//  UIView+LYSetShadow.h
//  ForInCrachDemo
//
//  Created by 李营 on 2018/9/19.
//  Copyright © 2018年 liying. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ShadowPathSide) {
    ShadowPathLeft,
    
    ShadowPathRight,
    
    ShadowPathTop,
    
    ShadowPathBottom,
    
    ShadowPathNoTop,
    
    ShadowPathAllSide
};

@interface UIView (LYSetShadow)
- (UIView *)LYSetDefaultShadowForView;
/*
 * shadowColor 阴影颜色
 *
 * shadowOpacity 阴影透明度，默认0
 *
 * shadowRadius  阴影半径，默认3
 *
 * shadowPathSide 设置哪一侧的阴影，
 
 * shadowPathWidth 阴影的宽度，
 
 */

-(void)shadowPathWith:(UIColor *)shadowColor shadowOpacity:(CGFloat)shadowOpacity shadowRadius:(CGFloat)shadowRadius shadowSide:(ShadowPathSide)shadowPathSide shadowPathWidth:(CGFloat)shadowPathWidth;

@end
