//
//  MessageViewController.m
//  LYProject
//
//  Created by 李营 on 2018/9/26.
//  Copyright © 2018年 liying. All rights reserved.
//

#import "MessageViewController.h"
#import "TitleViewController.h"
#import "JXCategoryView.h"
#import "NumberViewController.h"

@interface MessageViewController ()

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"消息";
    self.view.dk_backgroundColorPicker = DKColorPickerWithRGB(0xffffff,0x2A8DFF);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    TitleViewController *testVC = [[TitleViewController alloc] init];
//    JXCategoryTitleView *titleCategoryView = (JXCategoryTitleView *)testVC.categoryView;
//    //底部带下划线
//    testVC.isNeedIndicatorPositionChangeItem = YES;
//    titleCategoryView.titleColorGradientEnabled = YES;
//    JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
//    lineView.indicatorLineWidth = 20;
//    lineView.lineStyle = JXCategoryIndicatorLineStyle_IQIYI;
//    titleCategoryView.indicators = @[lineView];
//    [self.navigationController pushViewController:testVC animated:YES];
    
    //缩放
//    TitleViewController *testVC = [[TitleViewController alloc] init];
//    JXCategoryTitleView *titleCategoryView = (JXCategoryTitleView *)testVC.categoryView;
//    titleCategoryView.titleColorGradientEnabled = YES;
//    titleCategoryView.titleLabelZoomEnabled = YES;
//    titleCategoryView.titleLabelZoomScale = 1.2;
//    titleCategoryView.backgroundColor = [UIColor groupTableViewBackgroundColor];
//    [self.navigationController pushViewController:testVC animated:YES];
    
    //带数字
    NumberViewController *numberVC = [[NumberViewController alloc] init];
    [self.navigationController pushViewController:numberVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
