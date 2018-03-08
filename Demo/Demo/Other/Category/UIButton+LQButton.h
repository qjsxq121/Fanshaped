//
//  UIButton+LQButton.h
//  YiYo
//
//  Created by lq on 2017/5/18.
//  Copyright © 2017年 YiYo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (LQButton)

/*
 * 设置button的title
      button的normalColor
      button的selectedColor
 */
- (void)setNormalTitle:(NSString *)normalTitle fontSize:(CGFloat)fontSize fontName:(NSString *)fontName normalColor:(UIColor *)normalColor selectedColor:(UIColor *)selectedColor;


/**
 根据title和颜色创建button

 @param title title
 @param titleColor titleColor
 @param font 字体
 @return button
 */
+ (UIButton *)creatButtonWithTitle:(NSString *)title normalTitleColor:(UIColor *)titleColor font:(UIFont *)font;
@end
