//
//  IntroducePagesHelper.m
//  LYProject
//
//  Created by 李营 on 2018/9/26.
//  Copyright © 2018年 liying. All rights reserved.
//

#import "IntroducePagesHelper.h"

@interface IntroducePagesHelper()
@property (nonatomic) UIWindow *rootWindow;
@property(nonatomic,strong)IntroducePagesView *curIntroductoryPagesView;
@end

@implementation IntroducePagesHelper

+ (instancetype)shareInstance
{
    static IntroducePagesHelper *shareInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[IntroducePagesHelper alloc] init];
    });
    
    return shareInstance;
}

-(instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}


+(void)showIntroductoryPageView:(NSArray *)imageArray
{
    if (![IntroducePagesHelper shareInstance].curIntroductoryPagesView) {
        [IntroducePagesHelper shareInstance].curIntroductoryPagesView=[[IntroducePagesView alloc]initPagesViewWithFrame:CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height) Images:imageArray];
    }
    
    [IntroducePagesHelper shareInstance].rootWindow = [UIApplication sharedApplication].keyWindow;
    [[IntroducePagesHelper shareInstance].rootWindow addSubview:[IntroducePagesHelper shareInstance].curIntroductoryPagesView];
}

@end
