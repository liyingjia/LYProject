//
//  UIButton+ConutDown.m
//  ForInCrachDemo
//
//  Created by 李营 on 2018/9/17.
//  Copyright © 2018年 liying. All rights reserved.
//

#import "UIButton+ConutDown.h"
#import "UIButton+Block.h"

@implementation UIButton (ConutDown)

-(void)startTime:(NSInteger)timeOut title:(NSString *)title waitTitle:(NSString *)waitTitle{
    __block NSInteger timeout = timeOut;
    __weak typeof(self) weakSelf = self;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        if (timeout <= 0) {
            //倒计时结束，关闭倒计时
            dispatch_source_cancel(timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                [self setTitle:title forState:UIControlStateNormal];
                self.userInteractionEnabled = YES;
                [self block:^(id sender) {
                    [weakSelf startTime:timeOut title:title waitTitle:waitTitle];
                }];
            });
        } else {
            //正在倒计时显示剩余时间
            NSInteger seconds = timeout / 1;
            NSString *startTime = [NSString stringWithFormat:@"%.2ld",(long)seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self setTitle:[NSString stringWithFormat:@"%@%@",startTime,waitTitle] forState:UIControlStateNormal];
                self.userInteractionEnabled = NO;
            });
            timeout --;
        }
    });
    dispatch_resume(timer);
}



@end
