//
//  Header.h
//  测试进度条
//
//  Created by 苗建浩 on 2017/8/14.
//  Copyright © 2017年 苗建浩. All rights reserved.
//

#ifndef Header_h
#define Header_h

#import "UIView+NJ.h"
#import "UIViewExt.h"

//屏幕的宽度
#define screenWidth  [UIScreen mainScreen].bounds.size.width
#define screenHight  [UIScreen mainScreen].bounds.size.height

#define DISTENCEW (([UIScreen mainScreen].bounds.size.width) / 320)
#define DISTENCEH (([UIScreen mainScreen].bounds.size.height) / 568)

#define RGB_COLOR(R, G, B) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:1.0f]

#endif /* Header_h */
