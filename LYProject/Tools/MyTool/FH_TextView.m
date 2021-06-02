//
//  FH_TextView.m
//  AnInterestIos
//
//  Created by liying on 2018/3/9.
//  Copyright © 2018年 Mac-iOS. All rights reserved.
//

#import "FH_TextView.h"

@interface FH_TextView ()
{
    BOOL _shouldDrawPlaceHloder;
    BOOL _shouldDrawPlaceHloderImg;
}
@end

@implementation FH_TextView

- (void)setText:(NSString *)text{
    [super setText:text];
    [self drawPlaceholder];
    return;
}

- (void)setPlaceHolder:(NSString *)placeHolder{
    if (![placeHolder isEqual:_placeHolder]) {
        _placeHolder = placeHolder;
        [self drawPlaceholder];
    }
    return;
}

- (void)setPlaceHolderImg:(UIImage *)placeHolderImg {
    if (![placeHolderImg isEqual:_placeHolderImg]) {
        _placeHolderImg = placeHolderImg;
        [self drawPlaceholder];
    }
    return;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self configureBase];
    }
    return self;
}
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    if (_shouldDrawPlaceHloder || _shouldDrawPlaceHloderImg) {
        [_placeHolderTextColor set];
        //        [_placeHolder drawInRect:CGRectMake(8.0f, 9.0f, self.frame.size.width - 16.0f,
        //                                            self.frame.size.height) withFont:self.font];
        if (self.placeHolderFrame.origin.x > 0) {
            if (_shouldDrawPlaceHloderImg) {
                [_placeHolderImg drawInRect:CGRectMake(self.placeHolderFrame.origin.x, self.placeHolderFrame.origin.y, 12.0f, 12.0f)];
                [_placeHolder drawInRect:CGRectMake(self.placeHolderFrame.origin.x+17, self.placeHolderFrame.origin.y, self.frame.size.width - 24.0f,
                                                    self.frame.size.height) withAttributes:@{NSFontAttributeName:self.font,NSForegroundColorAttributeName:_placeHolderTextColor}];
            } else {
                [_placeHolder drawInRect:CGRectMake(self.placeHolderFrame.origin.x, self.placeHolderFrame.origin.y, self.frame.size.width - 12.0f,
                                                    self.frame.size.height) withAttributes:@{NSFontAttributeName:self.font,NSForegroundColorAttributeName:_placeHolderTextColor}];
            }
            
            
        } else {
            if (_shouldDrawPlaceHloderImg) {
                [_placeHolderImg drawInRect:CGRectMake(6.0f, 9.0f, 12.0f, 12.0f)];
                [_placeHolder drawInRect:CGRectMake(23.0f, 9.0f, self.frame.size.width - 24.0f,
                                                    self.frame.size.height) withAttributes:@{NSFontAttributeName:self.font,NSForegroundColorAttributeName:_placeHolderTextColor}];
            } else {
                [_placeHolder drawInRect:CGRectMake(6.0f, 9.0f, self.frame.size.width - 12.0f,
                                                    self.frame.size.height) withAttributes:@{NSFontAttributeName:self.font,NSForegroundColorAttributeName:_placeHolderTextColor}];
            }
            
        }
        
    }
    return;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self configureBase];
        self.directionalLockEnabled = YES;
    }
    return self;
}

- (void)configureBase{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textChanged:)
                                                 name:UITextViewTextDidChangeNotification
                                               object:self];
    self.placeHolderTextColor = tf_ColorHex(0x989DB2);
    _shouldDrawPlaceHloder = NO;
    _shouldDrawPlaceHloderImg = NO;
    self.font = [UIFont systemFontOfSize:13];
    //    self.returnKeyType = UIReturnKeySend;
    return;
}

- (void)drawPlaceholder{
    BOOL prev = _shouldDrawPlaceHloder;
    BOOL prevImg = _shouldDrawPlaceHloderImg;
    _shouldDrawPlaceHloder = self.placeHolder && self.placeHolderTextColor && self.text.length == 0;
    _shouldDrawPlaceHloderImg = self.placeHolderImg && self.text.length == 0;
    if (prev != _shouldDrawPlaceHloder || prevImg != _shouldDrawPlaceHloderImg) {
        [self setNeedsDisplay];
    }
    return;
}

- (void)textChanged:(NSNotification *)notification {
    [self drawPlaceholder];
    if (self.delegates && [self.delegates respondsToSelector:@selector(LYTextView:textDidChanged:)]) {
        [self.delegates LYTextView:self textDidChanged:self.text];
    }
    return;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidChangeNotification object:nil];
    return;
}

@end
