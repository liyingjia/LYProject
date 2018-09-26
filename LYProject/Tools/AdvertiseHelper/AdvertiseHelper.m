//
//  AdvertiseHelper.m
//  LYProject
//
//  Created by 李营 on 2018/9/26.
//  Copyright © 2018年 liying. All rights reserved.
//

#import "AdvertiseHelper.h"

@implementation AdvertiseHelper

+ (instancetype)shareInstance{
    static AdvertiseHelper *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [AdvertiseHelper new];
    });
    return instance;
}


+ (void)showAdvertiseView:(NSArray *)imageArray{
    //判断沙盒中是否存在广告图片,如果存在就直接显示
    NSString *filePath = [[AdvertiseHelper shareInstance] getFilePathWithImageName:[[NSUserDefaults standardUserDefaults] valueForKey:adImageName]];
    BOOL isExist = [[AdvertiseHelper shareInstance] isFileExistFilePath:filePath];
    if (isExist) {
        AdvertiseView *advertiseView = [[AdvertiseView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
        advertiseView.filePath = filePath;
        [advertiseView show];
    }
    // 2.无论沙盒中是否存在广告图片，都需要重新调用广告接口，判断广告是否更新
    [[AdvertiseHelper shareInstance] getAdvertisingImage:imageArray];
}

/**
 *  更新广告图片
 */
- (void)getAdvertisingImage:(NSArray *)imageArray
{
    //随机取一张
    NSString *imageUrl = imageArray[arc4random() % imageArray.count];
    
    NSArray *stringArr = [imageUrl componentsSeparatedByString:@"/"];
    NSString *imageName = stringArr.lastObject;
    
    // 拼接沙盒路径
    NSString *filePath = [self getFilePathWithImageName:imageName];
    BOOL isExist = [self isFileExistFilePath:filePath];
    if (!isExist){// 如果该图片不存在，则删除老图片，下载新图片
        [self downloadAdImageWithUrl:imageUrl imageName:imageName];
    }
}


/**
 判断文件是否存在

 @param filePath 文件路径
 @return   yes/no
 */
- (BOOL)isFileExistFilePath:(NSString *)filePath{
    NSFileManager *fileManeger = [NSFileManager defaultManager];
    BOOL isDirectory = FALSE;
    return [fileManeger fileExistsAtPath:filePath isDirectory:&isDirectory];
}

/**
 下载图片

 @param imageUrl 图片地址
 @param imageName 图片名字
 */
- (void)downloadAdImageWithUrl:(NSString *)imageUrl imageName:(NSString *)imageName{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
        UIImage *image = [UIImage imageWithData:data];
        
        NSString *filePath = [self getFilePathWithImageName:imageName]; // 保存文件的名称
        
        if ([UIImagePNGRepresentation(image) writeToFile:filePath atomically:YES]) {// 保存成功
            NSLog(@"保存成功");
            [self deleteOldImage];
            [[NSUserDefaults standardUserDefaults] setValue:imageName forKey:adImageName];
            [[NSUserDefaults standardUserDefaults] synchronize];
            // 如果有广告链接，将广告链接也保存下来
        }else{
            NSLog(@"保存失败");
        }
        
    });
}


/**
 删除旧图片
 */
- (void)deleteOldImage{
    NSString *imageName = [[NSUserDefaults standardUserDefaults] valueForKey:adImageName];
    if (imageName) {
        NSString *filePath = [self getFilePathWithImageName:imageName];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        [fileManager removeItemAtPath:filePath error:nil];
    }
}

/**
 根据图片名字拼接文件路径

 @param imageName 图片名字
 @return 文件路径
 */
- (NSString *)getFilePathWithImageName:(NSString *)imageName{
    if (imageName) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask, YES);
        NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:imageName];
        
        return filePath;
    }
    return nil;
}

@end
