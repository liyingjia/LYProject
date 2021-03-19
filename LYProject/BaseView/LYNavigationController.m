//
//  LYNavigationController.m
//  LYProject
//
//  Created by 李营 on 2018/9/21.
//  Copyright © 2018年 liying. All rights reserved.
//

#import "LYNavigationController.h"

@interface LYNavigationController ()<UIGestureRecognizerDelegate>

/** 系统的右划返回功能的代理记录 */
@property (nonatomic,strong) id popGesDelegate;

@end

@implementation LYNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//     self.navigationBar.hidden = YES;
     [self setupNavigationBar];
    
}



//设置导航栏主题
- (void)setupNavigationBar
{
    UINavigationBar *appearance = [UINavigationBar appearance];
    //统一设置导航栏颜色，如果单个界面需要设置，可以在viewWillAppear里面设置，在viewWillDisappear设置回统一格式。
    [appearance setBarTintColor:[UIColor redColor]];
    
    //导航栏title格式
    NSMutableDictionary *textAttribute = [NSMutableDictionary dictionary];
    textAttribute[NSForegroundColorAttributeName] = [UIColor whiteColor];
    textAttribute[NSFontAttributeName] = [UIFont systemFontOfSize:18];
    [appearance setTitleTextAttributes:textAttribute];
}
 #pragma mark - 全局侧滑代码------------BEGIN----
 - (void)getSystemGestureOfBack
 {
 // 记录系统的pop代理
     UIPanGestureRecognizer *panGes = [[UIPanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:NSSelectorFromString(@"handleNavigationTransition:")];
     
     [self.view addGestureRecognizer:panGes];
     
     panGes.delegate = self;
     
     // 禁止之前的手势
     self.interactivePopGestureRecognizer.enabled = NO;
     
 }
 
 
 - (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
 {
     // 非根控制器才能触发
     return self.childViewControllers.count > 1;
 }
 #pragma mark - 全局侧滑代码------------END----
 

- (void)setupPopGes{
    self.fd_viewControllerBasedNavigationBarAppearanceEnabled = NO;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
}

#pragma mark - 重写push跳转方法
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //二级及以后界面，左上角添加返回按钮
    if (self.childViewControllers.count != 0) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        //        [button setTitle:@"返回" forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"NavgationBar_blue_back"] forState:UIControlStateNormal];
        [button setImage: [UIImage imageNamed:@"NavgationBar_blue_back"] forState:UIControlStateHighlighted];
        button.ly_size = CGSizeMake(44, 44);
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}

#pragma mark - 返回事件
-(void)back{
    [self popViewControllerAnimated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
