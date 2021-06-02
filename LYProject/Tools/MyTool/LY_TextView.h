//
//  LY_TextView.h
//  nongpi
//
//  Created by wangxiaodong on 2020/9/1.
//  Copyright © 2020 shengnong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LY_TextView : UITextView<UITextViewDelegate>

@property (copy, nonatomic) NSString *placeholder;
@property (assign, nonatomic) NSInteger maxLength;//最大长度
@property (nonatomic, assign) CGFloat maxHeight;//最大高度
@property (strong, nonatomic) UILabel *placeholderLabel;
@property (strong, nonatomic) UILabel *wordNumLabel;

//文字输入
@property (copy, nonatomic) void(^didChangeText)(LY_TextView *textView,CGFloat height);
- (void)didChangeText:(void(^)(LY_TextView *textView,CGFloat height))block;

@end

NS_ASSUME_NONNULL_END
