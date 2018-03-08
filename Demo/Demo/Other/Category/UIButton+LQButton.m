//
//  UIButton+LQButton.m
//  YiYo
//
//  Created by lq on 2017/5/18.
//  Copyright © 2017年 YiYo. All rights reserved.
//

#import "UIButton+LQButton.h"

@implementation UIButton (LQButton)

- (void)setNormalTitle:(NSString *)normalTitle fontSize:(CGFloat)fontSize fontName:(NSString *)fontName normalColor:(UIColor *)normalColor selectedColor:(UIColor *)selectedColor {
    
    [self setTitle:normalTitle forState:UIControlStateNormal];
    [self.titleLabel setFont:[UIFont fontWithName:fontName size:fontSize]];
    [self setTitleColor:normalColor forState:UIControlStateNormal];
    [self setTitleColor:selectedColor forState:UIControlStateSelected];
    
}


+ (UIButton *)creatButtonWithTitle:(NSString *)title normalTitleColor:(UIColor *)titleColor font:(UIFont *)font {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button.titleLabel setFont:font];
    return button;
}
@end
