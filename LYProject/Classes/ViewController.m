//
//  ViewController.m
//  LYProject
//
//  Created by 李营 on 2018/9/20.
//  Copyright © 2018年 liying. All rights reserved.
//

#import "ViewController.h"
#import "LYNetworkHelper.h"
#import "TestViewController.h"
#import "FineViewController.h"

@interface ViewController ()
/** 定时器(这里不用带*，因为dispatch_source_t就是个类，内部已经包含了*) */
@property (nonatomic, strong) dispatch_source_t timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"首页";
        
    [self buttonImageAndTitleLocation];
//    [self gradientBackground];
//    [self changeLabelTextColor];
    //    [self bezierPath];
    //    [self bezierCircle];
    //    [self bezierLine];
    [self animationCircle];
    // 开启日志打印
    [LYNetworkHelper openLog];
    [self monitorNetworkStatus];
//    [LYNetworkHelper GET:@"https://www.baidu.com" parameters:nil success:^(id responseObject) {
//
//    } failure:^(NSError *error) {
//
//    }];
}

#pragma mark - 按钮图片和文字位置
- (void)buttonImageAndTitleLocation{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(150, 20+NavBarHeight, 100, 100);
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn setTitle:@"发送验" forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"微信登录"] forState:UIControlStateNormal];
    [btn ly_setImagePosition:LYImagePositionBottom spaceing:5];
    [btn block:^(id sender) {
        //        [btn startTime:60 title:@"重新发送" waitTitle:@"s后重新获取"];
        TestViewController *vc = [[TestViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }];
    
    [self.view addSubview:btn];
}

#pragma mark - view背景渐变
- (void)gradientBackground{
    //背景渐变
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, NavBarHeight, 100, 100)];
    [view setGradientBackground];
    [self.view addSubview:view];
}

#pragma mark - 改变label文字字体颜色
- (void)changeLabelTextColor{
        UILabel *label = [[UILabel alloc]init];
        label.frame = CGRectMake(100, 200, 100, 40);
        label.text = @"你好呀";
        label.attributedText = [NSAttributedString_Extension changeTextColorWithColor:[UIColor redColor] string:label.text andSubString:@[@"你"]];
        [self.view addSubview:label];
}

#pragma mark - 实时监测网络状态
- (void)monitorNetworkStatus
{
    // 网络状态改变一次, networkStatusWithBlock就会响应一次
    [LYNetworkHelper networkStatusWithBlock:^(LYNetworkStatusType networkStatus) {
        
        switch (networkStatus) {
                // 未知网络
            case LYNetworkStatusUnknown:
                // 无网络
            case LYNetworkStatusNotReachable:
//                [self getData:YES url:dataUrl];
                NSLog(@"无网络,加载缓存数据");
                break;
                // 手机网络
            case LYNetworkStatusReachableViaWWAN:
                NSLog(@"手机网络");
                break;
                // 无线网络
            case LYNetworkStatusReachableViaWiFi:
//                [self getData:[[NSUserDefaults standardUserDefaults] boolForKey:@"isOn"] url:dataUrl];
                NSLog(@"有wifi网络,请求网络数据");
                break;
        }
        
    }];
    
    
}


#pragma mark 画圆角
-(void)bezierPath{
    UIView *myView = [[UIView alloc]initWithFrame:CGRectMake(100, 200, 100, 40)];
    myView.backgroundColor = [UIColor redColor];
    [myView ly_setRadius:myView size:CGSizeMake(20, 20) left:YES right:YES bottomLeft:YES bottomRight:NO];
    [self.view addSubview:myView];
    
    //    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:myView.bounds byRoundingCorners:UIRectCornerTopLeft|UIRectCornerBottomRight cornerRadii:CGSizeMake(20, 20)];
    ////    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:myView.bounds cornerRadius:20];
    //    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    //    layer.frame = myView.bounds;
    //    layer.path = maskPath.CGPath;
    //    myView.layer.mask = layer;
}

