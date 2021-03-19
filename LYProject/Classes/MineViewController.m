//
//  MineViewController.m
//  LYProject
//
//  Created by 李营 on 2018/9/26.
//  Copyright © 2018年 liying. All rights reserved.
//

#import "MineViewController.h"
#import "ScanViewController.h"
#import "UIViewController+BarButton.h"
#import "ZTNavigationMenu.h"


@interface MineViewController ()

@property(nonatomic, strong) ZTNavigationMenu *titleView;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"个人中心";
    [self addRightBarButtonWithFirstImage:[UIImage imageNamed:@"扫一扫"] action:@selector(scanQRCode)];
    NSArray *data = [[NSArray alloc] initWithObjects:@"Objective-C", @"Swift", @"CPP", @"Java", @"PHP", @"SQL Server", nil];
    ZTNavigationMenuBlock block = ^(NSArray<NSString *> *data, int index) {
        NSLog(@"data = %@", [data objectAtIndex:index]);
    };
    
    // 创建导航栏下拉菜单
    ZTNavigationMenu *titleView = [[ZTNavigationMenu alloc] initWithBlock:block];
    [titleView setData:data];
    [[self navigationItem] setTitleView:titleView];
    [self setTitleView:titleView];
}


- (void)scanQRCode{
    ScanViewController *scanVC = [ScanViewController new];
    scanVC.qrCode = YES;
    scanVC.resultBlock = ^(NSString *scanResult) {
      
    };
    scanVC.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:scanVC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
