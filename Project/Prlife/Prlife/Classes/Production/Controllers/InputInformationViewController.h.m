//
//  InputInformationViewController.m
//  Prlife
//
//  Created by WenLongWen on 15/11/3.
//  Copyright © 2015年 LinkXin. All rights reserved.
//

#import "InputInformationViewController.h"
@interface InputInformationViewController ()<UIScrollViewDelegate>

@end

@implementation InputInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.navigationItem.title = @"录入信息";
    self.navigationItem.rightBarButtonItem = nil;
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIScrollView * scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, (110-64) * SCREENRATE +64 , SCREEN_WIDTH , SCREEN_HEIGHT - ((110-64) * SCREENRATE +64))];
    scrollView.backgroundColor = [UIColor greenColor];
    // 是否支持滑动最顶端
        scrollView.scrollsToTop = NO;
    scrollView.delegate = self;
    // 设置内容大小
    scrollView.contentSize = CGSizeMake(0 , 720 *SCREENRATE);
    // 是否反弹
        scrollView.bounces = NO;
    // 是否分页
    //    scrollView.pagingEnabled = YES;
    // 是否滚动
        scrollView.scrollEnabled = YES;
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.showsVerticalScrollIndicator = NO;
    // 设置indicator风格
    //    scrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    // 设置内容的边缘和Indicators边缘
        scrollView.contentInset = UIEdgeInsetsMake((110-64) * SCREENRATE +64, 0, 0, 0);
    //    scrollView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 50, 0, 0);
    // 提示用户,Indicators flash
//    [scrollView flashScrollIndicators];
    // 是否同时运动,lock
    scrollView.directionalLockEnabled = YES;
//    scrollView.contentOffset = CGPointMake(0, -64);

//    CGSize newSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height+1);
//    [scrollView setContentSize:newSize];
    [self.view addSubview:scrollView];
    
    UILabel * name = [UILabel dynamicWidthLabelWithPointX:10 *SCREENRATE pointY:1 height:15.0 color:[UIColor blackColor] font:[UIFont systemFontOfSize:14.0] textAlignment:NSTextAlignmentLeft Text:@"姓名："];
    UILabel * age = [UILabel dynamicWidthLabelWithPointX:0 *SCREENRATE pointY:0 height:700 color:[UIColor blackColor] font:[UIFont systemFontOfSize:14.0] textAlignment:NSTextAlignmentLeft Text:@"ldasfklasjdfklasjdflk："];

    [scrollView addSubview:name];
    [scrollView addSubview:age];


    

    
    
    
}

- (void)dereaseChange {
    
}

- (void)increaseChange {
    
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
