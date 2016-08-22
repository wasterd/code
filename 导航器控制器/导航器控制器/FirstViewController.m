//
//  FirstViewController.m
//  导航器控制器
//
//  Created by liuYaLin on 16/8/22.
//  Copyright © 2016年 微创软件. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"控制器一";
    self.view.backgroundColor=[UIColor cyanColor];
    
    // Do any additional setup after loading the view.
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    SecondViewController *svc=[[SecondViewController alloc]init ];
    //获取动画对象
    CATransition *ani=[CATransition animation];
    //设置动画时长
    ani.duration=1;
    //设置动画的类型，决定动画效果的形式
    ani.type=@"cube";
    //设置动画子类型
    ani.subtype=kCAGravityLeft;
    //设置动画的轨迹模式
    ani.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    [self.navigationController.view.layer addAnimation:ani forKey:nil];
    
    [self.navigationController pushViewController:svc animated:YES];

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
