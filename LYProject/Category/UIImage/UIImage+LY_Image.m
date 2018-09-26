//
//  UIImage+LY_Image.m
//  ForInCrachDemo
//
//  Created by 李营 on 2018/9/17.
//  Copyright © 2018年 liying. All rights reserved.
//

#import "UIImage+LY_Image.h"
#import <objc/runtime.h>

@implementation UIImage (LY_Image)


/**
 load只会调用一次
 当类加载进内存的时候调用，而且不管有没有子类，都只会调用一次，在main函数之前调用，用途：1：可以新建类在该类中实现一些配置信息 2：runtime交换方法的时候，因为只需要交换一次方法，所有可以在该方法中实现交换方法的代码，用于只实现一次的代码
 */
+(void)load{
    
    /**
     class_getClassMethod 获取类的方法
     Class 获取哪个类的方法
     SEL: 获取类的方法的名字
     */
    Method imageNamedMethod = class_getClassMethod(self, @selector(imageNamed:));
    
    //获取自定义的方法
    Method ly_imageNamedMethod = class_getClassMethod(self, @selector(ly_imageNamed:));
    
    //交换方法:runtime
    method_exchangeImplementations(imageNamedMethod, ly_imageNamedMethod);
    // 调用imageNamed => ly_imageNamedMethod
    // 调用ly_imageNamedMethod => imageNamed
    
}

// 1.加载图片
// 2.判断是否加载成功
+(UIImage *)ly_imageNamed:(UIImage *)name{
    UIImage *image = [UIImage ly_imageNamed:name];
    if (image) {
//        NSLog(@"加载成功");
    }else{
//        NSLog(@"加载失败");
    }
    return image;
}

@end
