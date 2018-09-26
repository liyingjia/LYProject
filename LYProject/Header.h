//
//  Header.h
//  LYProject
//
//  Created by 李营 on 2018/9/20.
//  Copyright © 2018年 liying. All rights reserved.
//

#ifndef Header_h
#define Header_h
/**
 * MARK:- 中文字体
 */
#define CHINESE_FONT_LIGHT_NAME  @"PingFangSC-Light"
#define CHINESE_FONT_REGULAR_NAME @"PingFangSC-Regular"
#define CHINESE_FONT_BOLDFONT_NAME @"PingFangSC-Semibold"
#define CHINESE_SYSTEM_LIGHT_FONT(x) [UIFont fontWithName:CHINESE_FONT_LIGHT_NAME size:x]
#define CHINESE_SYSTEM_REGULAR_FONT(x) [UIFont fontWithName:CHINESE_FONT_REGULAR_NAME size:x]
#define CHINESE_SYSTEM_BOLDFONT_FONT(x) [UIFont fontWithName:CHINESE_FONT_BOLDFONT_NAME size:x]

/**
 * MARK:- 不同屏幕尺寸字体适配（375，667是因为效果图为IPHONE6 如果不是则根据实际情况修改）
 */
#define kScreenWidthRatio  (Main_Screen_Width / 375.0)
#define kScreenHeightRatio (Main_Screen_Height / 667.0)
#define AdaptedWidth(x)  ceilf((x) * kScreenWidthRatio)
#define AdaptedHeight(x) ceilf((x) * kScreenHeightRatio)
#define AdaptedFontSize(R)     CHINESE_FONT_LIGHT_NAME(AdaptedWidth(R))


/**
 * MARK:- App Frame Height&Width
 */
#define App_Frame_Height        [[UIScreen mainScreen] applicationFrame].size.height
#define App_Frame_Width         [[UIScreen mainScreen] applicationFrame].size.width


/**
 * MARK:- MainScreen Bounds&Height&Width
 */
#define Main_Screen_Bounds       [[UIScreen mainScreen] bounds]
#define Main_Screen_Height       [[UIScreen mainScreen] bounds].size.height
#define Main_Screen_Width        [[UIScreen mainScreen] bounds].size.width

/**
 * MARK:- 导航栏高度 状态栏高度 底部tabbar高度 苹果X底部安全区高度
 */
#define NavBarHeight ((IS_iPhoneX == YES || IS_iphoneXR == YES || IS_iphoneXS == YES || IS_iphoneXS_Max == YES) ? 88.0 : 64.0)
#define StatusBarHeight ((IS_iPhoneX == YES || IS_iphoneXR == YES || IS_iphoneXS == YES || IS_iphoneXS_Max == YES) ? 44.0 : 20.0)
#define TabBarHeight ((IS_iPhoneX == YES || IS_iphoneXR == YES || IS_iphoneXS == YES || IS_iphoneXS_Max == YES) ? 83.0 : 49.0)
#define SafeTopSpace    ((IS_iPhoneX == YES || IS_iphoneXR == YES || IS_iphoneXS == YES || IS_iphoneXS_Max == YES) ? 24.f : 0.f)
#define TabBarSafeHeight ((IS_iPhoneX == YES || IS_iphoneXR == YES || IS_iphoneXS == YES || IS_iphoneXS_Max == YES) ? 34.0 : 0.0)
// iPhone X
#define  IS_iPhoneX ((Main_Screen_Width == 375.f && Main_Screen_Height == 812.f) ? YES : NO)
// iPhone XR
#define IS_iphoneXR ((Main_Screen_Width == 414.f && Main_Screen_Height == 896.f) ? YES : NO)
// iPhone XS
#define IS_iphoneXS ((Main_Screen_Width == 562.5f && Main_Screen_Height == 1218.f) ? YES : NO)
// iPhone XS-Max
#define IS_iphoneXS_Max ((Main_Screen_Width == 621.f && Main_Screen_Height == 1344.f) ? YES : NO)

/**
 * MARK:- 颜色, 色值
 */
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)
#define HEXCOLOR(hex) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0 green:((float)((hex & 0xFF00) >> 8)) / 255.0 blue:((float)(hex & 0xFF)) / 255.0 alpha:1]
#define HEXCOLORALPHA(hex,a) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0 green:((float)((hex & 0xFF00) >> 8)) / 255.0 blue:((float)(hex & 0xFF)) / 255.0 alpha:(a)]
#define COLOR_RGB(rgbValue,a) [UIColor colorWithRed:((float)(((rgbValue) & 0xFF0000) >> 16))/255.0 green:((float)(((rgbValue) & 0xFF00)>>8))/255.0 blue: ((float)((rgbValue) & 0xFF))/255.0 alpha:(a)]
#define randomColor RGBA(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

