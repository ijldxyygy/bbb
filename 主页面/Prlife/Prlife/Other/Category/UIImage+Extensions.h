//
//  UIImage+Extensions.h
//  Prlife
//
//  Created by ijldxyygy on 15/11/5.
//  Copyright © 2015年 LinkXin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extensions)
- (UIImage *)imageAtRect:(CGRect)rect;
- (UIImage *)imageByScalingProportionallyToMinimumSize:(CGSize)targetSize;
- (UIImage *)imageByScalingProportionallyToSize:(CGSize)targetSize;
- (UIImage *)imageByScalingToSize:(CGSize)targetSize;
- (UIImage *)imageRotatedByRadians:(CGFloat)radians;
- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;
@end
