//
//  UIColor+ColorExtension.h
//  Prlife
//
//  Created by ijldxyygy on 15/11/5.
//  Copyright © 2015年 LinkXin. All rights reserved.
//

#import <UIKit/UIKit.h>

/*!
 * @brief UIColor类扩展，提供根据颜色生成图片方法，添加更多生成颜色的方法
 * @author huangyibiao
 */
@interface UIColor (ColorExtension)

///< 根据颜色生成图片
+ (UIImage *)imageWithColor:(UIColor *)color;

///< 根据颜色、图片大小 生成图片
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

@end