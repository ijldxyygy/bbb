//
//  circle.h
//  circle
//
//  Created by ijldxyygy on 15/11/4.
//  Copyright © 2015年 LinkXin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface circle : UIControl

@property (nonatomic) float minimumValue;
@property (nonatomic) float maximumValue;
@property (nonatomic) float currentValue;

@property (nonatomic) int lineWidth;
@property (nonatomic, strong) UIColor* filledColor;
@property (nonatomic, strong) UIColor* unfilledColor;

@property (nonatomic, strong) UIColor* handleColor;

@property (nonatomic, strong) UIFont* labelFont;
@property (nonatomic, strong) UIColor* labelColor;
@property (nonatomic) BOOL snapToLabels;
@property (nonatomic,assign)NSInteger angle;

-(void)changeAngle:(int)angle;

@end
