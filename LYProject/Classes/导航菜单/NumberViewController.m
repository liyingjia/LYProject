//
//  NumberViewController.m
//  LYProject
//
//  Created by 李营 on 2018/9/27.
//  Copyright © 2018年 liying. All rights reserved.
//

#import "NumberViewController.h"
#import "JXCategoryNumberView.h"

@interface NumberViewController ()<JXCategoryViewDelegate>
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) NSArray *numbers;
@property (nonatomic, strong) JXCategoryNumberView *myCategoryView;
@end

@implementation NumberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _titles = @[@"螃蟹", @"麻辣小龙虾", @"苹果", @"营养胡萝卜", @"葡萄", @"美味西瓜", @"香蕉", @"香甜菠萝", @"鸡肉", @"鱼", @"海星"];
    
    [super viewDidLoad];
    
    UIBarButtonItem *reloadItem = [[UIBarButtonItem alloc] initWithTitle:@"刷新" style:UIBarButtonItemStylePlain target:self action:@selector(reloadNumbers)];
    self.navigationItem.rightBarButtonItem = reloadItem;
    
    _numbers = @[@0, @111111, @5, @10, @2, @100, @66, @999, @33, @33, @11];
    
    self.myCategoryView.titles = self.titles;
    self.myCategoryView.counts = self.numbers;
    
    JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
    self.myCategoryView.indicators = @[lineView];
}

- (JXCategoryNumberView *)myCategoryView {
    return (JXCategoryNumberView *)self.categoryView;
}

- (NSUInteger)preferredListViewCount {
    return self.titles.count;
}

- (Class)preferredCategoryViewClass {
    return [JXCategoryNumberView class];
}

- (void)reloadNumbers {
    self.numbers = @[@33, @33, @33, @33, @33, @33, @33, @33, @33, @33, @33];
    self.myCategoryView.counts = self.numbers;
    [self.myCategoryView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
