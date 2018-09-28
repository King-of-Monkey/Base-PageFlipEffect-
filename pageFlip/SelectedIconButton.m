//
//  SelectedIconButton.m
//  Base按钮合集
//
//  Created by WKY on 16/9/11.
//  Copyright © 2016年 WKY. All rights reserved.
//

#import "SelectedIconButton.h"
#import "UIView+SetRect.h"
#import "UIView+AnimationProperty.h"

@interface SelectedIconButton ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIView *rectView;

@end

@implementation SelectedIconButton


- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        
        self.rectView = [[UIView alloc]initWithFrame:self.bounds];
        [self.contentView addSubview:self.rectView];
        
        self.imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"c"]];
        self.imageView.center = self.contentView.middlePoint;
        [self.contentView addSubview:self.imageView];
        
        self.rectView.layer.borderWidth = 3.f;
        self.rectView.layer.cornerRadius = 8.f;
        self.rectView.layer.borderColor = [[UIColor colorWithRed:0.137 green:0.624 blue:0.867 alpha:1] colorWithAlphaComponent:0.5f].CGColor;
        self.rectView.layer.masksToBounds = YES;
        
        self.selected = NO;
    }
    return self;
}

- (void)touchUpInside {

    self.selected = !self.selected;
    if (self.selected) {
     
        [self selectedState];
    }else {
    
        [self unSelectedState];
    }
    
}


- (void)layoutSubviews {

    [super layoutSubviews];
    
    self.imageView.center = self.contentView.center;
    self.rectView.frame = CGRectMake(0, 0, self.width, self.height);
}


#pragma mark ----- 状态
- (void)selectedState {

    self.imageView.alpha = 1.f;
    self.imageView.scale = 1.f;
    
    self.rectView.scale = 1.f;
    self.rectView.backgroundColor = [[UIColor colorWithRed:0.137  green:0.624  blue:0.867 alpha:1] colorWithAlphaComponent:0.2f];
}

- (void)unSelectedState {

    self.imageView.alpha = 0.f;
    self.imageView.scale = 1.1f;
    
    self.rectView.scale = 0.8f;
    self.rectView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.1f];
}

- (void)specialUnselectedState {
    
    self.imageView.alpha = 0.f;
    self.imageView.scale = 1.4f;
    
    self.rectView.scale = 0.8f;
    self.rectView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.1];
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
