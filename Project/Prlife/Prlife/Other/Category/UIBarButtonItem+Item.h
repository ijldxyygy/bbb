//
//  UIBarButtonItem+Item.h
//
//  Created by W.LW on 12-3-7.
//  Copyright (c) 2012年 W.LW All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Item)

/**
 *  自定义buttonitem
 *
 *  @param image         <#image description#>
 *  @param highImage     <#highImage description#>
 *  @param target        <#target description#>
 *  @param action        <#action description#>
 *  @param controlEvents <#controlEvents description#>
 *
 *  @return <#return value description#>
 */
+ (UIBarButtonItem *)barButtonItemWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;

@end
