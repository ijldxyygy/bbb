//
//  ViewController.m
//  circle
//
//  Created by ijldxyygy on 15/11/4.
//  Copyright © 2015年 LinkXin. All rights reserved.
//

#import "ViewController.h"
#import "circle.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    circle *slider = [[circle alloc] initWithFrame:CGRectMake(0, 0, 250, 250)];
    
    slider.center = self.view.center;
    
    
    
    [slider addTarget:self action:@selector(newValue:) forControlEvents:UIControlEventValueChanged];
    
    
    
    [slider changeAngle:240];
    
    [self.view addSubview:slider];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//值 改变响应事件
-(void)newValue:(circle *)slider{
    
    NSLog(@"newValue:%ld",(long)slider.angle);
    
}


@end
