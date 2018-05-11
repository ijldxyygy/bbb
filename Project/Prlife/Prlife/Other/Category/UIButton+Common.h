//
//  UIButton+Common.h
//  Prlife
//
//  Created by ijldxyygy on 15/11/5.
//  Copyright © 2015年 LinkXin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Common)




/*!
 * 设置按钮正常状态下的图片
 */
- (void)setNormalImageName:(NSString *)imageName;
- (void)setNormalImage:(UIImage *)image;
- (void)setNormalImageWithColor:(UIColor *)color;

/*!
 * 设置按钮Hightlighted状态下的图片
 */
- (void)setHightlightedImageName:(NSString *)imageName;
- (void)setHightlightedImage:(UIImage *)image;
- (void)setHightlightedImageWithColor:(UIColor *)color;

/*!
 * 设置按钮Selected状态下的图片
 */
- (void)setSelectedImageName:(NSString *)imageName;
- (void)setSelectedImage:(UIImage *)image;
- (void)setSelectedImageWithColor:(UIColor *)color;

/*!
 * 设置按钮状态下的图片
 */
- (void)setNormal:(UIColor *)color hightlighted:(UIColor *)hgColor;
- (void)setNormal:(UIColor *)color selected:(UIColor *)selColor;
- (void)setNormal:(UIColor *)color hightlighted:(UIColor *)hgColor selected:(UIColor *)selColor;

//快速创建按钮
+ (UIButton *)createButtonWithFrame:(CGRect) frame Target:(id)target Selector:(SEL)selector Image:(NSString*)image ImagePressed:(NSString*)imagePressed;

+ (UIButton *)createButtonWithFrame:(CGRect)frame Target:(id)target Selector:(SEL)selector Title:(NSString*)title;

+ (UIButton *)createButtonWithFrame:(CGRect)frame Target:(id)target Selector:(SEL)selector Image:(NSString *)image ImagePressed:(NSString *)imagePressed Title:(NSString *)title;


@end
