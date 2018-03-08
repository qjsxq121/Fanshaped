//
//  UILabel+LQCreatLabel.h
//  YiYo
//
//  Created by lq on 2017/12/3.
//  Copyright © 2017年 YiYo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (LQCreatLabel)

/**
 字体 和 颜色 创建 label

 @param textColor  字体颜色
 @param font 字体
 @return label
 */
+ (instancetype)creatLabelWithTextColor:(UIColor *)textColor font:(UIFont *)font;
@end
