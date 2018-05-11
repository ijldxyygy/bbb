//
//  LWTabBar.h
//  Prlife
//
//  Created by ijldxyygy on 15/10/28.
//  Copyright (c) 2015年 LinkXin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LWTabBar;

@protocol LWTabBarDelegate <NSObject>

@optional
- (void)tabBar:(LWTabBar *)tabBar didClickButton:(NSInteger)index;

@end


@interface LWTabBar : UIView

//@property (nonatomic, assign) NSUInteger tabBarButtonCount;

// items:保存每一个按钮对应tabBarItem模型
@property (nonatomic, strong) NSArray *items;

@property (nonatomic, weak) id<LWTabBarDelegate> delegate;


@end
