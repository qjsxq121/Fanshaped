//
//  PieView.m
//  Demo
//
//  Created by lq on 2018/3/6.
//  Copyright © 2018年 YiYoff. All rights reserved.
//

#import "PieView.h"
#import "PieShapeLayer.h"
@interface PieView ()

/** 整体的layer */
@property (nonatomic, strong) CAShapeLayer *pieLayer;
/** 线宽度 */
@property (nonatomic, assign) CGFloat borderWidth;

/** 半径 */
@property (nonatomic, assign) CGFloat radius;


/** 中心 */
@property (nonatomic, assign) CGPoint pointCenter;


/** 线开始点距中心的长度 */
@property (nonatomic, assign) CGFloat lineStartLength;

/** 线的第一段长度 */
@property (nonatomic, assign) CGFloat firstLength;

@end
@implementation PieView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.radius = 75;
        self.borderWidth = 50;
        _pointCenter = CGPointMake(CGRectGetMidX(self.bounds),CGRectGetMidY(self.bounds));
        _lineStartLength = _outerCircleRadius = _radius + _borderWidth / 2;
        _firstLength = 10;
    }
    return self;
}

- (CAShapeLayer *)pieLayer {
    if (!_pieLayer) {
        _pieLayer = [CAShapeLayer layer];
        UIBezierPath *bgPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetMidX(self.bounds),CGRectGetMidY(self.bounds)) radius:_radius startAngle:-M_PI_2 endAngle:M_PI_2 * 3 clockwise:YES];
     _pieLayer = [CAShapeLayer layer];
        _pieLayer.lineWidth = _radius * 3;
        _pieLayer.strokeColor = [UIColor blackColor].CGColor;
        _pieLayer.fillColor = [UIColor clearColor].CGColor;
        _pieLayer.path = bgPath.CGPath;

    }
    return _pieLayer;
}


#pragma mark -- 画法一
- (void)strokeChart {
    
    // 此方法 是不同的path  更像是 分别画出扇形拼接  性能没有方法二 高 但是 这个方法可以区分 layer的path 扇形上有点击事件 可以用来区分
    
    CGFloat total = [[_dataArr valueForKeyPath:@"@sum.floatValue"] floatValue];
    // 开始角度
    CGFloat startAngle = -M_PI_2;
    // 结束角度
    CGFloat endAngle = 0;
    
    
    // 线的终点距离边界的距离
    CGFloat lineMargin = 40;
    for (NSInteger i = 0; i <_dataArr.count;i++) {
        CGFloat num = [_dataArr[i] floatValue];
        endAngle = num / total * 2 * M_PI + startAngle;
         UIBezierPath *path = [UIBezierPath bezierPath];
        [path addArcWithCenter:_pointCenter radius:_radius startAngle:startAngle endAngle:endAngle clockwise:YES];
        PieShapeLayer *layer = [PieShapeLayer layer];
        layer.lineWidth = _borderWidth;
        layer.strokeColor = _colorArr[i].CGColor;
        layer.fillColor = [UIColor clearColor].CGColor;
        layer.angle = num / total * 2 * M_PI / 2 + startAngle;
        layer.path = path.CGPath;
        [self.layer addSublayer:layer];
       
         startAngle = endAngle;
        
        // 画线
        UIBezierPath *linePath = [UIBezierPath bezierPath];
        
            // 开始的点
        CGPoint lineStartPoint = CGPointMake(_pointCenter.x + _lineStartLength * cos(layer.angle), _pointCenter.y + _lineStartLength * sin(layer.angle));
        
        // 中间转折点
        CGPoint middlePoint = CGPointMake(_pointCenter.x + (_lineStartLength + _firstLength) * cos(layer.angle), _pointCenter.y + (_lineStartLength + _firstLength) * sin(layer.angle));
        
        // 终点
        CGPoint endPoint;
        
        // 添加显示百分比的label
        UILabel *presentLabel = [[UILabel alloc] init];
        [presentLabel setFont:[UIFont systemFontOfSize:11]];
        presentLabel.textColor = [UIColor whiteColor];
        presentLabel.text = [NSString stringWithFormat:@"%0.2f%%",num / total * 100];
        [self addSubview:presentLabel];
        if (-M_PI_2 < layer.angle  && layer.angle < M_PI_2) {
        // 在右边
             endPoint = CGPointMake(CGRectGetMaxX(self.bounds) - lineMargin, middlePoint.y);
            
            presentLabel.lq_size = CGSizeMake(lineMargin, 10);
            presentLabel.lq_centerY = endPoint.y;
            presentLabel.lq_x = endPoint.x;
        } else {
            // 在左边
             endPoint = CGPointMake(CGRectGetMinX(self.bounds) + lineMargin, middlePoint.y);
            presentLabel.lq_size = CGSizeMake(lineMargin, 10);
            presentLabel.lq_centerY = endPoint.y;
            presentLabel.lq_x = CGRectGetMinX(self.bounds);
        }
        
        
        [linePath moveToPoint:lineStartPoint];
        [linePath addLineToPoint:middlePoint];
        
        [linePath addLineToPoint:endPoint];
        
        
        
        CAShapeLayer *lineLayer = [CAShapeLayer layer];
        lineLayer.strokeColor = [UIColor redColor].CGColor;
        lineLayer.fillColor = [UIColor clearColor].CGColor;
        lineLayer.path = linePath.CGPath;
        [self.layer addSublayer:lineLayer];
        
    }
    // 动画
   // self.layer.mask = self.pieLayer;
    
   // [self addAnimation];
}


