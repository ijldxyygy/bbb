//
//  UIButton+Common.m
//  Prlife
//
//  Created by ijldxyygy on 15/11/5.
//  Copyright © 2015年 LinkXin. All rights reserved.
//

#import "UIButton+Common.h"
#import "UIColor+ColorExtension.h"
#define kImageWithName(imageName) [UIimage imageWithName:imageName]
@implementation UIButton (Common)

/*!
 * 设置按钮正常状态下的图片
 */
- (void)setNormalImageName:(NSString *)imageName {
    [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
}

- (void)setNormalImage:(UIImage *)image {
    [self setImage:image forState:UIControlStateNormal];
}

- (void)setNormalImageWithColor:(UIColor *)color {
    [self setImage:[UIColor imageWithColor:color] forState:UIControlStateNormal];
}

/*!
 * 设置按钮Hightlighted状态下的图片
 */
- (void)setHightlightedImageName:(NSString *)imageName {
    [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateHighlighted];
}

- (void)setHightlightedImage:(UIImage *)image {
    [self setImage:image forState:UIControlStateHighlighted];
}

- (void)setHightlightedImageWithColor:(UIColor *)color {
    [self setImage:[UIColor imageWithColor:color] forState:UIControlStateHighlighted];
}

/*!
 * 设置按钮Selected状态下的图片
 */
- (void)setSelectedImageName:(NSString *)imageName {
    [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateSelected];
}

- (void)setSelectedImage:(UIImage *)image {
    [self setImage:image forState:UIControlStateSelected];
}

- (void)setSelectedImageWithColor:(UIColor *)color {
    [self setImage:[UIColor imageWithColor:color] forState:UIControlStateSelected];
}

- (void)setNormal:(UIColor *)color hightlighted:(UIColor *)hgColor {
    [self setNormalImageWithColor:color];
    [self setHightlightedImageWithColor:hgColor];
}

- (void)setNormal:(UIColor *)color selected:(UIColor *)selColor {
    [self setNormalImageWithColor:color];
    [self setSelectedImageWithColor:selColor];
}

- (void)setNormal:(UIColor *)color hightlighted:(UIColor *)hgColor selected:(UIColor *)selColor {
    [self setNormal:color hightlighted:hgColor];
    [self setSelectedImageWithColor:selColor];
}


+ (UIButton*)createButtonWithFrame:(CGRect) frame Target:(id)target Selector:(SEL)selector
Image:(NSString*)image ImagePressed:(NSString*)imagePressed {
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setFrame:frame];
    
    UIImage *newImage = [UIImage imageNamed:image];
    
    [button setBackgroundImage:newImage forState:UIControlStateNormal];
    
    UIImage *newPressedImage = [UIImage imageNamed: imagePressed];
    
    [button setBackgroundImage:newPressedImage forState:UIControlStateHighlighted];
    
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    return button;
    
}



+ (UIButton *)createButtonWithFrame:(CGRect)frame Target:(id)target
 Selector:(SEL)selector Title:(NSString *)title {
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [button setFrame:frame];
    
    [button setTitle:title forState:UIControlStateNormal];
    
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    return button;
    
}

+ (UIButton *)createButtonWithFrame:(CGRect)frame Target:(id)target Selector:(SEL)selector Image:(NSString *)image ImagePressed:(NSString *)imagePressed Title:(NSString *)title {
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [button setFrame:frame];
    
    UIImage *newImage = [UIImage imageNamed:image];
    
    [button setBackgroundImage:newImage forState:UIControlStateNormal];
    
    UIImage *newPressedImage = [UIImage imageNamed: imagePressed];
    
    [button setBackgroundImage:newPressedImage forState:UIControlStateHighlighted];

//    [button sizeToFit];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [button setTitle:title forState:UIControlStateNormal];
 //设置title在图片下方(上左下右)
    [button setTitleEdgeInsets:UIEdgeInsetsMake(button.frame.size.height+20*SCREENRATE,0.0, 0.0,0.0)];
//    [button setImageEdgeInsets:UIEdgeInsetsMake(0.0, 0.0,0.0, -button.titleLabel.bounds.size.width)];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    
    return button;
}


@end
