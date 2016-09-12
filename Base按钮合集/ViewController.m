//
//  ViewController.m
//  Base按钮合集
//
//  Created by WKY on 16/9/11.
//  Copyright © 2016年 WKY. All rights reserved.
//

#import "ViewController.h"
#import "UIView+SetRect.h"
#import "SelectedIconButton.h"
#import "CALayer+SetRect.h"
#import "POP.h"
#import "Math.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) CALayer *layer;
@property (nonatomic, strong) Math *math;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Width, Height)];
    [self.view addSubview:self.contentView];
    
    
     /*
      //button 点击效果
    SelectedIconButton *button = [[SelectedIconButton alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    button.center              = self.contentView.middlePoint;
    button.selected            = YES;
    button.target              = self;
    button.selector            = @selector(buttonsEvent:);
    [self.contentView addSubview:button];
    */
    
    
    // 翻书效果
    UIImage *image = [UIImage imageNamed:@"pic_1"];
    CGSize size = [Math resetFromSize:image.size withFixedWidth:self.view.width/2.f];
    
    // layer
    _layer = [CALayer layer];
    _layer.anchorPoint = CGPointMake(1.f, 0.5f);
    _layer.frame = CGRectMake(0, 0, self.view.width/2, size.height);
    _layer.position = CGPointMake(self.view.width/2, self.contentView.middleY);
    _layer.contents = (__bridge id)([UIImage imageNamed:@"pic_1"].CGImage);
    _layer.borderColor = [UIColor blackColor].CGColor;
    _layer.borderWidth = 4.f;
    _layer.masksToBounds = YES;
    _layer.allowsEdgeAntialiasing = YES; // 抗锯齿
    _layer.transform = CATransform3DMakeRotation([Math radianFromDegree:0], 0.0, 1.0, 00);
//    _layer.transform = catransform3d
    [self.contentView.layer addSublayer:_layer];
    
    // 一元一次方程
    self.math = [Math mathOnceLinearEquationWithPointA:MATHPointMake(0,0) PointB:MATHPointMake(self.view.width,180)];
    
    //  手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePan:)];
    [self.view addGestureRecognizer:pan];
}

- (void)handlePan:(UIPanGestureRecognizer *)sender {

    CGPoint curPoint = [sender locationInView:sender.view];
    CGFloat x = curPoint.x;
    
    // 初始化3D变换，获取默认值
    CATransform3D perspectiveTransform = CATransform3DIdentity;
    
    //透视
    perspectiveTransform.m34 = -1.0/2000.0;
    
    // 空间旋转
    perspectiveTransform = CATransform3DRotate(perspectiveTransform, [Math radianFromDegree:x * self.math.k], 0, 1, 0);
    [CATransaction setDisableActions:YES];
    _layer.transform = perspectiveTransform;
    _layer.contents = (__bridge id)([UIImage imageNamed:x >= self.view.width/2.0f ? @"pic_2" : @"pic_1"].CGImage);
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        
        // 初始化3D变换，获取默认值
        CATransform3D perspectiveTransform = CATransform3DIdentity;
        
        // 透视
        perspectiveTransform.m34 = -1.0/2000.0;
        
        // 空间旋转
        perspectiveTransform = CATransform3DRotate(perspectiveTransform, [Math radianFromDegree:x >= self.view.width/2.0f ? 180 : 0], 0, 1, 0);
        
        [CATransaction setDisableActions:NO];
        _layer.transform = perspectiveTransform;
    }
    
}




/*
- (void)buttonsEvent:(id)sender {
    
    if ([sender isKindOfClass:[SelectedIconButton class]]) {
        
        SelectedIconButton *button = sender;
        NSLog(@"SelectedIconButton %@", [NSString stringWithFormat:@"%@", button.selected == YES ? @"selected" : @"unSelected"]);
        
    }
//    else if ([sender isKindOfClass:[POPPressButton class]]) {
//        
//        NSLog(@"%@ Event", sender);
//    }
    
}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
