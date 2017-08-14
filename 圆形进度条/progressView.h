//
//  progressView.h
//  function
//
//  Created by andy on 16/4/27.
//  Copyright © 2016年 andy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CIrcleView.h"
@interface progressView : UIView
@property (nonatomic ,strong) CIrcleView *circleView;
@property (nonatomic, assign) NSInteger score;
@property (nonatomic, assign) CGFloat number;
@property (nonatomic, strong) UILabel *branchLabel;
@property (nonatomic, strong) UILabel *stateLable;
@property (nonatomic, assign) NSInteger changeScore;

- (void) getPregressView;

@end
