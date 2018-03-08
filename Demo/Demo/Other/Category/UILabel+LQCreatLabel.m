//
//  UILabel+LQCreatLabel.m
//  YiYo
//
//  Created by lq on 2017/12/3.
//  Copyright © 2017年 YiYo. All rights reserved.
//

#import "UILabel+LQCreatLabel.h"

@implementation UILabel (LQCreatLabel)

+ (instancetype)creatLabelWithTextColor:(UIColor *)textColor font:(UIFont *)font {
    UILabel *label = [UILabel new];
    [label setTextColor:textColor];
    [label setFont:font];
    return label;
}
@end
