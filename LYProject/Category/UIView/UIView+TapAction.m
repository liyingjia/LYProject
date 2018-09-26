//
//  UIView+TapAction.m
//  ForInCrachDemo
//
//  Created by 李营 on 2018/9/17.
//  Copyright © 2018年 liying. All rights reserved.
//

#import "UIView+TapAction.h"
#import <objc/runtime.h>

static char viewTapKey;

@implementation UIView (TapAction)

#pragma mark 添加点击手势
-(void)tapHandle:(TapAction)block{
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    [self addGestureRecognizer:tap];
    /*
     id object                     :表示关联者，是一个对象，变量名理所当然也是object
     const void *key               :获取被关联者的索引key---全局唯一
     id value                      :被关联者，这里是一个block
     objc_AssociationPolicy policy : 关联时采用的协议，有assign，retain，copy等协议，一般使用OBJC_ASSOCIATION_RETAIN_NONATOMIC*/
    objc_setAssociatedObject(self, &viewTapKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
}

-(void)tapAction:(UITapGestureRecognizer *)tap{
    //通过key获取被关联对象
    TapAction block = objc_getAssociatedObject(self, &viewTapKey);
    if (block) {
        block();
    }
}

-(void)setGradientBackground{
    //实现背景渐变
    //初始化CAGradientLayer对象，使他的大小胃UIView的大小
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.bounds;
    
    //将CAGradientLayer对象添加在我们要设置的背景色的视图的layer上
    [self.layer addSublayer:gradientLayer];
    
    //设置渐变区域的起始和终止位置（范围是0---1）
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 0);
    
    //设置颜色数组
    gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor,(__bridge id)[UIColor yellowColor].CGColor];
    
    //设置颜色分割点（范围：0-1）
    gradientLayer.locations = @[@(0),@(1)];
}

@end
