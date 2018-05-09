//
//  UIBarButtonItem+LWItem.h
//  MyWB
//
//  Created by ijldxyygy on 15/8/29.
//  Copyright (c) 2015年 dx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (LWItem)
+ (UIBarButtonItem *)barButtonItemWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;
@end
