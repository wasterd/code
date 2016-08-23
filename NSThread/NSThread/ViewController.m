//
//  ViewController.m
//  NSThread
//
//  Created by liuYaLin on 16/8/23.
//  Copyright © 2016年 微创软件. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end
/**
 
 */
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /**
     * initWithTarget:  实例方法创建线程
     * detachNewThreadSelector:  类方法创建线程
     * lock:  线程加锁
     * unlock: 线程解锁
     *  sleepForTimeInterval :线程休眠
     */
    
    

    for (int i=0; i<3; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake(100, 100+80*i, 80, 40);
        button.tag = 100+i;
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        if (i == 0) {
            [button setTitle:@"启动线程" forState:UIControlStateNormal];
        }else if (i == 1){
            [button setTitle:@"启动线程1" forState:UIControlStateNormal];

        }else if (i == 2){
            [button setTitle:@"启动线程2" forState:UIControlStateNormal];

        }
        
        [self.view addSubview:button];
    }
    
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)buttonClicked:(UIButton *)btn
{
    if (btn.tag == 100) {
        
        //创建一个线程对象
        /**
         P1: 线程对象运行函数的拥有者
         P2: 线程处理函数
         P3:线程参数
         */
        NSThread *newT=[[NSThread alloc]initWithTarget:self selector:@selector(actNew:) object:nil ];
        
        
        [newT start];
        
    }else if (btn.tag == 101){
        //创建并启动线程
        [NSThread detachNewThreadSelector:@selector(actT1) toTarget:self withObject:nil];
        
    }else if(btn.tag == 102) {
        _thread2=[[NSThread alloc]initWithTarget:self selector:@selector(actT2) object:nil ];
        [_thread2 start];
    }


    _lock=[[NSLock alloc]init ];
}

-(void)actNew:(NSThread *)thread
{
    int i=0;
    while (true) {
        i++;
        NSLog(@"%d",i);
    }
    
}
-(void)actT1{
    
    int  i=0;

    while (true) {
        i++;
        if (i>=10001) {
            break;
        }
        [_lock lock];
        _counter ++;
        [_lock unlock];
        NSLog(@"c1=%ld",_counter);
    
    }
    NSLog(@"c1_finnal=%ld",_counter);

}
-(void)actT2{
    
    int  i=0;
    
    while (true) {
        i++;
        if (i>=10001) {
            break;
        }
        //加锁 使加法操作线程安全
        [_lock lock];
        _counter ++;
        [_lock unlock];
        NSLog(@"c2=%ld",_counter);
        
    }
    NSLog(@"c2_finnal=%ld",_counter);

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
