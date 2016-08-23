//
//  ViewController.h
//  NSURLConnect网络连接
//
//  Created by liuYaLin on 16/8/23.
//  Copyright © 2016年 微创软件. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<
//连接服务器的普通代理协议，做为错误处理等普通协议
NSURLConnectionDelegate,
//连接服务器对象的数据代理协议，当回传数据时使用的协议
NSURLConnectionDataDelegate>
{
    //定义一个连接对象
    NSURLConnection *_connect;
    //用来接收返回的数据
    NSMutableData *_receiveData;

}

@end

