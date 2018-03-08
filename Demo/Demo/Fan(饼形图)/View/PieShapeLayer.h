//
//  PieShapeLayer.h
//  Demo
//
//  Created by lq on 2018/3/7.
//  Copyright © 2018年 YiYoff. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface PieShapeLayer : CAShapeLayer

/** 角度 */
@property (nonatomic, assign) double angle;

/** 是否选中 */
@property (nonatomic, assign) BOOL isSelected;
@end
