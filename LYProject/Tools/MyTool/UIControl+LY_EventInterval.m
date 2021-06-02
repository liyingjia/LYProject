//
//  UIButton+LY_EventInterval.m
//  nongpi
//
//  Created by wangxiaodong on 2020/8/3.
//  Copyright © 2020 shengnong. All rights reserved.
//

#import "UIControl+LY_EventInterval.h"
#import <objc/runtime.h>

static char * const qi_eventIntervalKey = "qi_eventIntervalKey";
static char * const eventUnavailableKey = "eventUnavailableKey";

@interface UIControl ()

@property (nonatomic, assign) BOOL eventUnavailable;

@end


@implementation UIControl (LY_EventInterval)

//
//+ (void)load {
//
//    Method method = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
//    Method qi_method = class_getInstanceMethod(self, @selector(qi_sendAction:to:forEvent:));
//    method_exchangeImplementations(method, qi_method);
//}
//
//
//#pragma mark - Action function
//
//- (void)qi_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
//    if([self isMemberOfClass:[UIButton class]]) {
//        if (self.eventUnavailable == NO) {
////              self.eventUnavailable = YES;
//              [self qi_sendAction:action to:target forEvent:event];
////              self.qi_eventInterval = self.qi_eventInterval?:2;
////              [self performSelector:@selector(setEventUnavailable:) withObject:0 afterDelay:self.qi_eventInterval];
//        }
//   } else {
//        [self qi_sendAction:action to:target forEvent:event];
//    }
//}
//
//
//#pragma mark - Setter & Getter functions
//
//- (NSTimeInterval)qi_eventInterval {
//
//    return [objc_getAssociatedObject(self, qi_eventIntervalKey) doubleValue];
//}
//
//- (void)setQi_eventInterval:(NSTimeInterval)qi_eventInterval {
//
//    objc_setAssociatedObject(self, qi_eventIntervalKey, @(qi_eventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//
//- (BOOL)eventUnavailable {
//
//    return [objc_getAssociatedObject(self, eventUnavailableKey) boolValue];
//}
//
//- (void)setEventUnavailable:(BOOL)eventUnavailable {
//
//    objc_setAssociatedObject(self, eventUnavailableKey, @(eventUnavailable), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}


@end
