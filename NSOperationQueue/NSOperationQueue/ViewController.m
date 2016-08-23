//
//  ViewController.m
//  NSOperationQueue
//
//  Created by liuYaLin on 16/8/23.
//  Copyright © 2016年 微创软件. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for(int  i=0;i<2;i++){
        UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame=CGRectMake(100, 100+80*i, 160, 40);
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        button.tag=100+i;
        if (i == 0) {
            [button setTitle:@"将任务1添加到队列" forState:UIControlStateNormal];
        } else if ( i == 1){
            [button setTitle:@"将任务2添加到队列" forState:UIControlStateNormal];

        }
        
        [self.view addSubview:button];
    }
    
    //创建一个队列
    _queue=[[NSOperationQueue alloc]init ];
    // 设置最大线程数，并发数
    _queue.maxConcurrentOperationCount=5;
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)buttonClicked:(UIButton *)btn
{
    if (btn.tag  == 100) {
        //创建一个任务
        /**
         p1：任务函数的拥有者
         p2:任务函数的执行体
         p3:任意参数
         */
        //方法1
        NSInvocationOperation *iop=[[NSInvocationOperation alloc]initWithTarget:self selector:@selector(opAct01:) object:@"opt1" ];
        [_queue addOperation:iop];
        
        // 方法2 来实现任务
//        NSInvocation *invo = [[NSInvocation alloc]init ];
//        invo.target = self;
//        invo.selector=@selector(opAct01:);
//        NSInvocationOperation *iop2=[[NSInvocationOperation  alloc]initWithInvocation:invo ];
//        [_queue addOperation:iop2];
//        
    }else if (btn.tag == 101){
    
        
        //使用block语法快来进行任务处理
        [_queue addOperationWithBlock:^{
            
            while (true) {
                NSLog(@"block opt  !");

            }
            
        }];
    }


}
//队列1
-(void)opAct01:(NSInvocationOperation *)opt{

    while (true) {
        NSLog(@"opt 1 !");
    }


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
