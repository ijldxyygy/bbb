//
//  LWActivityViewController.m
//  Prlife
//
//  Created by ijldxyygy on 15/10/28.
//  Copyright (c) 2015年 LinkXin. All rights reserved.
//

#import "LWActivityViewController.h"
#import "UIBarButtonItem+Item.h"
#import "LWBannerTableViewCell.h"
@interface LWActivityViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSString * month;
@property (nonatomic,strong)UIButton * monthbutton;
@property (nonnull,strong) UITableView * bannerTableView ;
@end

@implementation LWActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.month = @"7月";
    //设置左边的和右边
    //左边
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"leftBarButton"]highImage:[UIImage imageNamed:@"rightBarButton"]target:self action:nil forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem.title = @"扫一扫";
    //右边
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"rightBarButton"] highImage:[UIImage imageNamed:@"leftBarButton"] target:self action:nil forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem.title = @"提问";
    self.navigationItem.title = @"活动";
    
    
    UITableView * activitytable = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    [self.view addSubview:activitytable];
    self.bannerTableView = activitytable;
    self.bannerTableView.delegate = self;
    self.bannerTableView.dataSource = self;
    self.bannerTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    UIButton * month = [[UIButton alloc]initWithFrame:CGRectMake(12 * SCREENRATE, 64, 30, 30)];
//    [month setImage:[UIImage imageNamed:@"rightBarButton"] forState:UIControlStateNormal];
    [month setBackgroundImage:[UIImage imageNamed:@"activy"] forState:UIControlStateNormal];
//    [month sizeToFit];
//    month.titleLabel.text = @"324";
    [month setTitle:[NSString stringWithFormat:@"%@",self.month] forState:UIControlStateNormal];
    month.titleLabel.font = [UIFont systemFontOfSize:9];
    [month setTintColor:[UIColor whiteColor]];
    month.backgroundColor = [UIColor blueColor];
    month.enabled = NO;
    self.monthbutton = month;
    [self.view addSubview:month];
    
    
    self.bannerTableView.rowHeight = 120;

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"CustomCellIdentifier";
    LWBannerTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"LWBannerTableViewCell" owner:self options:nil];
        cell = [array objectAtIndex:0];
        [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
        
    }
   

    cell.bigTitle.text = @"标题八个字左右";
    cell.smallTitle.text = @"副标题一共不超过十六个字符差不多了";
    cell.sort.titleLabel.text = @"分类标签";
    cell.bannerImageView.image = [UIImage imageNamed:@"bannerimage"];
    //选 中不变色
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;

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
