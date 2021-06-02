//
//  UIView+TapAction.m
//  HuiXinYunApp
//
//  Created by liying on 2018/9/11.
//  Copyright © 2018年 汇桔云专业版. All rights reserved.
//

#import "UIView+TapAction.h"
#import <objc/runtime.h>

static char tapKey;

@implementation UIView (TapAction)

#pragma mark - 添加单击手势
- (void)tapHandle:(TapAction)block {
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self addGestureRecognizer:tap];
    objc_setAssociatedObject(self, &tapKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)tapAction:(UITapGestureRecognizer *)tap {
    TapAction blcok = objc_getAssociatedObject(self, &tapKey);
    if (blcok) {
        blcok();
    }
}

#pragma mark 抖动
- (void)shakeView
{
    //    CGFloat t =4.0;
    //    CGAffineTransform translateRight  =CGAffineTransformTranslate(CGAffineTransformIdentity, t,0.0);
    //    CGAffineTransform translateLeft =CGAffineTransformTranslate(CGAffineTransformIdentity,-t,0.0);
    //    self.transform = translateLeft;
    //    [UIView animateWithDuration:0.07 delay:0.0 options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat animations:^{
    //        [UIView setAnimationRepeatCount:2.0];
    //        self.transform = translateRight;
    //    } completion:^(BOOL finished){
    //        if(finished){
    //            [UIView animateWithDuration:0.05 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
    //                self.transform =CGAffineTransformIdentity;
    //            } completion:NULL];
    //        }
    //    }];
    
    //view抖动
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
    anim.repeatCount = 1;
    anim.values = @[@-4,@4,@-4,@4];
    [self.layer addAnimation:anim forKey:nil];
    
    
    
    
}

- (void)shakeRotation:(CGFloat)rotation {
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    anim.repeatCount = 2;
    anim.duration = .2;
    anim.values = @[@0,@(rotation),@0,@(-rotation),@0];
    [self.layer addAnimation:anim forKey:nil];
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
    gradientLayer.colors = @[(__bridge id)tf_ColorHex(0x2A8DFF).CGColor,
                             (__bridge id)tf_ColorHex(0x0D5DFE).CGColor];;
    
    //设置颜色分割点（范围：0-1）
    gradientLayer.locations = @[@(0),@(1)];
}

+ (Class)layerClass {
    return [CAGradientLayer class];
}

+ (UIView *)gradientViewWithColors:(NSArray<UIColor *> *)colors locations:(NSArray<NSNumber *> *)locations startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint {
    UIView *view = [[self alloc] init];
    [view setGradientBackgroundWithColors:colors locations:locations startPoint:startPoint endPoint:endPoint];
    return view;
}

- (void)setGradientBackgroundWithColors:(NSArray<UIColor *> *)colors locations:(NSArray<NSNumber *> *)locations startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint {
    NSMutableArray *colorsM = [NSMutableArray array];
    for (UIColor *color in colors) {
        [colorsM addObject:(__bridge id)color.CGColor];
    }
    if ([self.layer isKindOfClass:[CAGradientLayer class]]) {
        // do something
        self.colors = [colorsM copy];
        self.locations = locations;
        self.startPoint = startPoint;
        self.endPoint = endPoint;
    }
    
}

@end
