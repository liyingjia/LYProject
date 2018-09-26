//
//  UIViewController+log.m
//  ForInCrachDemo
//
//  Created by 李营 on 2018/9/17.
//  Copyright © 2018年 liying. All rights reserved.
//

#import "UIViewController+Log.h"
#import <objc/runtime.h>

//IMP（Implementation）是一个指向具体实现的方法的地址指针，参数都包含id和SEL类型。通过id(实例对象)里的SEL(方法指针)获取到唯一的实现方法，
//有返回值
//typedef id (*IMP)(id,SEL,...);
//无返回值
typedef void (*_VIMP) (id,SEL,...);

@implementation UIViewController (Log)

#ifdef DEBUG

/**
 打印当前类的名字
 */
+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method viewDidLoad = class_getInstanceMethod(self, @selector(viewDidLoad));
        _VIMP viewDidLoad_IMP = (_VIMP) method_getImplementation(viewDidLoad);
        method_setImplementation(viewDidLoad, imp_implementationWithBlock(^(id target,SEL second){
            viewDidLoad_IMP(target,second);
            NSLog(@"当前class：%@",[target class]);
        }));
        method_exchangeImplementations(class_getInstanceMethod(self, NSSelectorFromString(@"dealloc")), class_getClassMethod(self, @selector(swizzledDealloc)));
    });
}

-(void)swizzledDealloc{
    NSLog(@"%@ 释放了",[self class]);
    [self swizzledDealloc];
}
#else
#endif
@end
