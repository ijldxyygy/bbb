//
//  DetailsViewController.m
//  Prlife 产品详情
//
//  Created by ijldxyygy on 15/10/28.
//  Copyright (c) 2015年 LinkXin. All rights reserved.
//

#import "DetailsViewController.h"
#import "EFCircularSlider.h"
#import "ProductFeatureViewController.h"
#import "InsurableInterestViewController.h"
#import "NoticeViewController.h"
#import "InputInformationViewController.h"
#define VALUELABEL_WIDTH 120
#define VALUELABEL_HEIGHT 40
@interface DetailsViewController ()<UITextFieldDelegate>
@property (nonatomic,strong)EFCircularSlider * circularSlider;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"产品详情";

    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIView * circleView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 340 * SCREENRATE)];
    [self.view addSubview:circleView];
//    UIView * priceView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
//    priceView.backgroundColor = [UIColor greenColor];
    
    UILabel * title = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,40 * SCREENRATE)];
    title.text = @"珠江汇通六号人寿2015版本";
    [title setTextAlignment:NSTextAlignmentCenter];
    title.backgroundColor = [UIColor clearColor];
    title.font = [UIFont systemFontOfSize:18*SCREENRATE];
    [circleView addSubview:title];

    
    //环形进度
    CGRect sliderFrame = CGRectMake((SCREEN_WIDTH - 190 * SCREENRATE)/2, 40 * SCREENRATE, 190 * SCREENRATE, 190 * SCREENRATE);
    _circularSlider = [[EFCircularSlider alloc] initWithFrame:sliderFrame];
    [circleView addSubview:_circularSlider];

