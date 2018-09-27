//
//  AdvertiseHelper.h
//  LYProject
//
//  Created by 李营 on 2018/9/26.
//  Copyright © 2018年 liying. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AdvertiseView.h"

@interface AdvertiseHelper : NSObject

+ (instancetype)shareInstance;

+ (void)showAdvertiseView:(NSArray *)imageArray;

@end
