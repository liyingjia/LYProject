//
//  UIButton+ManyClick.h
//  ForInCrachDemo
//
//  Created by 李营 on 2018/9/17.
//  Copyright © 2018年 liying. All rights reserved.
//

#import <UIKit/UIKit.h>

#define defaultInterval 1  //默认时间间隔

@interface UIButton (ManyClick)
//设置重复点击间隔
@property (nonatomic, assign) NSTimeInterval timeInterval;
//YES 允许点击   NO不允许点击
@property (nonatomic, assign) BOOL isIgnoreEvent;

@end
