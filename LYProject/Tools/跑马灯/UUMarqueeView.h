//
//  UUMarqueeView.h
//  UUMarqueeView
//
//  Created by youyou on 16/12/5.
//  Copyright © 2016年 iceyouyou. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UUMarqueeView;

//滚动方向
typedef NS_ENUM(NSUInteger, UUMarqueeViewDirection) {
    UUMarqueeViewDirectionUpward,   // scroll from bottom to top
    UUMarqueeViewDirectionLeftward  // scroll from right to left
};

#pragma mark - UUMarqueeViewDelegate
@protocol UUMarqueeViewDelegate <NSObject>
- (NSUInteger)numberOfDataForMarqueeView:(UUMarqueeView*)marqueeView; //数据源个数
- (void)createItemView:(UIView*)itemView forMarqueeView:(UUMarqueeView*)marqueeView;  // 创建初始条目视图
- (void)updateItemView:(UIView*)itemView atIndex:(NSUInteger)index forMarqueeView:(UUMarqueeView*)marqueeView;   // 更新条目内容
@optional
- (NSUInteger)numberOfVisibleItemsForMarqueeView:(UUMarqueeView*)marqueeView;   //可视条目数组 only for [UUMarqueeViewDirectionUpward]
- (CGFloat)itemViewWidthAtIndex:(NSUInteger)index forMarqueeView:(UUMarqueeView*)marqueeView;   //条目显示指定内容后的宽度 only for [UUMarqueeViewDirectionLeftward]
- (CGFloat)itemViewHeightAtIndex:(NSUInteger)index forMarqueeView:(UUMarqueeView*)marqueeView;   // only for [UUMarqueeViewDirectionUpward] and [useDynamicHeight = YES]
- (void)didTouchItemViewAtIndex:(NSUInteger)index forMarqueeView:(UUMarqueeView*)marqueeView;  // 点击事件回调
@end

#pragma mark - UUMarqueeView
@interface UUMarqueeView : UIView
@property (nonatomic, weak) id<UUMarqueeViewDelegate> delegate;
@property (nonatomic, assign) NSTimeInterval timeIntervalPerScroll; // 滑动间隔
@property (nonatomic, assign) NSTimeInterval timeDurationPerScroll; // 滑动时间 only for [UUMarqueeViewDirectionUpward] and [useDynamicHeight = NO]
@property (nonatomic, assign) BOOL useDynamicHeight;    // 动态高度 默认为NO， only for [UUMarqueeViewDirectionUpward]
@property (nonatomic, assign) float scrollSpeed;    // 滑动速度 only for [UUMarqueeViewDirectionLeftward] or [UUMarqueeViewDirectionUpward] with [useDynamicHeight = YES]
@property (nonatomic, assign) float itemSpacing;    //  左右相邻两个条目的间距，当左侧条目内容的长度超出marquee view整体长度时有效only for [UUMarqueeViewDirectionLeftward]
@property (nonatomic, assign) BOOL stopWhenLessData;    // do not scroll when all data has been shown
@property (nonatomic, assign) BOOL clipsToBounds;
@property (nonatomic, assign, getter=isTouchEnabled) BOOL touchEnabled; // 设置为YES可监听点击事件，默认值为NO
@property (nonatomic, assign) UUMarqueeViewDirection direction; // 滚动方向
- (instancetype)initWithDirection:(UUMarqueeViewDirection)direction;
- (instancetype)initWithFrame:(CGRect)frame direction:(UUMarqueeViewDirection)direction;
- (void)reloadData;
- (void)start;
- (void)pause;
@end

#pragma mark - UUMarqueeViewTouchResponder(Private)
@protocol UUMarqueeViewTouchResponder <NSObject>
- (void)touchAtPoint:(CGPoint)point;
@end

#pragma mark - UUMarqueeViewTouchReceiver(Private)
@interface UUMarqueeViewTouchReceiver : UIView
@property (nonatomic, weak) id<UUMarqueeViewTouchResponder> touchDelegate;
@end

#pragma mark - UUMarqueeItemView(Private)
@interface UUMarqueeItemView : UIView   // UUMarqueeItemView's [tag] is the index of data source. if none data source then [tag] is -1
@property (nonatomic, assign) BOOL didFinishCreate;
@property (nonatomic, assign) CGFloat width;    // cache the item width, only for [UUMarqueeViewDirectionLeftward]
@property (nonatomic, assign) CGFloat height;   // cache the item height, only for [UUMarqueeViewDirectionUpward]
- (void)clear;
@end
