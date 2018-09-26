//
//  UIView+TapAction.h
//  ForInCrachDemo
//
//  Created by 李营 on 2018/9/17.
//  Copyright © 2018年 liying. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TapAction)(void);

@interface UIView (TapAction)

- (void)tapHandle:(TapAction)block;

/**
 设置view背景色
 */
-(void)setGradientBackground;

@end
