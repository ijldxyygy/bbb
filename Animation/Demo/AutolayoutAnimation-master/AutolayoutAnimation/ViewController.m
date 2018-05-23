//
//  ViewController.m
//  AutolayoutAnimation
//
//  Created by yuqiu on 15/12/3.
//  Copyright © 2015年 yuqiu. All rights reserved.
//

#import "ViewController.h"
#import "HomePageAnimationUtil.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *topTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomTitleLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textFieldBottomLineConstraint;
@property (weak, nonatomic) IBOutlet UIImageView *phoneIconImageView;
@property (weak, nonatomic) IBOutlet UILabel *topTipsLabel;
@property (weak, nonatomic) IBOutlet UIView *bottomTipsView;

@end

@implementation ViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _topTitleLabel.transform = CGAffineTransformMakeTranslation(0, -200);
    _bottomTitleLabel.transform = CGAffineTransformMakeTranslation(0, -200);
    
    _phoneIconImageView.transform = CGAffineTransformMakeTranslation(-200, 0);
    
    _textFieldBottomLineConstraint.constant = 0;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [HomePageAnimationUtil titleLabelAnimationWithLabel:_topTitleLabel withView:self.view];
    [HomePageAnimationUtil titleLabelAnimationWithLabel:_bottomTitleLabel withView:self.view];
    
    [HomePageAnimationUtil textFieldBottomLineAnimationWithConstraint:_textFieldBottomLineConstraint WithView:self.view];
    
    [HomePageAnimationUtil phoneIconAnimationWithLabel:_phoneIconImageView withView:self.view];
    
    [HomePageAnimationUtil tipsLabelMaskAnimation:_topTipsLabel withBeginTime:0];
    [HomePageAnimationUtil tipsLabelMaskAnimation:_bottomTipsView withBeginTime:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - override view method

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
