//
//  FanViewController.m
//  Demo
//
//  Created by lq on 2018/3/6.
//  Copyright © 2018年 YiYoff. All rights reserved.
//

#import "FanViewController.h"
#import "PieView.h"
@interface FanViewController ()

@end

@implementation FanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"饼形图";
    
   [self darwPie];
  
  // [self drawCircle];
}

- (void)darwPie {
    PieView *pieView = [[PieView alloc] initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, SCREEN_WIDTH)];
    pieView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:pieView];
    pieView.dataArr = @[@1,@5,@10,@1,@4,@13];
    pieView.colorArr =@[RandomColor,RandomColor,RandomColor,RandomColor,RandomColor,RandomColor];
    pieView.outerCircleRadius = 100;
    pieView.innerCircleRadius = 50;
    [pieView strokeChart];
}

- (void)drawCircle {
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
   // shapeLayer.frame = CGRectMake(0, 100, SCREEN_WIDTH, 400);
    
    CGPoint center = CGPointMake(SCREEN_WIDTH / 2, 300);
   // UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(SCREEN_WIDTH / 2, 300) radius:SCREEN_WIDTH / 2-30 startAngle:-M_PI_2 endAngle:0 clockwise:YES];
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:center];
    [path addArcWithCenter:center radius:SCREEN_WIDTH / 2-30 startAngle:-M_PI_2 endAngle:0 clockwise:YES];
    [path closePath];
    shapeLayer.lineWidth = 10.0;
    shapeLayer.strokeColor = RandomColor.CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    
    shapeLayer.path = path.CGPath;
    //shapeLayer.strokeStart = 0.0f;
   // shapeLayer.strokeEnd = 0.34f;
    [self.view.layer addSublayer:shapeLayer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration  = 10.0;
    animation.fromValue = @0.0f;
    animation.toValue   = @1.0f;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.removedOnCompletion = YES;
    
    [shapeLayer addAnimation:animation forKey:@"circleAnimation"];
}



@end
