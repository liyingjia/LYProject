//
//  FH_TextView.h
//  AnInterestIos
//
//  Created by liying on 2018/3/9.
//  Copyright © 2018年 Mac-iOS. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FH_TextView;

@protocol LYTextViewDelegate <UITextViewDelegate>

@optional
// 监听输入框内的文字变化
- (void)LYTextView:(FH_TextView *)LYTextView textDidChanged:(NSString *)text;

@end

@interface FH_TextView : UITextView

@property (nonatomic,strong) NSString *placeHolder;
@property (nonatomic,strong) UIImage *placeHolderImg;
@property (nonatomic,strong) UIColor *placeHolderTextColor;
@property (nonatomic, assign) id<LYTextViewDelegate> delegates;
@property (nonatomic,assign) CGRect placeHolderFrame;

@end
