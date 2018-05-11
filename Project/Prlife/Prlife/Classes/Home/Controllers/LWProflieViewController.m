//
//  LWProflieViewController.m
//  Prlife
//
//  Created by ijldxyygy on 15/10/28.
//  Copyright (c) 2015年 LinkXin. All rights reserved.
//

#import "LWProflieViewController.h"
#import "UIBarButtonItem+Item.h"

@interface LWProflieViewController ()
@property (nonatomic,strong)UISegmentedControl * segmentedControl;
@property (nonatomic,strong)UIView * myInsurancePolicy;
@property (nonatomic,strong)UIView * myProperty;
@end

@implementation LWProflieViewController
- (void)initSegmentedControl {
    NSArray *segmentedData = [[NSArray alloc]initWithObjects:@"订单",@"资产",@"个人资料",nil];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]initWithItems:segmentedData];
    segmentedControl.frame = CGRectMake(0, 64,SCREEN_WIDTH, 30.0);
    /*
     这个是设置按下按钮时的颜色
     */
    segmentedControl.tintColor = [UIColor colorWithRed:49.0 / 256.0 green:148.0 / 256.0 blue:208.0 / 256.0 alpha:1];
    segmentedControl.selectedSegmentIndex = 0;//默认选中的按钮索引
    
    
    /*
     下面的代码实同正常状态和按下状态的属性控制,比如字体的大小和颜色等
     */
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:12],NSFontAttributeName,[UIColor blackColor], NSForegroundColorAttributeName, nil,nil];
    
    
    [segmentedControl setTitleTextAttributes:attributes forState:UIControlStateNormal];
    
    
    NSDictionary *highlightedAttributes = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    
    [segmentedControl setTitleTextAttributes:highlightedAttributes forState:UIControlStateHighlighted];
    //设置分段控件点击相应事件
    [segmentedControl addTarget:self action:@selector(doSomethingInSegment:)forControlEvents:UIControlEventValueChanged];
//    segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
    [self.view addSubview:segmentedControl];
    

}

-(void)doSomethingInSegment:(UISegmentedControl *)Seg {
    NSInteger Index = Seg.selectedSegmentIndex;
    
    switch (Index)
    {
        case 0:
//            self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@""]];
            self.view.backgroundColor = [UIColor whiteColor];
          
            break;
        case 1:
            self.view.backgroundColor = [UIColor whiteColor];
            
            break;
        case 2:
            self.view.backgroundColor = [UIColor whiteColor];
            break;
        default:
            break;
    }
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    //设置左边的和右边
    //左边
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"leftBarButton"]highImage:[UIImage imageNamed:@"rightBarButton"]target:self action:nil forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem.title = @"扫扫";
    //右边
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"rightBarButton"] highImage:[UIImage imageNamed:@"leftBarButton"] target:self action:nil forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem.title = @"问题";
    self.navigationItem.title = @"我的";
    [self initSegmentedControl];
 
    
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
