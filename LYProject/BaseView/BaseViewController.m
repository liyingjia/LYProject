//
//  BaseViewController.m
//  LYProject
//
//  Created by 李营 on 2018/9/21.
//  Copyright © 2018年 liying. All rights reserved.
//

#import "BaseViewController.h"
#import <MJRefresh.h>
#import "YYFPSLabel.h"


#define KDEFALUT_PAGE_SIZE 20
@interface BaseViewController ()
@property (nonatomic, strong) YYFPSLabel *fpsLabel;
@end

@implementation BaseViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        _pageNum    = 1;
        _pageSize   = KDEFALUT_PAGE_SIZE;
        
        self.items = [[NSMutableArray alloc] initWithCapacity:10];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (@available(iOS 11.0, *)) {
        UIScrollView.appearance.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        
    }else{
        self.automaticallyAdjustsScrollViewInsets = false;
    }
    
    if ([self respondsToSelector:@selector(backgroundImage)]) {
        UIImage *bgimage = [self navBackgroundImage];
        [self setNavigationBack:bgimage];
    }
    if ([self respondsToSelector:@selector(setTitle)]) {
        NSMutableAttributedString *titleAttri = [self setTitle];
        [self set_Title:titleAttri];
    }
    if (![self leftButton]) {
        [self configLeftBaritemWithImage];
    }
    
    if (![self rightButton]) {
        [self configRightBaritemWithImage];
    }
    //状态栏字体颜色
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    //创建UI
    [self configUI];
}

#pragma mark - 配置UI
- (void)configUI{
//    [self.view addSubview:_tableView];
    if (!_fpsLabel) {
        _fpsLabel = [YYFPSLabel new];
        _fpsLabel.frame=CGRectMake(20, 100, 30, 30);
        [_fpsLabel sizeToFit];
        _fpsLabel.alpha = 0.6;
        [self.view addSubview:_fpsLabel];
    }
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

#pragma mark - 设置导航栏背景图
-(void)setNavigationBack:(UIImage*)image
{
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
    [self.navigationController.navigationBar setBackIndicatorTransitionMaskImage:image ];
    [self.navigationController.navigationBar setShadowImage:image];
}
#pragma mark - 设置导航栏标题
-(void)set_Title:(NSMutableAttributedString *)title
{
    UILabel *navTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 120, 44)];
    navTitleLabel.numberOfLines=0;//可能出现多行的标题
    [navTitleLabel setAttributedText:title];
    navTitleLabel.textAlignment = NSTextAlignmentCenter;
    navTitleLabel.backgroundColor = [UIColor clearColor];
    navTitleLabel.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(titleClick:)];
    [navTitleLabel addGestureRecognizer:tap];
    self.navigationItem.titleView = navTitleLabel;
}

#pragma mark - 导航栏标题点击事件
-(void)titleClick:(UIGestureRecognizer*)Tap
{
    UIView *view = Tap.view;
    if ([self respondsToSelector:@selector(title_click_event:)]) {
        [self title_click_event:view];
    }
}

#pragma mark -- left_item
-(void)configLeftBaritemWithImage
{
    if ([self respondsToSelector:@selector(set_leftBarButtonItemWithImage)]) {
        UIImage *image = [self set_leftBarButtonItemWithImage];
        UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:self  action:@selector(left_click:)];
        self.navigationItem.backBarButtonItem = item;
    }
}
#pragma mark -- right_item
-(void)configRightBaritemWithImage
{
    if ([self respondsToSelector:@selector(set_rightBarButtonItemWithImage)]) {
        UIImage *image = [self set_rightBarButtonItemWithImage];
        UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:self  action:@selector(right_click:)];
        self.navigationItem.rightBarButtonItem = item;
    }
}


#pragma mark -- left_button
-(BOOL)leftButton
{
    BOOL isleft =  [self respondsToSelector:@selector(set_leftButton)];
    if (isleft) {
        UIButton *leftbutton = [self set_leftButton];
        [leftbutton addTarget:self action:@selector(left_click:) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:leftbutton];
        self.navigationItem.leftBarButtonItem = item;
    }
    return isleft;
}

-(void)loadBackBtn{
    [self addLeftBarButtonWithImage:[UIImage imageNamed:@"NavgationBar_blue_back"] action:@selector(backAction)];
}

