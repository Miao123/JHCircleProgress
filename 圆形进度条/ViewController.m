//
//  ViewController.m
//  圆形进度条
//
//  Created by andy on 15/10/23.
//  Copyright © 2015年 andy. All rights reserved.
//

#import "ViewController.h"
#import "CIrcleView.h"
#import "UIView+NJ.h"
#import "Header.h"
#import "progressView.h"

@interface ViewController ()
@property (nonatomic, strong) CIrcleView *circleView;
@property (nonatomic, assign) NSInteger score;
@property (nonatomic, assign) CGFloat number;
@property (nonatomic, strong) progressView *cirProgressView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = RGB_COLOR(128, 128, 128);
    
    
    
    UIImageView *dashboardImageView = [[UIImageView alloc] init];
    dashboardImageView.frame = CGRectMake(0, 0, 215 * DISTENCEW , 136 * DISTENCEW );
    dashboardImageView.image = [UIImage imageNamed:@"仪表盘"];
    dashboardImageView.centerY = 150;
    dashboardImageView.centerX = screenWidth / 2;
    [self.view addSubview:dashboardImageView];
    
    
    _score = 100;
    CIrcleView *circleView = [[CIrcleView alloc] initWithFrame:CGRectMake(0 , 0 , 190 * DISTENCEW, 190 * DISTENCEW)];
    circleView.centerX = screenWidth / 2;
    circleView.centerY = dashboardImageView.centerY + 30 * DISTENCEW;
    if (_score <= 60) {
        _number = _score / 1.5;
    }
    if (_score > 60 && _score <= 80 ) {
        _number = 60 / 1.5 + _score - 60;
    }
    if (_score > 80 && _score <= 100 ) {
        _number =  80 * 3 / 4  + (_score - 80) * 2;
    }
    
    circleView.sliderNumber = _number / 100;
    circleView.circleRad = -(200 - _number * 2.2);
    self.circleView = circleView;
    [self.view addSubview:circleView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

