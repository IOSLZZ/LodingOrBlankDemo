//
//  UIView+LZLodingOrBlank.h
//  LodingOrBlankDemo
//
//  Created by admin on 16/5/23.
//  Copyright © 2016年 LZZ. All rights reserved.
//
/// 版权所有 © 新浪微博@IOS_LZZ
#import "Masonry.h"
#import <UIKit/UIKit.h>
@class LZLoadingView, LZBlankPageView;
typedef NS_ENUM(NSInteger, LZBlankPageType)
{
    /*
     根据需要改正
     */
    LZBlankPageTypeNoData = 0,//无数据
    LZBlankPageTypeNetError,//网络错误
    LZBlankPageTypeNoSchedule,//暂无场次
    LZBlankPageTypeComment,//暂无评论
    LZBlankPageTypeCoupon,//暂无优惠劵
    LZBlankPageTypeMessage,//暂无消息
    LZBlankPageTypeOrder,//暂无订单
};

//runtime结合Loding和空白页
@interface UIView (LZLodingOrBlank)
#pragma mark LoadingView
@property (strong, nonatomic) LZLoadingView *loadingView;
#pragma mark BlankPageView
@property (strong, nonatomic) LZBlankPageView *blankPageView;
- (void)beginLoading;
- (void)endLoading;

- (void)configBlankPage:(LZBlankPageType)blankPageType hasData:(BOOL)hasData  reloadButtonBlock:(void(^)(id sender))block;

@end

//Loding动画
@interface LZLoadingView : UIView
@property (strong,nonatomic) UIImageView *loopView,*monkeyView;
@property (assign, nonatomic, readonly) BOOL isLoading;
- (void)startAnimating;
- (void)stopAnimating;
@end

//数据加载失败的时候  没有数据的时候的处理逻辑
@interface LZBlankPageView : UIView
@property (strong, nonatomic) UIImageView *imgView;
@property (strong, nonatomic) UILabel *tipLabel;
@property (copy, nonatomic) void(^reloadButtonBlock)(id sender);
- (void)configWithType:(LZBlankPageType)blankPageType hasData:(BOOL)hasData reloadButtonBlock:(void (^)(id))block;
@end