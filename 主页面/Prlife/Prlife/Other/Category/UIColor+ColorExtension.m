//
//  UIColor+ColorExtension.m
//  Prlife
//
//  Created by ijldxyygy on 15/11/5.
//  Copyright © 2015年 LinkXin. All rights reserved.
//

#import "UIColor+ColorExtension.h"

#define kImageWidth  1
#define kImageHeight 1

@implementation UIColor (ColorExtension)

+ (UIImage *)imageWithColor:(UIColor *)color {
    return [[self class] imageWithColor:color size:CGSizeMake(kImageWidth, kImageHeight)];
}

///< 根据颜色、图片大小 生成图片
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    // 画图开始
    UIGraphicsBeginImageContext(CGSizeMake(kImageWidth, kImageHeight));
    // 获取图形设备上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 设置填充颜色
    CGContextSetFillColorWithColor(context, color.CGColor);
    // 用所设置的填充颜色填充
    CGContextFillRect(context, rect);
    // 得到图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 画图结束，解释资源
    UIGraphicsEndImageContext();
    
    return image;
}

@end