#pragma mark 画圆
-(void)bezierCircle{
    UIView *myView = [[UIView alloc]initWithFrame:CGRectMake(150, 200, 100, 100)];
    myView.backgroundColor = [UIColor redColor];
    [self.view addSubview:myView];
    
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:myView.bounds];
    CAShapeLayer *circleLayer = [[CAShapeLayer alloc] init];
    circleLayer.lineWidth = 10;
    circleLayer.strokeColor = [UIColor blueColor].CGColor;
    circleLayer.path = circlePath.CGPath;
    circleLayer.fillColor = [UIColor whiteColor].CGColor;
    [myView.layer addSublayer:circleLayer];
    //    myView.layer.mask = circleLayer;
    
    //    UIBezierPath *circlePath1 = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 10, 80, 80)];
    //    CAShapeLayer *circleLayer1 = [[CAShapeLayer alloc] init];
    //    circleLayer1.lineWidth = 10;
    //    circleLayer1.strokeColor = [UIColor redColor].CGColor;
    //    circleLayer1.path = circlePath1.CGPath;
    //    circleLayer1.fillColor = [UIColor whiteColor].CGColor;
    //    [myView.layer addSublayer:circleLayer1];
    //
    //    UIBezierPath *circlePath2 = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(20, 20, 60, 60)];
    //    CAShapeLayer *circleLayer2 = [[CAShapeLayer alloc] init];
    //    circleLayer2.lineWidth = 10;
    //    circleLayer2.strokeColor = [UIColor yellowColor].CGColor;
    //    circleLayer2.path = circlePath2.CGPath;
    //    circleLayer2.fillColor = [UIColor whiteColor].CGColor;
    //    [myView.layer addSublayer:circleLayer2];
    
    
}

#pragma mark 多边形
-(void)bezierLine{
    NSInteger radius = 10;
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(100, 250, 100, 100)];
    lineView.backgroundColor = [UIColor redColor];
    [self.view addSubview:lineView];
    
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    [linePath moveToPoint:CGPointMake(0, 0)];
    [linePath addArcWithCenter:CGPointMake(radius, radius) radius:radius startAngle:M_PI endAngle:M_PI*1.5 clockwise:YES];
    
    [linePath addLineToPoint:CGPointMake(20, 0)];
    [linePath addLineToPoint:CGPointMake(27.5, -10)];
    [linePath addLineToPoint:CGPointMake(35, 0)];
    
    [linePath addLineToPoint:CGPointMake(100, 0)];
    [linePath addArcWithCenter:CGPointMake(100-radius, 0+radius) radius:radius startAngle:1.5*M_PI endAngle:0 clockwise:YES];
    [linePath addLineToPoint:CGPointMake(100, 100)];
    [linePath addArcWithCenter:CGPointMake(100-radius, 100-radius) radius:radius startAngle:0 endAngle:0.5*M_PI clockwise:YES];
    [linePath addLineToPoint:CGPointMake(0, 100)];
    [linePath addArcWithCenter:CGPointMake(0+radius, 100-radius) radius:radius startAngle:0.5*M_PI endAngle:M_PI clockwise:YES];
    [linePath closePath];
    CAShapeLayer *lineLayer = [[CAShapeLayer alloc] init];
    lineLayer.path = linePath.CGPath;
    lineLayer.lineWidth = 0;
    lineLayer.fillColor = [UIColor cyanColor].CGColor;
    lineLayer.strokeColor = [UIColor brownColor].CGColor;
    [lineView.layer addSublayer:lineLayer];
    //    lineView.layer.mask = lineLayer;
}

