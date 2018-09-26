//
//  TabBarControllerConfig.h
//  LYProject
//
//  Created by 李营 on 2018/9/21.
//  Copyright © 2018年 liying. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CYLTabBarController.h"

@interface TabBarControllerConfig : NSObject

@property (nonatomic, readonly, strong) CYLTabBarController *tabBarController;
@property (nonatomic, copy) NSString *context;

@end
