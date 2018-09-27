//
//  TitleViewController.m
//  LYProject
//
//  Created by 李营 on 2018/9/27.
//  Copyright © 2018年 liying. All rights reserved.
//

#import "TitleViewController.h"

@interface TitleViewController ()
@property (nonatomic, strong) JXCategoryTitleView *myCategoryView;
@end

@implementation TitleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (self.titles == nil) {
        _titles = @[@"螃蟹", @"麻辣小龙虾", @"苹果", @"营养胡萝卜", @"葡萄", @"美味西瓜", @"香蕉", @"香甜菠萝", @"鸡肉", @"鱼", @"海星"];
    }
    
    [super viewDidLoad];
    
    self.myCategoryView.titles = self.titles;
}

- (JXCategoryTitleView *)myCategoryView {
    return (JXCategoryTitleView *)self.categoryView;
}

- (NSUInteger)preferredListViewCount {
    return self.titles.count;
}

- (Class)preferredCategoryViewClass {
    return [JXCategoryTitleView class];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
