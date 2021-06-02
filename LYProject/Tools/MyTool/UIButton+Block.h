//
//  UIButton+block.h
//  ForInCrachDemo
//
//  Created by liying on 2018/9/17.
//  Copyright © 2018年 liying. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "UIImage+Gradient.h"
typedef void(^ActionBlock)(id sender);

@interface UIButton (Block)

/**
 UIControlEvents 触发block执行方法,代替指定@select()方法
 @param  controlEvent 触发条件,例如按下按钮,双击按钮
 @param  action 触发执行的block
 */
-(void)handleControlEvent:(UIControlEvents)controlEvent withBlock:(ActionBlock)action;


/**
 按下按钮手抬起的时候触发block,代替指定@select()方法
 #param  action 触发执行的block
 */
-(void)block:(ActionBlock)block;


/**
 *  根据给定的颜色，设置按钮的颜色
 *  @param btnSize  这里要求手动设置下生成图片的大小，防止coder使用第三方layout,没有设置大小
 *  @param clrs     渐变颜色的数组
 *  @param percent  渐变颜色的占比数组
 *  @param type     渐变色的类型
 */
- (UIButton *)gradientButtonWithSize:(CGSize)btnSize colorArray:(NSArray *)clrs percentageArray:(NSArray *)percent gradientType:(NewGradientType)type;

@end
