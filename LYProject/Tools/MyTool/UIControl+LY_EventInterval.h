//
//  UIButton+LY_EventInterval.h
//  nongpi
//
//  Created by wangxiaodong on 2020/8/3.
//  Copyright © 2020 shengnong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define defaultInterval 1/默认时间间隔

@interface UIControl (LY_EventInterval)

/**
 *  按钮点击的间隔时间
 */
@property (nonatomic, assign) NSTimeInterval qi_eventInterval;

@end

NS_ASSUME_NONNULL_END
