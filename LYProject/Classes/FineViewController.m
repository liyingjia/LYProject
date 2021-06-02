//
//  FineViewController.m
//  LYProject
//
//  Created by 李营 on 2018/9/25.
//  Copyright © 2018年 liying. All rights reserved.
//

#import "FineViewController.h"

@interface FineViewController ()

@end

@implementation FineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"发现";
    self.dk_manager.themeVersion = DKThemeVersionNormal;
    self.view.dk_backgroundColorPicker = DKColorPickerWithRGB(0xffffff,0xF5F6FA);
//    [self ly_setNavBarBackgroundAlpha:0];
//    [self ly_setNavBarTitleColor:[UIColor blackColor]];
//    [MBProgressHUD showOnlyTextToView:nil title:@"加载成功"];
//    [MBProgressHUD showSuccess:@"success" toView:nil];
    
    
    UIButton *btn = [UIFactory buttonWithFrame:CGRectZero title:@"变色" font:[UIFont systemFontOfSize:17] titleColorNormal:[UIColor blueColor] titleColorSelected:[UIColor blueColor] target:self touchAction:@selector(changeTheme)];
    btn.frame = CGRectMake(100, 100, 40, 40);
    [self.view addSubview:btn];
    
    UILabel *label = [UIFactory labelWithFrame:CGRectMake(100, 200, 100, 30) text:@"我要变色" textColor:nil font:[UIFont systemFontOfSize:16] bgColor:[UIColor whiteColor]];
    label.dk_textColorPicker = DKColorPickerWithRGB(0x000000,0xff5555);
    [self.view addSubview:label];
    
}


-(void)changeTheme{
    if ([self.dk_manager.themeVersion isEqualToString:DKThemeVersionNight]) {
        [self.dk_manager dawnComing];
    } else {
        [self.dk_manager nightFalling];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
