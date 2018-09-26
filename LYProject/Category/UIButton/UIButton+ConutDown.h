//
//  UIButton+ConutDown.h
//  ForInCrachDemo
//
//  Created by 李营 on 2018/9/17.
//  Copyright © 2018年 liying. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (ConutDown)


/**
 倒计时

 @param timeOut 倒计时时间
 @param title 倒计时结束时按钮文字
 @param waitTitle 正在倒计时，显示的文字
 */
-(void)startTime:(NSInteger)timeOut title:(NSString *)title waitTitle:(NSString *)waitTitle;



@end
