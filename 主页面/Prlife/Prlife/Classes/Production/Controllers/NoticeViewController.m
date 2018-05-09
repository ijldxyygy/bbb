//
//  NoticeViewController.m
//  Prlife
//
//  Created by ijldxyygy on 15/11/4.
//  Copyright © 2015年 LinkXin. All rights reserved.
//

#import "NoticeViewController.h"

@interface NoticeViewController ()

@end

@implementation NoticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"保险须知";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = nil;
    [self setLabel];
    

}

- (void)setLabel {
//    NSString * str =  @"1、保险责任：被保险人身故，赔付保险账户（保单）价值 * 120%。\n2、犹豫期退保：自电子保签发日次日（即生效日）起，您有10天犹豫期（60周岁以上为20天），此期间内您可以要求退还全部保费。\n 1、保险责任：被保险人身故，赔付保险账户（保单）价值 * 120%。\n2、犹豫期退保：自电子保签发日次日（即生效日）起，您有10天犹豫期（60周岁以上为20天），此期间内您可以要求退还全部保费。\n 1、保险责任：被保险人身故，赔付保险账户（保单）价值 * 120%。\n2、犹豫期退保：自电子保签发日次日（即生效日）起，您有10天犹豫期（60周岁以上为20天），此期间内您可以要求退还全部保费。\n 1、保险责任：被保险人身故，赔付保险账户（保单）价值 * 120%。\n2、犹豫期退保：自电子保签发日次日（即生效日）起，您有10天犹豫期（60周岁以上为20天），此期间内您可以要求退还全部保费。\n 1、保险责任：被保险人身故，赔付保险账户（保单）价值 * 120%。\n2、犹豫期退保：自电子保签发日次日（即生效日）起，您有10天犹豫期（60周岁以上为20天），此期间内您可以要求退还全部保费。\n ";
//    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(10 * SCREENRATE,5 * SCREENRATE, SCREEN_WIDTH - 20 * SCREENRATE,SCREEN_HEIGHT)];
//
//    label.numberOfLines = 0;
//    label.font = [UIFont systemFontOfSize:15];
//   
//
//    label.backgroundColor = [UIColor whiteColor];
//    label.text = str;
    UILabel * label = [UILabel dynamicHeightLabelWithPointX:10 * SCREENRATE pointY:64 width:SCREEN_WIDTH - 10 * SCREENRATE color:[UIColor blackColor] setBackgroundColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:14.0] textAlignmeng:NSTextAlignmentLeft strContent:@"1、保险责任：被保险人身故，赔付保险账户（保单）价值 * 120%。\n2、犹豫期退保：自电子保签发日次日（即生效日）起，您有10天犹豫期（60周岁以上为20天）"];
    [label sizeToFit];
    [self.view addSubview:label];
    
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
