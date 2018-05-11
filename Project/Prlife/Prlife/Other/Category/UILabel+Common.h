//
//  UILabel+Common.h
//  Prlife
//
//  Created by ijldxyygy on 15/11/5.
//  Copyright (c) 2015年 LinkXin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Common)

/**
 *  创建UILabel公共的方法
 */
+ (UILabel *)commonLabelWithFrame:(CGRect)frame
                            color:(UIColor*)color
                             font:(UIFont*)font
                    textAlignment:(NSTextAlignment)textAlignment
                             text:(NSString*)text;
/**
 *  可设置背景色
 */
+ (UILabel *)commonLabelWithFrame:(CGRect)frame
                            color:(UIColor*)color
                  backGroundColor:(UIColor*)backGroundColor
                             font:(UIFont*)font
                    textAlignment:(NSTextAlignment)textAlignment
                             text:(NSString*)text;


/**
 *  宽度动态增加（含背景色）
 */

+ (UILabel *)dynamicWidthLabelWithPointX:(CGFloat)pointX
                                  pointY:(CGFloat)pointY
                                  height:(CGFloat)height
                                   color:(UIColor*)color
                         backGroundColor:(UIColor *)backGroundColor
                                    font:(UIFont*)font
                           textAlignment:(NSTextAlignment)textAlignment
                                    Text:(NSString*)text;
/**
*  宽度动态增加
*/

+ (UILabel *)dynamicWidthLabelWithPointX:(CGFloat)pointX
                                  pointY:(CGFloat)pointY
                                   height:(CGFloat)height
                                  color:(UIColor*)color
                                   font:(UIFont*)font
                          textAlignment:(NSTextAlignment)textAlignment
                                   Text:(NSString*)text;
/**
 *  创建一个动态高度的UILabel
 */
+ (UILabel *)dynamicHeightLabelWithPointX:(CGFloat)pointX
                                   pointY:(CGFloat)pointY
                                    width:(CGFloat)width
                                    color:(UIColor *)color
                                     font:(UIFont *)font
                            textAlignmeng:(NSTextAlignment)textAlignmeng
                               strContent:(NSString *)strContent;
/**
 *  创建一个动态高度的UILabel(含背景色)
 */
+ (UILabel *)dynamicHeightLabelWithPointX:(CGFloat)pointX
                                   pointY:(CGFloat)pointY
                                    width:(CGFloat)width
                                    color:(UIColor *)color
                       setBackgroundColor:(UIColor *)backGroundColor
                                     font:(UIFont *)font
                            textAlignmeng:(NSTextAlignment)textAlignmeng
                               strContent:(NSString *)strContent;

@end
