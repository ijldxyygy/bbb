//
//  UILabel+Common.m
//  Prlife
//
//  Created by ijldxyygy on 15/11/5.
//  Copyright (c) 2015年 LinkXin. All rights reserved.
//

#import "UILabel+Common.h"

@implementation UILabel (Common)
+ (UILabel *)commonLabelWithFrame:(CGRect)frame
                            color:(UIColor*)color
                             font:(UIFont*)font
                    textAlignment:(NSTextAlignment)textAlignment
                             text:(NSString*)text
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = text;
    label.textColor = color;
    label.font = font;
    label.textAlignment = textAlignment;
    label.numberOfLines = 0;
    
    label.backgroundColor = [UIColor clearColor];
    
    return label;
}
/**
 *  可设置背景色
 */
+ (UILabel *)commonLabelWithFrame:(CGRect)frame
                            color:(UIColor*)color
                  backGroundColor:(UIColor*)backGroundColor
                             font:(UIFont*)font
                    textAlignment:(NSTextAlignment)textAlignment
                             text:(NSString*)text
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = text;
    label.textColor = color;
    label.font = font;
    label.textAlignment = textAlignment;
    label.numberOfLines = 0;
    label.backgroundColor = [UIColor clearColor];
    
    return label;
}


//动态设置Label的高度
+ (UILabel *)dynamicHeightLabelWithPointX:(CGFloat)pointX
                                   pointY:(CGFloat)pointY
                                    width:(CGFloat)width
                                    color:(UIColor *)color
                                     font:(UIFont *)font
                            textAlignmeng:(NSTextAlignment)textAlignmeng
                               strContent:(NSString *)strContent {
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    
    NSDictionary *attributes = @{NSFontAttributeName:font,
                                 NSParagraphStyleAttributeName:paragraphStyle.copy};
    
    CGSize labelSize = [strContent boundingRectWithSize:CGSizeMake(width,MAXFLOAT)
                                                options:NSStringDrawingUsesLineFragmentOrigin
                                             attributes:attributes
                                                context:nil].size;
    
    UILabel *myLabel = [[UILabel alloc] initWithFrame:CGRectMake(pointX, pointY, width, labelSize.height)];
    [myLabel setNumberOfLines:0];
    myLabel.text = strContent;
    myLabel.font = font;
    myLabel.textColor = color;
    return myLabel;
}
//动态设置Label的高度（含背景色）
+ (UILabel *)dynamicHeightLabelWithPointX:(CGFloat)pointX
                                   pointY:(CGFloat)pointY
                                    width:(CGFloat)width
                                    color:(UIColor *)color
                       setBackgroundColor:(UIColor *)backGroundColor
                                     font:(UIFont *)font
                            textAlignmeng:(NSTextAlignment)textAlignmeng
                               strContent:(NSString *)strContent
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    
    NSDictionary *attributes = @{NSFontAttributeName:font,
                                 NSParagraphStyleAttributeName:paragraphStyle.copy};
    
    CGSize labelSize = [strContent boundingRectWithSize:CGSizeMake(width,MAXFLOAT)
                                                options:NSStringDrawingUsesLineFragmentOrigin
                                             attributes:attributes
                                                context:nil].size;
    
    UILabel *myLabel = [[UILabel alloc] initWithFrame:CGRectMake(pointX, pointY, width, labelSize.height)];
    [myLabel setNumberOfLines:0];
    myLabel.text = strContent;
    myLabel.font = font;
    myLabel.textColor = color;
    myLabel.backgroundColor = backGroundColor;
    return myLabel;
    
}

/**
 *  宽度动态增加
 */
+ (UILabel *)dynamicWidthLabelWithPointX:(CGFloat)pointX
                                  pointY:(CGFloat)pointY
                                   height:(CGFloat)height
                                   color:(UIColor*)color
                                    font:(UIFont*)font
                           textAlignment:(NSTextAlignment)textAlignment
                                    Text:(NSString*)text
{
    
    NSString *str = text;

    UILabel *label = [[UILabel alloc] init];
    label.font = font;  //UILabel的字体大小
    label.numberOfLines = 0;  //必须定义这个属性，否则UILabel不会换行
    label.textColor = color;
    label.textAlignment = textAlignment;  //文本对齐方式
    [label setBackgroundColor:[UIColor clearColor]];
    label.text = str;
    //高度固定不折行，根据字的多少计算label的宽度
   
    CGSize size = [text sizeWithFont:label.font constrainedToSize:CGSizeMake(MAXFLOAT, label.frame.size.height)];
//    NSLog(@"size.width=%f, size.height=%f", size.width, size.height);

    //根据计算结果重新设置UILabel的尺寸
    [label setFrame:CGRectMake(pointX, pointY, size.width, height)];
    return label;
}

+ (UILabel *)dynamicWidthLabelWithPointX:(CGFloat)pointX
                                  pointY:(CGFloat)pointY
                                  height:(CGFloat)height
                                   color:(UIColor*)color
                         backGroundColor:(UIColor *)backGroundColor
                                    font:(UIFont*)font
                           textAlignment:(NSTextAlignment)textAlignment
                                    Text:(NSString*)text {
    NSString *str = text;
    
    UILabel *label = [[UILabel alloc] init];
    label.font = font;  //UILabel的字体大小
    label.numberOfLines = 0;  //必须定义这个属性，否则UILabel不会换行
    label.textColor = color;
    label.textAlignment = textAlignment;  //文本对齐方式
    [label setBackgroundColor:backGroundColor];
    label.text = str;
    //高度固定不折行，根据字的多少计算label的宽度
    
    CGSize size = [text sizeWithFont:label.font constrainedToSize:CGSizeMake(MAXFLOAT, label.frame.size.height)];
    //    NSLog(@"size.width=%f, size.height=%f", size.width, size.height);
    
    //根据计算结果重新设置UILabel的尺寸
    [label setFrame:CGRectMake(pointX, pointY, size.width, height)];
    return label;
}


@end