/**
 * MARK:- 判断版本号
 */
//App版本号
#define appMPVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
// 当前版本
#define FSystemVersion          ([[[UIDevice currentDevice] systemVersion] floatValue])
#define DSystemVersion          ([[[UIDevice currentDevice] systemVersion] doubleValue])
#define SSystemVersion          ([[UIDevice currentDevice] systemVersion])

/**
 * MARK:- 常用缩写
 */
#define kApplication        [UIApplication sharedApplication]
#define kKeyWindow          [UIApplication sharedApplication].keyWindow
#define kUserDefaults       [NSUserDefaults standardUserDefaults]
#define kNotificationCenter [NSNotificationCenter defaultCenter]
#define MAXFLOAT    0x1.fffffep+127f

//weakSelf or strongSelf
#define WeakSelf(type)  __weak typeof(type) weak##type = type;
#define StrongSelf(type)  __strong typeof(type) type = weak##type;


/**
 * MARK:- 常用整数值
 */
#define FH_TitleViewH 35
#define FH_TitleViewY NavBarHeight
#define GlobalPageSize 10
/**
 * MARK:APPID
 */
//苹果商店appid
#define APPID @"1359062788"
#define APPIDURL @"https://itunes.apple.com/cn/app/id" APPID@"?mt=8"
//内购MerchantID
#define kAppleMerchantID        @"merchant.com.qmall.womao"
//内购商品本地存储
#define FH_PrivilegeProduct @"PrivilegeProduct"

/**
 * MARK:- 打印宏
 */
//#ifdef DEBUG //开发阶段
//#define NSLog(FORMAT, ...) fprintf(stderr, "%s:%zd\t%s\n", [[[NSString stringWithUTF8String: __FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat: FORMAT, ## __VA_ARGS__] UTF8String]);
//#else //发布阶段
//#define NSLog(FORMAT, ...)
//#endif

/**
 * MARK:- --------------- 以下是需要修改的宏, 修改完了放到上面成为统一规范 --------------- -
 */

#define marginVertical 10
#define marginHorizontal 11
// 字体大小(常规/粗体)
#define FONT(NAME, FONTSIZE)    [UIFont fontWithName:(NAME) size:(FONTSIZE)]


// 是否大于等于IOS7
#define isIOS7                  ([[[UIDevice currentDevice]systemVersion]floatValue] >= 7.0)
// 是否IOS6
#define isIOS6                  ([[[UIDevice currentDevice]systemVersion]floatValue] < 7.0)
// 是否大于等于IOS8
#define isIOS8                  ([[[UIDevice currentDevice]systemVersion]floatValue] >=8.0)
// 是否大于IOS9
#define isIOS9                  ([[[UIDevice currentDevice]systemVersion]floatValue] >=9.0)
// 是否大于IOS10
#define isIOS10                  ([[[UIDevice currentDevice]systemVersion]floatValue] >=10.0)
// 是否大于IOS11
#define isIOS11                  ([[[UIDevice currentDevice]systemVersion]floatValue] >=11.0)
// 是否iPad
#define isiPad                   (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)



//AppDelegate对象
#define AppDelegateInstance [[UIApplication sharedApplication] delegate]

#define SAFE_DELEGATE(obj,method,firstParam) \
([obj respondsToSelector:@selector(method:)] ? [obj method:firstParam] : nil)
#define BLOCK_EXEC(block, ...) if (block) { block(__VA_ARGS__); };


//获取当前语言
#define kCurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

//获取图片资源
#define GetImage(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]

//Library/Caches 文件路径
#define FilePath ([[NSFileManager defaultManager] URLForDirectory:NSCachesDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil])
//获取temp
#define kPathTemp NSTemporaryDirectory()
//获取沙盒 Document
#define kPathDocument [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//获取沙盒 Cache
#define kPathCache [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]

//System  剪贴板
#define PasteString(string)   [[UIPasteboard generalPasteboard] setString:string];

//字符串是否为空
#define kStringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
//数组是否为空
#define kArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
//字典是否为空
#define kDictIsEmpty(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)
//是否是空对象
#define kObjectIsEmpty(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))

//由角度转换弧度
#define kDegreesToRadian(x)      (M_PI * (x) / 180.0)
//由弧度转换角度
#define kRadianToDegrees(radian) (radian * 180.0) / (M_PI)

//获取一段时间间隔
#define kStartTime CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
#define kEndTime   NSLog(@"Time: %f", CFAbsoluteTimeGetCurrent() - start)

#endif /* Header_h */