-(void)animationCircle{
    
    UIView *myView = [[UIView alloc]initWithFrame:CGRectMake(150, 200, 100, 100)];
    myView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:myView];
    
    //设置贝塞尔曲线
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(myView.frame.size.width/2, myView.frame.size.height/2) radius:40 startAngle:0 endAngle:M_PI*1.5 clockwise:YES];
    
    //遮罩层
    CAShapeLayer* _progressLayer = [CAShapeLayer layer];
    _progressLayer.frame = myView.bounds;
    //填充色
    _progressLayer.fillColor =  [[UIColor clearColor] CGColor];
    //线的颜色
    _progressLayer.strokeColor=[UIColor redColor].CGColor;
    //线的切口样式
    _progressLayer.lineCap = kCALineCapRound;
    //线的宽度
    _progressLayer.lineWidth = 15;
    
    //渐变图层
    CAGradientLayer *gradientLayer =  [CAGradientLayer layer];
    gradientLayer.frame = _progressLayer.frame;
    //设置渐变色，颜色数组
    [gradientLayer setColors:[NSArray arrayWithObjects:(id)[[UIColor redColor] CGColor],(id)[[UIColor yellowColor] CGColor], nil]];
    //设置渐变色分割点
    //    [gradientLayer setLocations:@[@0,@1]];
    //设置渐变颜色方向
    [gradientLayer setStartPoint:CGPointMake(0, 0)];
    [gradientLayer setEndPoint:CGPointMake(1, 1)];
    
    //用progressLayer来截取渐变层 遮罩
    [gradientLayer setMask:_progressLayer];
    [myView.layer addSublayer:gradientLayer];
    
    //增加动画
    CABasicAnimation *pathAnimation=[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    //动画时间
    pathAnimation.duration = 2;
    //一个时间函数，表示它以怎么样的时间运行
    pathAnimation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    //动画起始值
    pathAnimation.fromValue=[NSNumber numberWithFloat:0.0f];
    //动画终止值
    pathAnimation.toValue=[NSNumber numberWithFloat:1.0f];
    pathAnimation.autoreverses=NO;
    
    _progressLayer.path=path.CGPath;
    [_progressLayer addAnimation:pathAnimation forKey:@"strokeEndAnimation"];
}

#pragma mark forin崩溃
-(void)forinCarsh{
    NSMutableArray *array = [NSMutableArray arrayWithArray:@[@"1",@"2",@"3",@"4"]];
    for (int i = 0; i<array.count; i++) {
        if (i == 2) {
            [array removeObject:array[i]];
        }
        
        NSLog(@"%@-----",array);
    }
    
    /*forin内会崩溃，是因为你一边便利数组，又同时修改这个数组里面的内容，导致崩溃,解决方法是重新再定义一个一样的数组，遍历一个，操作另外一个*/
    //    for (NSString *str in array) {
    //        [array removeObject:@"1"];
    //        NSLog(@"%@++++%@",array,str);
    //    }
    
    //    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    //        [array removeObject:@"1"];
    //        NSLog(@"%@-----",array);
    //    }];
}

#pragma mark gcd定时器
-(void)testGCDTimer{
    __block int count = 0;
    
    // 获得队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    // 创建一个定时器(dispatch_source_t本质还是个OC对象)
    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    // 设置定时器的各种属性（几时开始任务，每隔多长时间执行一次）
    // GCD的时间参数，一般是纳秒（1秒 == 10的9次方纳秒）
    // 何时开始执行第一个任务
    // dispatch_time(DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC) 比当前时间晚1秒
    dispatch_time_t start = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10.0 * NSEC_PER_SEC));
    uint64_t interval = (uint64_t)(2.0 * NSEC_PER_SEC);
    dispatch_source_set_timer(self.timer, start, interval, 0);
    
    // 设置回调
    dispatch_source_set_event_handler(self.timer, ^{
        NSLog(@"------------%@", [NSThread currentThread]);
        count++;
        if (count == 4) {
            // 取消定时器
            dispatch_cancel(self.timer);
            self.timer = nil;
        }
    });
    
    // 启动定时器
    dispatch_resume(self.timer);
}

/*
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = touches.anyObject;
    CGPoint point = [touch locationInView:self.view];
    
    LYMenuAction *action = [LYMenuAction actionWithTitle:@"one" image:nil handler:^(LYMenuAction *action) {
        
    }];
    LYMenuAction *action1 = [LYMenuAction actionWithTitle:@"two" image:nil handler:^(LYMenuAction *action) {
        
    }];
    LYMenuAction *action2 = [LYMenuAction actionWithTitle:@"three" image:nil handler:^(LYMenuAction *action) {
        
    }];
    
    LYMenuView *menuView = [LYMenuView menuWithActions:@[action,action1,action2] width:200 atPoint:point];
    // 自定义设置
    //    view.menuColor = [UIColor whiteColor];
    //    view.separatorColor = [UIColor whiteColor];
    menuView.maxDisplayCount = 20;
    //    view.offset = 0;
    //    view.textColor = [UIColor whiteColor];
    //    view.textFont = [UIFont boldSystemFontOfSize:18];
    menuView.menuCellHeight = 40;
    //    view.dismissOnselected = YES;
    //    view.dismissOnTouchOutside = YES;
    [menuView show];
}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