#pragma mark -- 画法二
- (void)storePie {
    
    // 此方法用同一个path 根据layer.strokeStart = start; layer.strokeEnd = end 区分扇形 并 设置每一个扇形的颜色 性能高  但是当点击扇形时不能区分具体点击哪一个扇形
    CGFloat total = [[_dataArr valueForKeyPath:@"@sum.floatValue"] floatValue];
    // 开始位置
    CGFloat start = 0.0f;
    // 结束位置
    CGFloat end = 0.0f;
      UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetMidX(self.bounds),CGRectGetMidY(self.bounds)) radius:_radius startAngle:-M_PI_2 endAngle:M_PI_2 * 3 clockwise:YES];
    for (NSInteger i = 0; i <_dataArr.count;i++) {
        
        CGFloat num = [_dataArr[i] floatValue];
        end = num / total + start;
        PieShapeLayer *layer = [PieShapeLayer layer];
        layer.lineWidth = _borderWidth;
        layer.strokeColor = _colorArr[i].CGColor;
        layer.fillColor = [UIColor clearColor].CGColor;
        layer.strokeStart = start;
        layer.strokeEnd = end;
        layer.path = path.CGPath;
        [self.layer addSublayer:layer];
        start = end;
    }
    self.layer.mask = self.pieLayer;
    
    [self addAnimation];
}




- (void)addAnimation {
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration  = 2.0;
    animation.fromValue = @0.0f;
    animation.toValue   = @1.0f;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.removedOnCompletion = YES;
    
    [self.pieLayer addAnimation:animation forKey:@"circleAnimation"];
}


#pragma mark -- 点击移动
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //CGPoint point = [touches.anyObject locationInView:self];
    
   // [self updatePositonWithPoint:point];
}

#pragma mark -- 更新layer的位置
- (void)updatePositonWithPoint:(CGPoint)point {
    
    CGFloat  ddd = 10;
    for (PieShapeLayer *layer in self.layer.sublayers  ) {
        
        if (CGPathContainsPoint(layer.path, &CGAffineTransformIdentity, point, 0) && !layer.isSelected) {
            layer.isSelected = YES;
            
            CGPoint newPosition =CGPointMake(layer.position.x +  ddd* cos(layer.angle), layer.position.y + ddd * sin(layer.angle));
            layer.position = newPosition;
        } else {
            layer.position = CGPointMake(0, 0);
            layer.isSelected = NO;
        }
        
    }
}


@end
