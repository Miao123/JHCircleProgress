//
//  UIBarButtonItem+NJ.m
//  
//
//  Created by apple on 14-7-7.
//  Copyright (c) 2014年 . All rights reserved.
//

#import "UIBarButtonItem+NJ.h"
#import "Header.h"
@implementation UIBarButtonItem (NJ)


+ (UIBarButtonItem *)itemImage:(NSString *)image highlightedImage:(NSString *)highlightedImage target:(id)target action:(SEL)action
{
    // 1.创建一个UIButton
    UIButton *btn = [[UIButton alloc] init];
    // 设置默认状态图片
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    // 设置高亮状态图片
    [btn setImage:[UIImage imageNamed:highlightedImage] forState:UIControlStateHighlighted];
    //设置 image 距离 btn 上下左右的位置
    btn.imageEdgeInsets = UIEdgeInsetsMake(2, -23, 2, 47);
//    btn.backgroundColor = WLColor(100, 100, 100);
   
    //给返回按钮 添加 title
    btn.titleLabel.text = @"返回";
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //设置 btn的 title 的位置
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, -50, 0, 0);
     // 设置size
     btn.frame = CGRectMake(0, 0 , 60, 40);
    // 监听点击事件
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    // 生成UIBarButtonItem
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

+(UIBarButtonItem *)itemimage:(NSString *)image target:(id)target action:(SEL)action{

    UIButton * butn = [[UIButton alloc]init];
    [butn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    butn.frame = CGRectMake(20 * DISTENCEW , 0 , 30 * DISTENCEW, 30 * DISTENCEW);
    [butn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc]initWithCustomView:butn];
    
}


+ (UIBarButtonItem *)itemTitle:(NSString *)title target:(id)target action:(SEL)action
{
    // 1.创建一个UIButton
    UIButton *btn = [[UIButton alloc] init];
    // 设置默认状态图片
    
    [btn setTitle:title forState:UIControlStateNormal];
    // 设置size
    //    btn.backgroundColor = [UIColor whiteColor];
//    btn.size = CGSizeMake(60, 40);
    // 监听点击事件
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    // 生成UIBarButtonItem
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

@end
