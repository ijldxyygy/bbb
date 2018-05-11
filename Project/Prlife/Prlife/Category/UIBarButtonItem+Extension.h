//
//  UIBarButtonItem+Extension.h
//  meituang
//
//  Created by apple on 15/8/15.
//  Copyright (c) 2015年 wlw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage;
@end