//    _valueLabel = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-VALUELABEL_WIDTH)/2, (sliderFrame.size.height-VALUELABEL_HEIGHT)/2+ 40* SCREENRATE, VALUELABEL_WIDTH, VALUELABEL_HEIGHT)];
    _valueLabel = [UILabel commonLabelWithFrame:CGRectMake((SCREEN_WIDTH-VALUELABEL_WIDTH)/2, (sliderFrame.size.height-VALUELABEL_HEIGHT)/2+ 40* SCREENRATE, VALUELABEL_WIDTH, VALUELABEL_HEIGHT) color:[UIColor blackColor] backGroundColor:[UIColor blueColor] font:[UIFont systemFontOfSize:20.0] textAlignment:NSTextAlignmentCenter text:nil];
    UITapGestureRecognizer *tapValueLabel=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeValue)];
     _valueLabel.userInteractionEnabled=YES;
    [_valueLabel addGestureRecognizer:tapValueLabel];
    
    [circleView addSubview:_valueLabel];

    
    _editValue  = [[UITextField alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-VALUELABEL_WIDTH)/2, (sliderFrame.size.height-VALUELABEL_HEIGHT)/2+ 40* SCREENRATE, VALUELABEL_WIDTH, VALUELABEL_HEIGHT)];
    _editValue.backgroundColor = [UIColor greenColor];
    _editValue.hidden = YES;
    _editValue.delegate = self;
    _editValue.textAlignment = NSTextAlignmentCenter;
    _editValue.keyboardType = UIKeyboardTypeNumberPad;

    [circleView addSubview:_editValue];
    [_circularSlider addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    
    //加减按钮
    UIButton * decreaseBtn = [[UIButton alloc]init];
    [decreaseBtn setImage:[UIImage imageNamed:@"bar1"] forState:UIControlStateNormal];
    decreaseBtn.frame = CGRectMake(10 * SCREENRATE, 120 * SCREENRATE, 30 * SCREENRATE, 30 * SCREENRATE);
    [decreaseBtn addTarget:self action:@selector(dereaseChange) forControlEvents:UIControlEventTouchUpInside];
    
    [circleView addSubview:decreaseBtn];
    
    
    UIButton * increaseBtn = [[UIButton alloc]init];
    increaseBtn.frame = CGRectMake(280 * SCREENRATE, 120 * SCREENRATE, 30 * SCREENRATE, 30 * SCREENRATE);
    [increaseBtn setImage:[UIImage imageNamed:@"bar2"] forState:UIControlStateNormal];
    [increaseBtn addTarget:self action:@selector(increaseChange) forControlEvents:UIControlEventTouchUpInside];
    
    [circleView addSubview:increaseBtn];
    
    
    //我要买
//    UILabel * wantbuy = [[UILabel alloc]initWithFrame:CGRectMake((SCREENRATE-190*SCREENRATE-70 *SCREENRATE), 95, 70 *SCREENRATE, 20* SCREENRATE)];
    UILabel * wantbuy = [UILabel commonLabelWithFrame:CGRectMake((SCREEN_WIDTH-70*SCREENRATE)/2, 95, 70 *SCREENRATE, 20* SCREENRATE) color:[UIColor blackColor] backGroundColor:[UIColor grayColor] font:[UIFont systemFontOfSize:12.0] textAlignment:NSTextAlignmentCenter text:@"我要买"];
    [circleView addSubview:wantbuy];
    //立即购买
    
    UIButton * buybutton = [UIButton createButtonWithFrame:CGRectMake(10*SCREENRATE, 440*SCREENRATE, SCREEN_WIDTH- 20*SCREENRATE, 43*SCREENRATE) Target:self Selector:@selector(buyNow) Title:@"立即购买"];
    buybutton.backgroundColor = [UIColor blueColor];
    [self.view addSubview:buybutton];

    UIButton * buy1 =[[UIButton alloc]initWithFrame:CGRectMake(10 * SCREENRATE, 510 * SCREENRATE, 90 * SCREENRATE,42 * SCREENRATE) ];
    [buy1 setTitle:@"产品特色" forState:UIControlStateNormal];
    buy1.backgroundColor = [UIColor grayColor];
    [buy1 addTarget:self action:@selector(PushProductFeatureView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buy1];

    UIButton * buy2 =[[UIButton alloc]initWithFrame:CGRectMake(10 * SCREENRATE + 100 * SCREENRATE, 510 * SCREENRATE, 90 * SCREENRATE,42 * SCREENRATE) ];
    [buy2 setTitle:@"保险利益" forState:UIControlStateNormal];
    buy2.backgroundColor = [UIColor grayColor];
    [buy2 addTarget:self action:@selector(PushInsurableInterestView) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:buy2];

    UIButton * buy3 =[[UIButton alloc]initWithFrame:CGRectMake(10 * SCREENRATE + 200 * SCREENRATE, 510 * SCREENRATE, 90 * SCREENRATE,42 * SCREENRATE) ];
    [buy3 setTitle:@"投保须知" forState:UIControlStateNormal];
    buy3.backgroundColor = [UIColor grayColor];
    [buy3 addTarget:self action:@selector(PushNoticeView) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:buy3];

    
    

    
}
//回收所有键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    [self.view endEditing:YES];
    _valueLabel.hidden = NO;
    _valueLabel.text =  _editValue.text;

    _editValue.hidden  =YES;
    _circularSlider.userInteractionEnabled = YES;
}
//点return收回数字键盘
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    _valueLabel.text =  textField.text;
    int intvalue = (int)textField.text%1000;

    _circularSlider.currentValue = (float)intvalue;
    return YES;
}
//限定可以输入数字而已
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSCharacterSet *cs;
    cs = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789\n"]invertedSet];
    
    NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs]componentsJoinedByString:@""];
    BOOL canChange = [string isEqualToString:filtered];

    if (_editValue == textField)　//判断是否时我们想要限定的那个输入框
    {
        if ([filtered length] > 5) { //如果输入框内容大于20则弹出警告
            textField.text = [filtered substringToIndex:5];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"超过最大字数不能输入了" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil] ;
            [alert show];
            return NO;
        }
    }
    
    return canChange;
}


- (void)buyNow {
    InputInformationViewController * nextVc = [[InputInformationViewController alloc]init];
    [self.navigationController pushViewController:nextVc animated:YES];
}
- (void)PushProductFeatureView {
    ProductFeatureViewController * pro = [[ProductFeatureViewController alloc]init];
    [self.navigationController pushViewController:pro animated:YES];
}
- (void)PushInsurableInterestView {
    InsurableInterestViewController * ins = [[InsurableInterestViewController alloc]init];
    [self.navigationController pushViewController:ins animated:YES];
}
- (void)PushNoticeView {
    NoticeViewController * not = [[NoticeViewController alloc]init];
    [self.navigationController pushViewController:not animated:YES];
    
    
}

-(void)valueChanged:(EFCircularSlider*)slider {
    _valueLabel.textColor = [UIColor blackColor];
    int intvalue = (int)slider.currentValue * 1000;
    _valueLabel.text = [NSString stringWithFormat:@"%d", intvalue ];
    _editValue.text = _valueLabel.text;
}

- (void)changeValue {
    NSLog(@"lkjlkj");
    _valueLabel.hidden = YES;
    _editValue.hidden = NO;
    _circularSlider.userInteractionEnabled = NO;
    
    
}

- (void)dereaseChange {
    
}

- (void)increaseChange {
    
}
-(void)viewWillAppear:(BOOL)animated {
    self.tabBarController.tabBar.hidden = YES;
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
