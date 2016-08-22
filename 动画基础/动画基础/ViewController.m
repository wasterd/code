//
//  ViewController.m
//  动画基础
//
//  Created by liuYaLin on 16/8/22.
//  Copyright © 2016年 微创软件. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)createUI
{
    _iconImageView=[[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 60, 60) ];
    _iconImageView.backgroundColor=[UIColor cyanColor];
    [self.view addSubview:_iconImageView];
    //缩放
    _sclaeButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    _sclaeButton.frame=CGRectMake(100, 500, 100, 40);
    [_sclaeButton setTitle:@"缩放" forState:UIControlStateNormal];
    [_sclaeButton addTarget:self action:@selector(sclaeClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_sclaeButton];
    //移动
    _moveButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    _moveButton.frame=CGRectMake(100, CGRectGetMaxY(_sclaeButton.frame)+50, 100, 40);
    [_moveButton setTitle:@"移动" forState:UIControlStateNormal];
    [_moveButton addTarget:self action:@selector(moveClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_moveButton];
    
}
//缩放
-(void)sclaeClicked{
    //开始动画，准备动画的开始工作
    
    [UIView beginAnimations:nil context:nil];
    //设置动画时间
    [UIView setAnimationDuration:5];
    //设置动画代理对象
    [UIView setAnimationDelegate:self];
    /**
     *    UIViewAnimationCurveEaseInOut,     慢－快－慢
     UIViewAnimationCurveEaseIn,            慢－快
     UIViewAnimationCurveEaseOut,           快－慢
     UIViewAnimationCurveLinear   匀速
     */
    //设置动画的运动轨迹
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    
    //设置动画结束调用函数
    [UIView setAnimationDidStopSelector:@selector(stopAnim)];
    //目标位置
    _iconImageView.frame=CGRectMake(50, 50, 10, 10);
    //动画提交
    [UIView commitAnimations];

}
//移动
-(void)moveClicked{

    //开始动画，准备动画的开始工作
    
    [UIView beginAnimations:nil context:nil];
    //设置动画时间
    [UIView setAnimationDuration:5];
    //设置动画代理对象
    [UIView setAnimationDelegate:self];
    /**
     *    UIViewAnimationCurveEaseInOut,     慢－快－慢
     UIViewAnimationCurveEaseIn,            慢－快
     UIViewAnimationCurveEaseOut,           快－慢
     UIViewAnimationCurveLinear   匀速
     */
    //设置动画的运动轨迹
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    
    //设置动画结束调用函数
    [UIView setAnimationDidStopSelector:@selector(stopAnim)];
    //目标位置
    _iconImageView.frame=CGRectMake(200, 400, 60, 60);
    //动画提交
    [UIView commitAnimations];
    
}
-(void)stopAnim{

    NSLog(@"动画结束");

}

- (void) didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
