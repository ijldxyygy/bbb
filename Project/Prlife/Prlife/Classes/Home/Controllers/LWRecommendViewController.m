//
//  LWRecommendViewController.m
//  Prlife
//
//  Created by ijldxyygy on 15/10/28.
//  Copyright (c) 2015年 LinkXin. All rights reserved.
//

#import "LWRecommendViewController.h"
#import "UIBarButtonItem+Item.h"

#import "DetailsViewController.h"

@interface LWRecommendViewController ()

@end

@implementation LWRecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置左边的和右边
    //左边
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"leftBarButton"]highImage:[UIImage imageNamed:@"rightBarButton"]target:self action:nil forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem.title = @"扫扫";
    //右边
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"rightBarButton"] highImage:[UIImage imageNamed:@"leftBarButton"] target:self action:@selector(changping) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem.title = @"产品";//产品 详情页面

    self.navigationItem.title = @"推荐";
    
    
    //自定义cell tableview
    UITableView * main = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    
    
    
    [self.view addSubview:main];
    
    UIButton * buybutton = [UIButton createButtonWithFrame:CGRectMake(10*SCREENRATE, 440*SCREENRATE, SCREEN_WIDTH- 20*SCREENRATE, 43*SCREENRATE) Target:self Selector:@selector(buyProduction) Title:@"立即下单"];
    buybutton.backgroundColor = [UIColor blueColor];
    [self.view addSubview:buybutton];

    
    


}

- (void)changping {
//    ProductionViewController * production = [[ProductionViewController alloc]init];
//    self.tabBarController.tabBar.hidden = YES;
//    [self.navigationController pushViewController:production animated:YES];
}

-(void)buyProduction {
    DetailsViewController * detailsView = [[DetailsViewController alloc]init];
//    detailsView.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:detailsView animated:YES];

    //设置返回按钮 代表下一个控制器返回按钮
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backItem;
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
