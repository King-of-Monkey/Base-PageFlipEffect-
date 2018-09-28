//
//  UIView+AnimationProperty.m
//  Base按钮合集
//
//  Created by WKY on 16/9/11.
//  Copyright © 2016年 WKY. All rights reserved.
//

#import "UIView+AnimationProperty.h"
#import <objc/runtime.h>

NSString *const _recognizerScale = @"_recognizerScale";
NSString *const _recognizerAngle = @"_recognizerAngle";

@implementation UIView (AnimationProperty)

#pragma mark ---- Scale
//NSString * const _recognizerScale = @"_recognizerScale";
- (void)setScale:(CGFloat)scale {

    objc_setAssociatedObject(self, (__bridge const void *)(_recognizerScale), @(scale), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.transform = CGAffineTransformMakeScale(scale, scale);
}

- (CGFloat)scale {

    NSNumber *scaleValue = objc_getAssociatedObject(self, (__bridge const void *)(_recognizerScale));
    return scaleValue.floatValue;
}

#pragma  mark ----Angle
- (void)setAngle:(CGFloat)angle {

    objc_setAssociatedObject(self, (__bridge const void *)(_recognizerAngle), @(angle), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.transform = CGAffineTransformMakeRotation(angle);
}

- (CGFloat)angle {

    NSNumber *angleValue = objc_getAssociatedObject(self, (__bridge const void *)(_recognizerAngle));
    return angleValue.floatValue;
}


@end
