//
//  MBProgressHUD+LYExtend.h
//  LYProject
//
//  Created by 李营 on 2018/9/25.
//  Copyright © 2018年 liying. All rights reserved.
//

#import "MBProgressHUD.h"

typedef NS_ENUM(NSInteger, LYHUDContentStyle) {
    LYHUDContentDefaultStyle = 0,//默认是白底黑字 Default
    LYHUDContentBlackStyle = 1,//黑底白字
    LYHUDContentCustomStyle = 2,//:自定义风格<由自己设置自定义风格的颜色>
};

typedef NS_ENUM(NSInteger, LYHUDPostion) {
    LYHUDPostionTop,//上面
    LYHUDPostionCenten,//中间
    LYHUDPostionBottom,//下面
};

typedef NS_ENUM(NSInteger, LYHUDProgressStyle) {
    LYHUDProgressDeterminate,///双圆环,进度环包在内
    LYHUDProgressDeterminateHorizontalBar,///横向Bar的进度条
    LYHUDProgressAnnularDeterminate,///双圆环，完全重合
    LYHUDProgressCancelationDeterminate,///带取消按钮 - 双圆环 - 完全重合
};

typedef void((^LYCancelation)(MBProgressHUD *hud));
typedef void((^LYCurrentHud)(MBProgressHUD *hud));

@interface MBProgressHUD ()

@property (nonatomic, copy) LYCancelation cancelation;
///内容风格
@property (nonatomic, assign, readonly) MBProgressHUD *(^hudContentStyle)(LYHUDContentStyle hudContentStyle);
///显示位置：有导航栏时在导航栏下在，无导航栏在状态栏下面
@property (nonatomic, assign, readonly) MBProgressHUD *(^hudPostion)(LYHUDPostion hudPostion);
///进度条风格
@property (nonatomic, assign, readonly) MBProgressHUD *(^hudProgressStyle)(LYHUDProgressStyle hudProgressStyle);
///标题
@property (nonatomic, copy  , readonly) MBProgressHUD *(^title)(NSString *title);
///详情
@property (nonatomic, copy  , readonly) MBProgressHUD *(^details)(NSString *details);
///自定义图片名
@property (nonatomic, copy  , readonly) MBProgressHUD *(^customIcon)(NSString *customIcon);
///标题颜色
@property (nonatomic, strong, readonly) MBProgressHUD *(^titleColor)(UIColor *titleColor);
///进度条颜色
@property (nonatomic, strong, readonly) MBProgressHUD *(^progressColor)(UIColor *progressColor);
///进度条、标题颜色
@property (nonatomic, strong, readonly) MBProgressHUD *(^allContentColors)(UIColor *allContentColors);
///蒙层背景色
@property (nonatomic, strong, readonly) MBProgressHUD *(^hudBackgroundColor)(UIColor *backgroundColor);
///内容背景色
@property (nonatomic, strong, readonly) MBProgressHUD *(^bezelBackgroundColor)(UIColor *bezelBackgroundColor);

@end
