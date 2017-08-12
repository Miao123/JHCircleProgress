//
//  ViewController.m
//  圆形进度条
//
//  Created by andy on 15/10/23.
//  Copyright © 2015年 andy. All rights reserved.
//

#import "ViewController.h"
#import "CircleView.h"
@interface ViewController ()
// 进度增长步长
@property (nonatomic, assign) CGFloat step;

@property (nonatomic, strong) CircleView *progressView;

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 需要自定制的 请查看CircleView.h所提供的属性，也可修改.m文件
    _progressView = [[CircleView alloc] initWithFrame:CGRectMake(0, 0, 150, 150)];
    _progressView.center = self.view.center;
    _progressView.startAngle = - M_PI * 2;
    _progressView.endAngle   = 0;
    [self.view addSubview:_progressView];
    
    
    self.step = 1.0 / 30;
    _timer = [NSTimer scheduledTimerWithTimeInterval:self.step target:self selector:@selector(updateProgress) userInfo:nil repeats:YES];
}

- (void)updateProgress {
    CGFloat progress = self.progressView.progress;
    if (progress > 100) {
        [_timer invalidate];
        _timer = nil;
        return;
    }
    progress += 0.3;
    self.progressView.progress = progress;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

