//
//  UIBarButtonItem+LWItem.m
//  MyWB
//
//  Created by ijldxyygy on 15/8/29.
//  Copyright (c) 2015年 dx. All rights reserved.
//

#import "UIBarButtonItem+LWItem.h"

@implementation UIBarButtonItem (LWItem)
+ (UIBarButtonItem *)barButtonItemWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    [btn setBackgroundImage:highImage forState:UIControlStateHighlighted];
    [btn sizeToFit];//自适应大小. 和图片一样大
    [btn addTarget:target action:action forControlEvents:controlEvents];
    return  [[UIBarButtonItem alloc]initWithCustomView:btn];
}
@end
