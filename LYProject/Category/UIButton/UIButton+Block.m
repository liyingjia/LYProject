//
//  UIButton+block.m
//  ForInCrachDemo
//
//  Created by 李营 on 2018/9/17.
//  Copyright © 2018年 liying. All rights reserved.
//

#import "UIButton+Block.h"

@implementation UIButton (Block)

static const char *overviewKey = "buttonActionKey";

-(void)handleControlEvent:(UIControlEvents)controlEvent withBlock:(ActionBlock)action{
    //这个方法的是意思是为UIButton这个类添加一个属性叫action,overviewKey是键值
    objc_setAssociatedObject(self, overviewKey, action, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(actionBlock:) forControlEvents:controlEvent];
}

-(void)block:(ActionBlock)block{
    /*
     id object                     :表示关联者，是一个对象，变量名理所当然也是object
     const void *key               :获取被关联者的索引key---全局唯一
     id value                      :被关联者，这里是一个block
     objc_AssociationPolicy policy : 关联时采用的协议
     */
    objc_setAssociatedObject(self, overviewKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(actionBlock:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)actionBlock:(id)sender{
    //通过key值获取关联对象
    ActionBlock block = objc_getAssociatedObject(self, overviewKey);
    if (block) {
        block(sender);
    }
}

@end