-(void)backAction{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -- right_button
-(BOOL)rightButton
{
    BOOL isright = [self respondsToSelector:@selector(set_rightButton)];
    if (isright) {
        UIButton *right_button = [self set_rightButton];
        [right_button addTarget:self action:@selector(right_click:) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:right_button];
        self.navigationItem.rightBarButtonItem = item;
    }
    return isright;
}

#pragma mark - 左侧按钮点击事件
-(void)left_click:(id)sender
{
    if ([self respondsToSelector:@selector(left_button_event:)]) {
        [self left_button_event:sender];
    }
}
#pragma mark - 右侧按钮点击事件
-(void)right_click:(id)sender
{
    if ([self respondsToSelector:@selector(right_button_event:)]) {
        [self right_button_event:sender];
    }
}

#pragma mark - 加载数据
- (void)loadItems{
    
}

#pragma mark - 下拉刷新
- (void)headerRereshing {
    _pageNum = 1;
    [self loadItems];
}
#pragma mark - 上拉加载更多
- (void)footerRereshing{
    _pageNum ++;
    [self loadItems];
}

#pragma mark UITableView + 下拉刷新 自定义文字
- (void)addHeaderRefreshView{
    // 1.下拉刷新(进入刷新状态就会调用self的headerRereshing)
    MJRefreshNormalHeader *headerRefreshView = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRereshing)];
    // 设置文字
    [headerRefreshView setTitle:@"下拉可以刷新" forState:MJRefreshStateIdle];
    [headerRefreshView setTitle:@"松开立即刷新" forState:MJRefreshStatePulling];
    [headerRefreshView setTitle:@"正在加载,请稍后..." forState:MJRefreshStateRefreshing];
    // 设置字体
    headerRefreshView.lastUpdatedTimeLabel.hidden = YES;
    headerRefreshView.stateLabel.font = CHINESE_SYSTEM_LIGHT_FONT(14);
    headerRefreshView.lastUpdatedTimeLabel.font = CHINESE_SYSTEM_LIGHT_FONT(13);
    // 设置颜色
//    headerRefreshView.stateLabel.textColor = [UIColor colorWithHexString:@"#666666"];
    //    headerView.lastUpdatedTimeLabel.textColor = [UIColor colorWithHexString:@"#666666"];
//    headerRefreshView.backgroundColor = [UIColor colorWithHexString:DEFAULT_BACKGROUND_COLOR];
    self.tableView.mj_header = headerRefreshView;
}

#pragma mark UITableView + 上拉刷新 自定义文字
- (void)addFooterRefreshView{
    MJRefreshBackNormalFooter *footerView = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRereshing)];
    // 设置文字
    [footerView setTitle:@"上拉加载更多" forState:MJRefreshStateIdle];
    [footerView setTitle:@"松开立即加载" forState:MJRefreshStatePulling];
    [footerView setTitle:@"正在加载,请稍后..." forState:MJRefreshStateRefreshing];
    // 设置字体
    footerView.stateLabel.font = CHINESE_SYSTEM_LIGHT_FONT(14);
    // 设置颜色
//    footerView.stateLabel.textColor = [UIColor colorWithHexString:@"#666666"];
//    footerView.backgroundColor = [UIColor colorWithHexString:DEFAULT_BACKGROUND_COLOR];
    self.tableView.mj_footer = footerView;
}

-(UITableView *)tableView{
    if (!_tableView) {
        CGRect rect = CGRectZero;
        rect = CGRectMake(0, NavBarHeight, self.view.ly_width, self.view.ly_height-NavBarHeight);
        
        _tableView = [[UITableView alloc] initWithFrame:rect style:UITableViewStylePlain];
        if (isIOS7) {
            _tableView.separatorInset = UIEdgeInsetsZero;
            _tableView.separatorColor = [UIColor colorWithHexString:DEFAULT_SPLIT_LINE_COLOR];
        }
        _tableView.backgroundColor = [UIColor colorWithHexString:DEFAULT_BACKGROUND_COLOR];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIApplicationBackgroundFetchIntervalNever;
            _tableView.estimatedRowHeight = 0;
            _tableView.estimatedSectionHeaderHeight = 0;
            _tableView.estimatedSectionFooterHeight = 0;
        } else {
            self.automaticallyAdjustsScrollViewInsets = false;
        }
        //这行代码必须加上，可以去除tableView的多余的线，否则会影响美观
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
