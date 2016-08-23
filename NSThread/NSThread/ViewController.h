//
//  ViewController.h
//  NSThread
//
//  Created by liuYaLin on 16/8/23.
//  Copyright © 2016年 微创软件. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    //定义线程对象1
    NSThread *_thread1;
    //定义线程对象2
    NSThread *_thread2;
    
     //定义一个计数器
    NSInteger _counter;
    
    //定义一个线程锁
    NSLock *_lock;

}
@end

