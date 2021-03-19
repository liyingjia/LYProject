//
//  TestViewController.m
//  LYProject
//
//  Created by 李营 on 2018/9/21.
//  Copyright © 2018年 liying. All rights reserved.
//

#import "TestViewController.h"
#import "SKAutoScrollLabel.h"
#import "UUMarqueeView.h"


@interface TestViewController ()<RouterProtocol>

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:self.tableView];
//    [self addHeaderRefreshView];
//    [self addFooterRefreshView];
    [self scrollLabel];
}


- (void)scrollLabel{
    SKAutoScrollLabel *leftLabel = [[SKAutoScrollLabel alloc]initWithFrame:CGRectMake(50, 100, Main_Screen_Width-200, 40)];
    [self.view addSubview:leftLabel];
    leftLabel.backgroundColor = [UIColor blackColor];// 背景色
    leftLabel.textColor = [UIColor whiteColor];// 字体颜色
//    leftLabel.autoScrollInterval = 0;
    leftLabel.font = [UIFont systemFontOfSize:16];// 字体大小
    leftLabel.direction = SK_AUTOSCROLL_DIRECTION_TOP;// 滚动方向，这是向左滚动
    leftLabel.text = @"11111111  22222222  333333    4444444444     55555555     66666666";// 显示内容
}

#pragma mark - RouterProtocol

+ (NSString *)routerPath {
    return [NSString stringWithFormat:@"app/%@",NSStringFromClass([self class])];
}

+ (id)routerInstanceWithParam:(NSDictionary *)param {
    TestViewController *vc = [[[self class] alloc] init];
    NSString *actionStyle = [param objectForKey:@"actionStyle"];
    if ([actionStyle isEqualToString:@"1"]) {
        [vc loadBackBtn];
    }
    return vc;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
