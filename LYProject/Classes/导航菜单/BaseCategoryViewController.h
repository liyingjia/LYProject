//
//  BaseCategoryViewController.h
//  LYProject
//
//  Created by 李营 on 2018/9/27.
//  Copyright © 2018年 liying. All rights reserved.
//

#import "BaseViewController.h"
#import "JXCategoryView.h"

@interface BaseCategoryViewController : BaseViewController

@property (nonatomic, assign) BOOL isNeedIndicatorPositionChangeItem;

@property (nonatomic, strong) JXCategoryBaseView *categoryView;

@property (nonatomic, strong) UIScrollView *scrollView;

- (Class)preferredCategoryViewClass;

- (NSUInteger)preferredListViewCount;

- (CGFloat)preferredCategoryViewHeight;

- (Class)preferredListViewControllerClass;

- (void)configListViewController:(UIViewController *)controller index:(NSUInteger)index;

@end
