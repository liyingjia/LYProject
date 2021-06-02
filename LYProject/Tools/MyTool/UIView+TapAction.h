//
//  UIView+TapAction.h
//  HuiXinYunApp
//
//  Created by liying on 2018/9/11.
//  Copyright © 2018年 汇桔云专业版. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TapAction)(void);

@interface UIView (TapAction)


@property(nullable, copy) NSArray *colors;
@property(nullable, copy) NSArray<NSNumber *> *locations;
@property CGPoint startPoint;
@property CGPoint endPoint;


- (void)tapHandle:(TapAction)block;
- (void)shakeView;
- (void)shakeRotation:(CGFloat)rotation;
/**
 设置view背景色
 */
-(void)setGradientBackground;


+ (UIView *_Nullable)gradientViewWithColors:(NSArray<UIColor *> *_Nullable)colors locations:(NSArray<NSNumber *> *_Nullable)locations startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;

- (void)setGradientBackgroundWithColors:(NSArray<UIColor *> *_Nullable)colors locations:(NSArray<NSNumber *> *_Nullable)locations startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;

@end
