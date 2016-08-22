
//
//  SecondViewController.m
//  导航器控制器
//
//  Created by liuYaLin on 16/8/22.
//  Copyright © 2016年 微创软件. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"控制器二";
    self.view.backgroundColor=[UIColor yellowColor];
    // Do any additional setup after loading the view.
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    //获取动画对象
    CATransition *ani=[CATransition animation];
    //动画时长
    ani.duration=1;
    //动画类型
    ani.type=@"rippleEffect";
    //设置动画子类型
    ani.subtype=kCATransitionFromLeft;
    //设置动画的轨迹模式
    ani.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    //将动画设置对象添加到动画上
    [self.navigationController.view.layer addAnimation:ani forKey:nil];
    
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
