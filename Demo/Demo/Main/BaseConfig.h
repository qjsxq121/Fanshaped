//
//  BaseConfig.h
//  BFGP
//
//  Created by lq on 2017/9/25.
//  Copyright © 2017年 bfgp. All rights reserved.
//

#ifndef BaseConfig_h
#define BaseConfig_h


#ifdef DEBUG
#define BSLog(...) NSLog(@"%s  %d\n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__ ])

#else // 发布状态, 关闭LOG功能

//  navigationbar  44
// tablebar   49
#define BSLog(...)
#endif


/** 弱引用 */
#define WEAKSELF __weak typeof(self) weakSelf = self

// 数字的字体
#define NUMBER_FONT_NAME   @"SFU DIN"

// 弹出控制器的时候会用
#define UIColorFromHEX(hexValue, alphaValue) \
[UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 \
green:((float)((hexValue & 0x00FF00) >> 8))/255.0 \
blue:((float)(hexValue & 0x0000FF))/255.0 \
alpha:alphaValue]

#define UIColorWithHex(_hex_)   [UIColor colorWithHexString:((__bridge NSString *)CFSTR(#_hex_))]
#define TSColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define TSColorAlpha(r, g, b, a)  [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#define TSGrayColor(v,a)  TSColorAlpha((v),(v),(v),(a))


#define CommonbackgroundColor [UIColor whiteColor]
#define GrayBackgroundColor  UIColorWithHex(#f9f9f9)

#define LineColor  UIColorWithHex(#eeeeee)

#define GrayFontColor  UIColorWithHex(#959595)

#define BlueFontColor  UIColorWithHex(1482f0)

//#define PCRedColor   UIColorWithHex(#F11A1A)

// 按钮蓝色背景
#define BlueBackGroundColor TSColor(0, 144, 229)

#define CyanBackGroundColor TSColor(241, 240, 248)
//#define Topic_Gray BFHexRGB(0x666666)
//#define Topic_DeepBlack BFHexRGB(0x333333)

// 浅灰色
// 背景色
//#define LightGrayolor [UIColor colorWithRed:181.0/255.0 green:181.0/255.0 blue:181.0/255.0 alpha:1.0]

#define TITLE_COLOR  UIColorWithHex(#141414)
#define TITLE_GARY_COLOR  UIColorWithHex(#a1a1a1)
#define SUBTITLE_COLOR  UIColorWithHex(#959595)
// 随机色
#define RandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]
// 判断版本
#define IOS10_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0)
#define IOS9_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)
#define IOS8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define IOS7_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define IOS11_OR_LATER  ([[[UIDevice currentDevice] systemVersion] floatValue] >= 11.0)

#define SYSTEMVERSION_UNDER_IOS11  ([[[UIDevice currentDevice] systemVersion] floatValue] < 11.0)


#define scalX  [UIScreen mainScreen].bounds.size.width / 375
#define scalY  [UIScreen mainScreen].bounds.size.height / 667
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
// 像素
#define scale_screen     [UIScreen mainScreen].scale
#define MainPixelWidth   SCREEN_WIDTH *scale_screen
#define MainPixelHeight  SCREEN_HEIGHT *scale_screen

#define kScreenIphone5   (SCREEN_WIDTH < 350)
#define DEVICE_IPHONE5    (SCREEN_WIDTH == 320)
#define DEVICE_IPHONE6    (SCREEN_WIDTH == 375)
#define DEVICE_IPHONE6P   (SCREEN_WIDTH == 414)



/** 导航栏 + 状态栏 高度 */
#define NavigationBarHeight (SCREEN_HEIGHT == 812.0 ? 88 : 64)


// 导航栏的高度
#define NavHeight   44


//tabBar的高度
#define TabBarHeight  (SCREEN_HEIGHT == 812.0 ? 83 : 49)

// 状态栏高度
#define  StatusBarHeight   (SCREEN_HEIGHT == 812.0 ? 44 : 20)

/**费率榜没一个费率列的宽度 */
#define  RateItemWidth   SCREEN_WIDTH / 3.7 * 0.9
/** 费率榜股票名字的宽度 */
#define  NameViewWidth  SCREEN_WIDTH / 3.7


/** 行情模块相关数据 **/
/** 首页线的颜色 */
#define MarketThempeAndBottomLineColor  TSGrayColor(233, 1.0)

#define FontWithSize(fontSize) [UIFont systemFontOfSize:(fontSize)]



#endif /* BaseConfig_h */
