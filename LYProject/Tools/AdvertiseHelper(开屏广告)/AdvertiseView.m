//
//  AdvertiseView.m
//  LYProject
//
//  Created by 李营 on 2018/9/26.
//  Copyright © 2018年 liying. All rights reserved.
//

#import "AdvertiseView.h"

@interface AdvertiseView()

@property (nonatomic,strong) UIImageView *adView;
@property (nonatomic,strong) UIButton *countBtn;
@property (nonatomic,strong) NSTimer *countTimer;
@property (nonatomic,assign) int count;
@end

static int const showTime = 5;

@implementation AdvertiseView

#pragma mark - 懒加载定时器
- (NSTimer *)countTimer{
    if (!_countTimer) {
        _countTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
    }
    return _countTimer;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //广告图片
        _adView = [[UIImageView alloc]initWithFrame:frame];
        _adView.userInteractionEnabled = YES;
        _adView.contentMode = UIViewContentModeScaleAspectFill;
        _adView.clipsToBounds = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushToAd)];
        [_adView addGestureRecognizer:tap];
        
        //跳过按钮
        CGFloat btnW = 60;
        CGFloat btnH = 30;
        _countBtn = [[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - btnW - 24, btnH, btnW, btnH)];
        [_countBtn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        [_countBtn setTitle:[NSString stringWithFormat:@"跳过%d", showTime] forState:UIControlStateNormal];
        _countBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_countBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _countBtn.backgroundColor = [UIColor colorWithRed:38 /255.0 green:38 /255.0 blue:38 /255.0 alpha:0.6];
        _countBtn.layer.cornerRadius = 4;
        [self addSubview:_adView];
        [self addSubview:_countBtn];
    }
    return self;
}

- (void)setFilePath:(NSString *)filePath{
    _filePath = filePath;
    _adView.image = [UIImage imageWithContentsOfFile:filePath];
}

#pragma mark - 点击广告跳转
- (void)pushToAd{
    [self dismiss];
    [[NSNotificationCenter defaultCenter] postNotificationName:NotificationContants_Advertise_Key object:nil userInfo:nil];
}

#pragma mark - 定时器方法
- (void)countDown{
    _count --;
    [_countBtn setTitle:[NSString stringWithFormat:@"跳过%d",_count] forState:UIControlStateNormal];
    if (_count == 0) {
        [self.countTimer invalidate];
        self.countTimer = nil;
        [self dismiss];
    }
}

#pragma mark - 展示广告
- (void)show{
    //GCD倒计时
//    [self startCoundown];
    //NSTimer倒计时
    [self startTimer];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
}

- (void)startTimer{
    _count = showTime;
    [[NSRunLoop mainRunLoop] addTimer:self.countTimer forMode:NSRunLoopCommonModes];
}

#pragma mark - GCD倒计时
- (void)startCoundown
{
    __block int timeout = showTime + 1; //倒计时时间 + 1
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0 * NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout <= 0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self dismiss];
                
            });
        }else{
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self->_countBtn setTitle:[NSString stringWithFormat:@"跳过%d",timeout] forState:UIControlStateNormal];
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}


#pragma mark - 移除广告
- (void)dismiss{
    [UIView animateWithDuration:0.3f animations:^{
        self.alpha = 0.f;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
