//
//  PieView.h
//  Demo
//
//  Created by lq on 2018/3/6.
//  Copyright © 2018年 YiYoff. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PieView : UIView

/** 数据 */
@property (nonatomic, strong) NSArray *dataArr;

/** 颜色 */
@property (nonatomic, strong) NSArray <UIColor *> *colorArr;

@property (nonatomic) CGFloat outerCircleRadius;
@property (nonatomic) CGFloat innerCircleRadius;
- (void)strokeChart;
- (void)addAnimation;

@end
