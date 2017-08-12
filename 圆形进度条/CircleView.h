//
//  CircleView.h
//  圆形进度条
//
//  Created by andy on 15/10/23.
//  Copyright © 2015年 andy. All rights reserved.
//

#import <UIKit/UIKit.h>

// 角度转换为弧度
#define CoverToRadian(angle)                (M_PI * (angle) / 180.0f)

@interface CircleView : UIView

/**
 *  当前进度  范围0 ... 100
 */
@property (nonatomic, assign) CGFloat progress;

/**
 *  进度轨迹线宽 默认宽度 3.0f
 */
@property (nonatomic, assign) CGFloat trackLineWidth;

/**
 *  进度条线宽  默认宽度 5.0f
 */
@property (nonatomic, assign) CGFloat progressLineWidth;

/**
 *  进度轨迹的颜色 默认 [[UIColor greenColor] colorWithAlphaComponent:0.25];
 */
@property (nonatomic, strong) UIColor *trackColor;

/**
 *  圆形进度条 圆弧的起始角度  默认 -210°
 */
@property (nonatomic, assign) CGFloat startAngle;

/**
 *  圆形进度条 圆弧的终止角度  默认 30°
 */
@property (nonatomic, assign) CGFloat endAngle;

/**
 *  圆弧是否顺时针绘制  默认YES
 */
@property (nonatomic, assign) BOOL    colockwise;



- (instancetype)initWithFrame:(CGRect)frame;


@end

