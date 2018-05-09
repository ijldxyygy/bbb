//
//  InsurableInterestViewController.m
//  Prlife
//
//  Created by ijldxyygy on 15/11/4.
//  Copyright © 2015年 LinkXin. All rights reserved.
//

#import "InsurableInterestViewController.h"
#import "SlideTabBarView.h"
@interface InsurableInterestViewController ()
@property (strong, nonatomic) SlideTabBarView *slideTabBarView;
@property (nonatomic,strong)UIView *fir;
@property (nonatomic,strong)UIView *sec;
@property (nonatomic,strong)UIView *thr;



@end

@implementation InsurableInterestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"利益演示";
    self.view.backgroundColor = [UIColor grayColor];
    self.navigationItem.rightBarButtonItem = nil;
    [self initSlideWithCount:3];

    
    
    
}

-(void) initSlideWithCount: (NSInteger) count{

    
    _slideTabBarView = [[SlideTabBarView alloc] initWithFrame:CGRectMake(0, 60, SCREEN_WIDTH, SCREEN_HEIGHT) WithCount:count];
    [self.view addSubview:_slideTabBarView];
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
