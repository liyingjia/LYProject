//
//  BaseViewController.h
//  LYProject
//
//  Created by 李营 on 2018/9/21.
//  Copyright © 2018年 liying. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  BaseViewControllerDataSource<NSObject>

@optional
-(NSMutableAttributedString*_Nullable)setTitle;
-(UIButton*_Nullable)set_leftButton;
-(UIButton*_Nullable)set_rightButton;
-(UIColor*_Nullable)set_colorBackground;
-(CGFloat)set_navigationHeight;//
-(UIView*_Nullable)set_bottomView;//
-(UIImage*_Nullable)navBackgroundImage;
-(BOOL)hideNavigationBottomLine;
-(UIImage*_Nullable)set_leftBarButtonItemWithImage;
-(UIImage*_Nullable)set_rightBarButtonItemWithImage;
@end

@protocol BaseViewControllerDelegate <NSObject>

@optional
//左侧按钮事件
-(void)left_button_event:(UIButton*_Nullable)sender;
//右侧按钮事件
-(void)right_button_event:(UIButton*_Nullable)sender;
//标题点击事件
-(void)title_click_event:(UIView*_Nullable)sender;
@end

@interface BaseViewController : UIViewController<BaseViewControllerDelegate,BaseViewControllerDataSource,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
//数据源
@property(nonatomic, strong) NSMutableArray *items;
//请求页码
@property (nonatomic,assign) int pageNum;
//请求数量
@property (nonatomic,assign) int pageSize;

/**
*  增加下拉刷新控件
*/
- (void)addHeaderRefreshView;

/**
 *  增加上拉加载更多控件
 */
- (void)addFooterRefreshView;

/**
 *  加载数据
 */
-(void)loadItems;

@end
