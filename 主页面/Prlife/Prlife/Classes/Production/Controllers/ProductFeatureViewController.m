//
//  ProductFeatureViewController.m
//  Prlife
//
//  Created by ijldxyygy on 15/11/4.
//  Copyright © 2015年 LinkXin. All rights reserved.
//

#import "ProductFeatureViewController.h"

@interface ProductFeatureViewController ()

@end

@implementation ProductFeatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"产品特色";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = nil;
//    UIButton * btn1 = [UIButton createButtonWithFrame:CGRectMake(33 *SCREENRATE, 90 * SCREENRATE, 60 * SCREENRATE, 60 * SCREENRATE) Target:self Selector:nil Title:@"高收益"];
    UIButton *btn1 = [UIButton createButtonWithFrame:CGRectMake(33 *SCREENRATE, 90 * SCREENRATE, 60 * SCREENRATE, 60 * SCREENRATE) Target:self Selector:nil Image:@"bar1" ImagePressed:@"bar2" Title:@"高收益"];
    
    [self.view addSubview:btn1];
//    UIButton * btn2 = [UIButton createButtonWithFrame:CGRectMake( (33+(33+60)) *SCREENRATE, 90 * SCREENRATE, 60 * SCREENRATE, 60 * SCREENRATE) Target:self Selector:nil Title:@"低门槛"];
    UIButton * btn2 = [UIButton createButtonWithFrame:CGRectMake( (33+(33+60)) *SCREENRATE, 90 * SCREENRATE, 60 * SCREENRATE, 60 * SCREENRATE) Target:self Selector:nil Image:@"bar2" ImagePressed:@"bar1" Title:@"低门槛"];
    [self.view addSubview:btn2];
//    UIButton * btn3 = [UIButton createButtonWithFrame:CGRectMake((33+2 * (33+60)) *SCREENRATE, 90 * SCREENRATE, 60 * SCREENRATE, 60 * SCREENRATE) Target:self Selector:nil Title:@"快增值"];
    UIButton * btn3 = [UIButton createButtonWithFrame:CGRectMake((33+2 * (33+60)) *SCREENRATE, 90 * SCREENRATE, 60 * SCREENRATE, 60 * SCREENRATE) Target:self Selector:nil Image:@"bar2" ImagePressed:@"bar1" Title:@"快增值"];
    [self.view addSubview:btn3];
    
    UIButton * btn4 = [UIButton createButtonWithFrame:CGRectMake(80 *SCREENRATE, 200 * SCREENRATE, 60 * SCREENRATE, 60 * SCREENRATE) Target:self Selector:nil Image:@"bar2" ImagePressed:@"bar1" Title:@"低风险"];
    [self.view addSubview:btn4];
    UIButton * btn5 = [UIButton createButtonWithFrame:CGRectMake((80+ (33+60)) *SCREENRATE, 200 * SCREENRATE, 60 * SCREENRATE, 60 * SCREENRATE) Target:self Selector:nil Image:@"bar2" ImagePressed:@"bar1" Title:@"有保障"];
    
    [self.view addSubview:btn5];
    
    UIView *topline = [[UIView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 2)];
    topline.backgroundColor = [UIColor grayColor];
    [self.view addSubview:topline];
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 310, SCREEN_WIDTH, 2)];
    line.backgroundColor = [UIColor grayColor];
    [self.view addSubview:line];
    //要素

    UILabel * toplb = [UILabel commonLabelWithFrame:CGRectMake(10*SCREENRATE, 325 *SCREENRATE, SCREEN_WIDTH-20 * SCREENRATE, 15) color:[UIColor blackColor] font:[UIFont systemFontOfSize:14.0] textAlignment:NSTextAlignmentLeft text:@"【产品要素】"];
    [self.view addSubview:toplb];
    

    UILabel * lb1 = [UILabel dynamicWidthLabelWithPointX:10 * SCREENRATE pointY:345 * SCREENRATE height:15 color:[UIColor blackColor] font:[UIFont systemFontOfSize:14.0] textAlignment:NSTextAlignmentLeft Text:@" 建议持有期："];
    [self.view addSubview:lb1];
