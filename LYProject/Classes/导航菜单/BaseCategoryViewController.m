//
//  BaseCategoryViewController.m
//  LYProject
//
//  Created by 李营 on 2018/9/27.
//  Copyright © 2018年 liying. All rights reserved.
//

#import "BaseCategoryViewController.h"

@interface BaseCategoryViewController ()<JXCategoryViewDelegate>

@end

@implementation BaseCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    CGFloat naviHeight = NavBarHeight;
    
    NSUInteger count = [self preferredListViewCount];
    CGFloat categoryViewHeight = [self preferredCategoryViewHeight];
    CGFloat width = Main_Screen_Width;
    CGFloat height = Main_Screen_Height - naviHeight - categoryViewHeight;
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, categoryViewHeight, width, height)];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.contentSize = CGSizeMake(width*count, height);
    [self.view addSubview:self.scrollView];
    
    if (@available(iOS 11.0, *)) {
        self.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    
    for (int i = 0; i < count; i ++) {
        UIViewController *listVC = [[[self preferredListViewControllerClass] alloc] init];
        [self configListViewController:listVC index:i];
        [self addChildViewController:listVC];
        listVC.view.frame = CGRectMake(i*width, 0, width, height);
        [self.scrollView addSubview:listVC.view];
    }
    
    self.categoryView.frame = CGRectMake(0, 0, Main_Screen_Width, categoryViewHeight);
    self.categoryView.delegate = self;
    self.categoryView.contentScrollView = self.scrollView;
    [self.view addSubview:self.categoryView];
    
    if (self.isNeedIndicatorPositionChangeItem) {
        UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"指示器位置切换" style:UIBarButtonItemStylePlain target:self action:@selector(rightItemClicked)];
        self.navigationItem.rightBarButtonItem = rightItem;
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.navigationController.interactivePopGestureRecognizer.enabled = (self.categoryView.selectedIndex == 0);
}

- (Class)preferredCategoryViewClass {
    return [JXCategoryBaseView class];
}

- (NSUInteger)preferredListViewCount {
    return 0;
}

- (CGFloat)preferredCategoryViewHeight {
    return 50;
}

- (Class)preferredListViewControllerClass {
    return [UIViewController class];
}

- (void)configListViewController:(UIViewController *)controller index:(NSUInteger)index {
    
}

- (JXCategoryBaseView *)categoryView {
    if (_categoryView == nil) {
        _categoryView = [[[self preferredCategoryViewClass] alloc] init];
    }
    return _categoryView;
}

- (void)rightItemClicked {
    JXCategoryIndicatorView *componentView = (JXCategoryIndicatorView *)self.categoryView;
    for (JXCategoryIndicatorComponentView *view in componentView.indicators) {
        if (view.componentPosition == JXCategoryComponentPosition_Top) {
            view.componentPosition = JXCategoryComponentPosition_Bottom;
        }else {
            view.componentPosition = JXCategoryComponentPosition_Top;
        }
    }
    [componentView reloadData];
}

#pragma mark - JXCategoryViewDelegate

- (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index {
    [self.scrollView setContentOffset:CGPointMake(self.scrollView.bounds.size.width*index, 0) animated:YES];
    //侧滑手势处理
    self.navigationController.interactivePopGestureRecognizer.enabled = (index == 0);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
