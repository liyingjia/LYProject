//
//  LYUserDefaults+LYProperties.h
//  LYProject
//
//  Created by 李营 on 2018/9/26.
//  Copyright © 2018年 liying. All rights reserved.
//

#import "LYUserDefaults.h"

#define YYUserDefault [LYUserDefaults standardUserDefaults]

@interface LYUserDefaults (LYProperties)

#pragma mark -- personinfo
@property (nonatomic,weak) NSString *userName;
@property (nonatomic,weak) NSString *name;
@property (nonatomic,weak) NSString *role;

@property(nonatomic,weak)NSDate *MBJsPatchTime;

#pragma mark --是否是第一次启动APP程序
@property (nonatomic,assign) BOOL isNoFirstLaunch;

@end