//    UILabel * lb2 = [UILabel dynamicWidthLabelWithFrame:CGRectMake(10*SCREENRATE, 345 *SCREENRATE, SCREEN_WIDTH-20 * SCREENRATE, 15) color:[UIColor blackColor] font:[UIFont systemFontOfSize:14.0] textAlignment:NSTextAlignmentLeft Text:@" 收益起算日："];
    UILabel * lb2 = [UILabel dynamicWidthLabelWithPointX:10 *SCREENRATE pointY:365 * SCREENRATE height:15 color:[UIColor blackColor] font:[UIFont systemFontOfSize:14.0] textAlignment:NSTextAlignmentLeft Text:@" 收益起算日："];
    [self.view addSubview:lb2];
    UILabel * lb3 = [UILabel dynamicWidthLabelWithPointX:10 *SCREENRATE pointY:385 * SCREENRATE height:15 color:[UIColor blackColor] font:[UIFont systemFontOfSize:14.0] textAlignment:NSTextAlignmentLeft Text:@" 投保年龄："];
    [self.view addSubview:lb3];
    UILabel * lb4 = [UILabel dynamicWidthLabelWithPointX:10 *SCREENRATE pointY:405 * SCREENRATE height:15 color:[UIColor blackColor] font:[UIFont systemFontOfSize:14.0] textAlignment:NSTextAlignmentLeft Text:@" 保险期间："];
    [self.view addSubview:lb4];
    
    UILabel * lb5 = [UILabel dynamicWidthLabelWithPointX:10 *SCREENRATE pointY:425 * SCREENRATE height:15 color:[UIColor blackColor] font:[UIFont systemFontOfSize:14.0] textAlignment:NSTextAlignmentLeft Text:@" 犹豫期："];
    [self.view addSubview:lb5];
    UILabel * buttomlb = [UILabel commonLabelWithFrame:CGRectMake(13*SCREENRATE, 450 *SCREENRATE, SCREEN_WIDTH-20 * SCREENRATE, 43)  color:[UIColor grayColor] font:[UIFont systemFontOfSize:11.0] textAlignment:NSTextAlignmentLeft text:@"退保手续费：犹豫期内退保没手续费；犹豫期满后，１　年内（停驶１年）退保收取４％手续费；１年后退保０手续费"];
    [self.view addSubview:buttomlb];
    
    UILabel * lbr1 = [UILabel commonLabelWithFrame:CGRectMake(lb1.frame.size.width, 345 *SCREENRATE, SCREEN_WIDTH-20 * SCREENRATE, 15) color:[UIColor blackColor] font:[UIFont systemFontOfSize:14.0] textAlignment:NSTextAlignmentLeft text:@"1年"];
    [self.view addSubview:lbr1];
    UILabel * lbr2 = [UILabel commonLabelWithFrame:CGRectMake(lb2.frame.size.width, 365 *SCREENRATE, SCREEN_WIDTH-20 * SCREENRATE, 15) color:[UIColor blackColor] font:[UIFont systemFontOfSize:14.0] textAlignment:NSTextAlignmentLeft text:@"（投保日）"];
    [self.view addSubview:lbr2];
    UILabel * lbr3 = [UILabel commonLabelWithFrame:CGRectMake(lb3.frame.size.width, 385 *SCREENRATE, SCREEN_WIDTH-20 * SCREENRATE, 15) color:[UIColor blackColor] font:[UIFont systemFontOfSize:14.0] textAlignment:NSTextAlignmentLeft text:@"18周岁至70周岁"];
    [self.view addSubview:lbr3];
    UILabel * lbr4 = [UILabel commonLabelWithFrame:CGRectMake(lb4.frame.size.width, 405 *SCREENRATE, SCREEN_WIDTH-20 * SCREENRATE, 15) color:[UIColor blackColor] font:[UIFont systemFontOfSize:14.0] textAlignment:NSTextAlignmentLeft text:@"终身"];
    [self.view addSubview:lbr4];
    UILabel * lbr5 = [UILabel commonLabelWithFrame:CGRectMake(lb5.frame.size.width, 425 *SCREENRATE, SCREEN_WIDTH-20 * SCREENRATE, 15) color:[UIColor blackColor] font:[UIFont systemFontOfSize:14.0] textAlignment:NSTextAlignmentLeft text:@"10天（60周岁以上为20天）"];
    [self.view addSubview:lbr5];
    
    
    
    
    
    
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
