//
//  ViewController.m
//  高级动画
//
//  Created by liuYaLin on 16/8/22.
//  Copyright © 2016年 微创软件. All rights reserved.
//

#import "ViewController.h"
//动画管理类头文件
#import "HMGLTransitionManager.h"
//模拟布匹的动画类型
#import "ClothTransition.h"
//3D动画类型
#import "Switch3DTransition.h"
//开门3D动画类型
#import "DoorsTransition.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _parentView=[[UIView alloc]initWithFrame:self.view.bounds ];
    
    _parentView.backgroundColor=[UIColor orangeColor];
    [self.view addSubview:_parentView];
    
    
    _imageView1=[[UIImageView alloc]initWithFrame:self.view.bounds];
    
    _imageView1.backgroundColor=[UIColor cyanColor];
    
    
    _imageView2=[[UIImageView alloc]init ];
    _imageView1.backgroundColor=[UIColor yellowColor];
    [_parentView addSubview:_imageView1];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [self aniMove];

}


-(void)aniMove
{
    //创建动画管理器对象
    HMGLTransitionManager *manager=[ HMGLTransitionManager  sharedTransitionManager ];
   
//    动画变化对象
    //  动画类型1  3D
    Switch3DTransition *sAnim=[[Switch3DTransition alloc]init ];
    
    //动画类型2 开门红
    DoorsTransition *doorTansition=[[DoorsTransition alloc]init ];
    [doorTansition setTransitionType:DoorsTransitionTypeOpen];
    //动画类型3， 画布
    ClothTransition *close=[[ClothTransition alloc]init ];
    
   //设置动画的方向类型
    [sAnim setTransitionType:Switch3DTransitionRight];
    //设置动画类型
    [manager setTransition:close];
    //设置动画视图的容器对象
    [manager beginTransition:_parentView];
    static BOOL isFirst=YES;
    if (isFirst) {
        //让第一个视图消失
        [_imageView1 removeFromSuperview];
        //将第二个视图添加到图像容器中
        _imageView2.frame=_imageView1.frame;
        [_parentView addSubview:_imageView2];
        
    }else{
    
        //让第二个视图消失
        [_imageView2 removeFromSuperview];
        //将第一个视图添加到图像容器中
        _imageView1.frame=_imageView2.frame;
        [_parentView addSubview:_imageView1];
        
    
    }
    isFirst =!isFirst;
    

    //提交动画运行效果
    [manager commitTransition];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
