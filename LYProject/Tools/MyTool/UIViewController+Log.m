//
//  UIViewController+Log.m
//  BoRuoBoLuoMi
//
//  Created by xutianpeng on 2017/6/29.
//  Copyright © 2017年 ZhaoYan. All rights reserved.
//

#import "UIViewController+Log.h"

typedef void (*_VIMP)(id,SEL,...);

@implementation UIViewController (Log)
#ifdef DEBUG
+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        Method viewDidLoad = class_getInstanceMethod(self, @selector(viewDidLoad));
        _VIMP  viewDidLoad_IMP =(_VIMP) method_getImplementation(viewDidLoad);
        method_setImplementation(viewDidLoad, imp_implementationWithBlock(^(id target,SEL section){
            viewDidLoad_IMP(target,section);
//            NSLog(@"当前页面是%@",[target class]);
        }));
        
        method_exchangeImplementations(class_getInstanceMethod(self.class, NSSelectorFromString(@"dealloc")),class_getInstanceMethod(self.class, @selector(swizzledDealloc)));
        
        
        // 获取系统的对象方法
            Method stringByAppendingStringMethod = class_getInstanceMethod(self, @selector(viewDidDisappear:));
            
            // 获取自己定义的对象方法
            Method sjx_stringByAppendingStringMethod = class_getInstanceMethod(self, @selector(sjx_viewDidDisappear:));
            
            // 方法交换
            method_exchangeImplementations(stringByAppendingStringMethod, sjx_stringByAppendingStringMethod);
    });
}
-(void)swizzledDealloc{
    NSLog(@"%@ 释放了",[self class]);
    [self swizzledDealloc];
}

-(void)sjx_viewDidDisappear:(BOOL)animated{
    [self sjx_viewDidDisappear:animated];
}

#else
#endif

@end
