//
//  AdvertiseView.h
//  LYProject
//
//  Created by 李营 on 2018/9/26.
//  Copyright © 2018年 liying. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const adImageName  = @"adImageName";

@interface AdvertiseView : UIView

/**
 图片路径
 */
@property (nonatomic, copy) NSString *filePath;

/**
 显示广告页面方法
 */
- (void)show;


@end
