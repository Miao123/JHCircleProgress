//
//  CIrcleView.m
//  CIrcle
//
//  Created by mac on 15/11/25.
//  Copyright © 2015年 leiliang. All rights reserved.
//

#import "CIrcleView.h"
#import "Header.h"
#define CoverToRadian(angle)                (M_PI * (angle) / 180.0f)

@interface CIrcleView ()

@property (nonatomic, assign) CGFloat radius;

@end

@implementation CIrcleView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    // 画半圆
    CAShapeLayer *circlelayer = [CAShapeLayer layer];
    circlelayer.lineWidth = 2.5;
    circlelayer.lineCap = kCALineCapRound;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
        circlelayer.strokeColor = [UIColor colorWithWhite:1.000 alpha:0.320].CGColor;
    }else{
        circlelayer.strokeColor = RGB_COLOR(220, 220, 220).CGColor;
    }
    circlelayer.fillColor = [UIColor clearColor].CGColor;
    
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddArc(path, &CGAffineTransformIdentity, CGRectGetWidth(self.frame) / 2, CGRectGetHeight(self.frame) / 2, self.radius, CoverToRadian(-200), CoverToRadian(20), NO);
    
    circlelayer.path = path;
    [self.layer addSublayer:circlelayer];
    
    // 动态brown circle
    
    CAShapeLayer *brownlayer = [CAShapeLayer layer];
    brownlayer.lineWidth = 2.5f;
    brownlayer.lineCap = kCALineCapRound;
    //    判断是iPhone还是iPad
    NSString *fileName = nil;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
        fileName = @"GS_TravelRequestMobilizationFlow_iPhone";
        brownlayer.strokeColor = [UIColor whiteColor].CGColor;
    }else{
        brownlayer.strokeColor = RGB_COLOR(76, 183, 188).CGColor;
    }
    
    brownlayer.fillColor = [UIColor clearColor].CGColor;
    
    CGMutablePathRef brownPath = CGPathCreateMutable();
    CGPathAddArc(brownPath, &CGAffineTransformIdentity, CGRectGetWidth(self.frame) / 2, CGRectGetHeight(self.frame) / 2, self.radius, CoverToRadian(-200), CoverToRadian(20), NO);
    
    brownlayer.path = path;
    [self.layer addSublayer:brownlayer];
    
    brownlayer.strokeEnd = self.sliderNumber;
    
    {
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        animation.duration = 1.0f;
        animation.fromValue = @0;
        animation.toValue = @(self.sliderNumber);
        animation.autoreverses = NO;
        animation.fillMode = kCAFillModeForwards;
        [brownlayer addAnimation:animation forKey:@"strokeEndAnimation"];
    }
    
    // 小绿点
    UIImageView *pointView = [[UIImageView alloc] init];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
        fileName = @"GS_TravelRequestMobilizationFlow_iPhone";
        pointView.frame = CGRectMake(0, 0, 16, 16);
        pointView.image = [UIImage imageNamed:@"小亮点"];
    }else{
        pointView.frame = CGRectMake(0, 0, 6 , 6);
        pointView.image = [UIImage imageNamed:@"iPad小白点"];
    }
    pointView.backgroundColor = [UIColor clearColor];
    pointView.clipsToBounds = YES;
    //    [pointView.layer setCornerRadius:8];//设置矩形四个圆角半径
    
    //    pointView.layer.cornerRadius = 4;
    
    CAKeyframeAnimation *frameAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    frameAnimation.calculationMode = kCAAnimationPaced;
    frameAnimation.fillMode = kCAFillModeForwards;
    frameAnimation.removedOnCompletion = NO;
    frameAnimation.duration = 1.0f;
    //    frameAnimation.speed = 2;
    
    CGMutablePathRef pointPath = CGPathCreateMutable();
    CGPathAddArc(pointPath, &CGAffineTransformIdentity, CGRectGetWidth(self.frame) / 2, CGRectGetHeight(self.frame) / 2, self.radius,CoverToRadian(-201), CoverToRadian(self.circleRad), NO);
    
    frameAnimation.path = pointPath;
    CGPathRelease(pointPath);
    
    [pointView.layer addAnimation:frameAnimation forKey:@"curve"];
    [self addSubview:pointView];
}

- (CGFloat)radius {
    return  CGRectGetWidth(self.frame) / 2;
}

@end
