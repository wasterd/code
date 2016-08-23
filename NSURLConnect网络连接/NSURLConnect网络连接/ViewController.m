//
//  ViewController.m
//  NSURLConnect网络连接
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
    
    UIButton *connectButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    connectButton.frame=CGRectMake(100, 100, 100, 40);
    [connectButton setTitle:@"连接服务" forState:UIControlStateNormal];
    
    [connectButton addTarget:self action:@selector(connectClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:connectButton];
    _receiveData=[[NSMutableData alloc]init ];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)connectClicked{
    NSString *str=@"http://baidu.com";
    NSURL *url=[NSURL URLWithString:str];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    _connect =[NSURLConnection connectionWithRequest:request delegate:self];
}
/**
 *  连接成功调用此协议方法
 *
 *  @param connection 连接对象
 */
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{

    NSString *str=[[NSString alloc]initWithData:_receiveData encoding:NSUTF8StringEncoding ];
    NSLog(@"返回的数据：%@",str);


}
/**
 *  接收服务器返回的数据
 *
 *  @param connection 连接对象
 *  @param data       服务器返回的数据
 */
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{

    [_receiveData appendData:data];

   
}

/**
 *  处理服务器返回的响应码
 *
 *  @param connection 连接对象
 *  @param response   返回的状态吗
 */
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    NSHTTPURLResponse *res=(NSHTTPURLResponse *)response;
    if (res.statusCode == 200) {
        NSLog(@"连接成功！服务器正常");
    }else if (res.statusCode == 404){
        NSLog(@"服务器已正常开启，没有找到连接页面或数据");
    }else if (res.statusCode == 500){
        NSLog(@"服务器宕机或关机");
    }
    
}

/**
 *  连接错误时调用此协议方法
 *
 *  @param connection 连接对象
 *  @param error      错误信息
 */
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"连接失败:%@",error);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
