//
//  BaseControl.h
//  Base按钮合集
//
//  Created by WKY on 16/9/11.
//  Copyright © 2016年 WKY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+SetRect.h"

@class BaseControl;

@protocol BaseControlDelegate <NSObject>

@optional

/**
 *  点击事件触发
 */
-(void)baseControlTouchEvent:(BaseControl *)control;

@end


@interface BaseControl : UIView

/**
 *  目标
 */
@property (nonatomic, strong) id target;

/**
 *  控制事件
 */
@property (nonatomic) SEL selector;

/**
 *  容器View
 */
@property (nonatomic, strong, readonly) UIView *contentView;

/**
 *  是否有效
 */
@property (nonatomic) BOOL enabled;

/**
 *  是否选中
 */
@property (nonatomic) BOOL selected;


@property (nonatomic, weak) id <BaseControlDelegate> delegate;

#pragma mark  ---- 以下方法需要子类重载
/**
 *  触发了点击时间
 */
- (void)touchUpInside;




@end
