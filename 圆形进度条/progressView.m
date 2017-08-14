//
//  progressView.m
//  function
//
//  Created by andy on 16/4/27.
//  Copyright © 2016年 andy. All rights reserved.
//

#import "progressView.h"
#import "CIrcleView.h"
#import "Header.h"

@implementation progressView

- (void)getPregressView{
    
    UIImageView *dashboardImageView = [[UIImageView alloc] init];
    dashboardImageView.frame = CGRectMake(0, 0, 215 * DISTENCEW , 136 * DISTENCEW );
    dashboardImageView.image = [UIImage imageNamed:@"仪表盘"];
    dashboardImageView.centerY = 150;
    //    dashboardImageView.centerX = self.centerX;
    [self addSubview:dashboardImageView];
    
    
    _circleView = [[CIrcleView alloc] initWithFrame:CGRectMake(0 ,0, 190 * DISTENCEW, 190 * DISTENCEW)];
//    _circleView.centerX = screenHight / 2;
    _circleView.centerY = dashboardImageView.centerY + 30 * DISTENCEW;
    
    
    if (_score <= 60) {
        _number = _score / 1.5;
    }
    if (_score > 60 && _score <= 80 ) {
        _number = 60 / 1.5 + _score - 60;
    }
    if (_score > 80 && _score <= 100 ) {
        _number =  80 * 3 / 4  + (_score - 80) * 2;
    }
    
    _circleView.sliderNumber = _number / 100;
    _circleView.circleRad = -(200 - _number * 2.2);
    [self addSubview:_circleView];
    
    CGFloat timet = 1.0 / _score;
    if (_score != 0){
        [NSTimer scheduledTimerWithTimeInterval:  timet  target:self selector:@selector(labeltext:) userInfo:nil repeats:YES];
    }else{
        [NSTimer scheduledTimerWithTimeInterval:  0.1  target:self selector:@selector(labeltext:) userInfo:nil repeats:YES];
    }
    [NSTimer scheduledTimerWithTimeInterval: 1.0 / _score target:self selector:@selector(labeltext:) userInfo:nil repeats:YES];
    
    //    分数
    _branchLabel = [[UILabel alloc] initWithFrame:CGRectMake( 0 , 0, 100 * DISTENCEW, 50 * DISTENCEW)];
    _branchLabel.font = [UIFont systemFontOfSize:45 * DISTENCEW];
    _branchLabel.textAlignment = NSTextAlignmentCenter;
    _branchLabel.centerX = screenWidth / 2;
    _branchLabel.centerY = _circleView.centerY - 30;
    _branchLabel.textColor = [UIColor whiteColor];
    [self addSubview:_branchLabel];
    
    
    //  分数状态
    self.stateLable = [[UILabel alloc] init];
    self.stateLable.frame = CGRectMake(0, 0, 100 * DISTENCEW , 25 * DISTENCEW);
    _stateLable.font = [UIFont boldSystemFontOfSize:18 * DISTENCEW];
    _stateLable.textColor = [UIColor whiteColor];
    _stateLable.textAlignment = NSTextAlignmentCenter;
    _stateLable.centerX = _branchLabel.centerX;
    _stateLable.centerY = _circleView.centerY + 10 * DISTENCEW;
    [self addSubview:_stateLable];
    
    
    //    时间
    UILabel *evaluationTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _stateLable.bottom, screenHight, 15)];
    NSString *date;
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"YYYY.MM.dd"];
    date = [formatter stringFromDate:[NSDate date]];
    evaluationTimeLabel.text = [NSString stringWithFormat:@"评测时间:%@",date];
    evaluationTimeLabel.font = [UIFont systemFontOfSize:10 * DISTENCEW];
    evaluationTimeLabel.textAlignment = NSTextAlignmentCenter;
    evaluationTimeLabel.textColor = [UIColor whiteColor];
    [self addSubview:evaluationTimeLabel];
}

-(void)labeltext:(NSTimer *)timer
{
    _changeScore++;
    if (_changeScore <= 59) {
        _stateLable.text = @"状态不及格";
    }
    if (_changeScore > 59&&_changeScore <= 69) {
        _stateLable.text = @"状态及格";
    }
    if (_changeScore > 69&&_changeScore <= 79) {
        _stateLable.text = @"状态中等";
    }
    if (_changeScore > 79&&_changeScore <= 89) {
        _stateLable.text = @"状态良好";
    }
    if (_changeScore > 89&&_changeScore <= 100) {
        _stateLable.text = @"状态优秀";
    }
    _branchLabel.text = [NSString stringWithFormat:@"%ld", (long)_changeScore];
    if (_changeScore > _score - 1) {
        _changeScore = 0;
        self.userInteractionEnabled = YES;
        
        [timer invalidate];
    }
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
