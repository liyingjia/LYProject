//
//  UIButton+LY_ImageLocation.m
//  ForInCrachDemo
//
//  Created by 李营 on 2018/9/18.
//  Copyright © 2018年 liying. All rights reserved.
//

#import "UIButton+LY_ImageLocation.h"

@implementation UIButton (LY_ImageLocation)

- (void)ly_setImagePosition:(LYImagePosition)position spaceing:(CGFloat)spaceing {
    CGFloat imageWith = self.imageView.image.size.width;
    CGFloat imageHeight = self.imageView.image.size.height;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    CGFloat labelWidth = [self.titleLabel.text sizeWithFont:self.titleLabel.font].width;
    CGFloat labelHeight = [self.titleLabel.text sizeWithFont:self.titleLabel.font].height;
#pragma clang diagnostic pop
    
    CGFloat imageOffsetX = (imageWith + labelWidth) / 2 - imageWith / 2;//image中心移动的x距离
    CGFloat imageOffsetY = imageHeight / 2 + spaceing / 2;//image中心移动的y距离
    CGFloat labelOffsetX = (imageWith + labelWidth / 2) - (imageWith + labelWidth) / 2;//label中心移动的x距离
    CGFloat labelOffsetY = labelHeight / 2 + spaceing / 2;//label中心移动的y距离
    
    switch (position) {
        case LYImagePositionLeft:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, -spaceing/2, 0, spaceing/2);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, spaceing/2, 0, -spaceing/2);
            break;
            
        case LYImagePositionRight:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + spaceing/2, 0, -(labelWidth + spaceing/2));
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageHeight + spaceing/2), 0, imageHeight + spaceing/2);
            break;
            
        case LYImagePositionTop:
            self.imageEdgeInsets = UIEdgeInsetsMake(-imageOffsetY, imageOffsetX, imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(labelOffsetY, -labelOffsetX, -labelOffsetY, labelOffsetX);
            break;
            
        case LYImagePositionBottom:
            self.imageEdgeInsets = UIEdgeInsetsMake(imageOffsetY, imageOffsetX, -imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(-labelOffsetY, -labelOffsetX, labelOffsetY, labelOffsetX);
            break;
            
        default:
            break;
    }
    
}

@end
