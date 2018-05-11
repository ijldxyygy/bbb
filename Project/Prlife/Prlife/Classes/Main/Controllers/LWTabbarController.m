//
//  LWTabbarController.m
//  Created by W.LW on 12-3-7.
//  Copyright (c) 2012年 W.LW All rights reserved.
//

#import "LWTabbarController.h"
#import "LWTabBar.h"
#import "LWRecommendViewController.h"
#import "LWActivityViewController.h"
#import "LWProflieViewController.h"
#import "LWNavigationController.h"
@interface LWTabbarController ()<LWTabBarDelegate>

@property (nonatomic, strong) NSMutableArray *items;

@property (nonatomic,weak)LWRecommendViewController * recommend;
@end

@implementation LWTabbarController

- (NSMutableArray *)items {
    if (!_items){
        _items = [NSMutableArray array];
    }
    return _items;
}





- (void)viewDidLoad {
    [super viewDidLoad];
//    NSLog(@"%s",__func__);
    
    
    // 添加所有子控制器
    [self setUpAllChildViewController];
    
    // 自定义tabBar

    [self setUpTabBar];
    

}
#warning 系统的tabbarbutton 里面小图片 30x30
- (void)setUpTabBar {
    // 自定义tabBar
    LWTabBar *tabBar = [[LWTabBar alloc] initWithFrame:self.tabBar.bounds];
    //修改底色
    tabBar.backgroundColor = [UIColor whiteColor];
    
    // 设置代理
    tabBar.delegate = self;
    
    // 给tabBar传递tabBarItem模型
    tabBar.items = self.items;
    
    // 添加自定义tabBar
    [self.tabBar addSubview:tabBar];
    
    // 移除系统的tabBar
//    [self.tabBar removeFromSuperview];

}

- (void)tabBar:(LWTabBar *)tabBar didClickButton:(NSInteger)index {
    self.selectedIndex = index;

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //移除系统 tabBarButton
    for (UIView *tabBarButton in self.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabBarButton removeFromSuperview];
        }
    }

    
    
}



// 在ios7之后，默认会把UITabBar上面的按钮图片渲染成蓝色
#pragma mark - 添加所有的子控制器
- (void)setUpAllChildViewController
{
    // 推荐
    LWRecommendViewController *recommend = [[LWRecommendViewController alloc] init];
    [self setUpOneChildViewController:recommend image:[UIImage imageNamed:@"bar1"] selectedImage:nil title:@"推荐"];
    recommend.view.backgroundColor = [UIColor whiteColor];
    _recommend = recommend;
    // 活动
    LWActivityViewController *activity = [[LWActivityViewController alloc] init];
    [self setUpOneChildViewController:activity image:[UIImage imageNamed:@"bar2"] selectedImage:nil title:@"活动"];
    activity.view.backgroundColor = [UIColor whiteColor];
    
    // 我的
    LWProflieViewController *profile = [[LWProflieViewController alloc] init];
    [self setUpOneChildViewController:profile image:[UIImage imageNamed:@"bar3"] selectedImage:nil title:@"我的"];
    profile.view.backgroundColor = [UIColor whiteColor];
    UIViewController * abc = [[UIViewController alloc]init];
    [self addChildViewController:abc];
}

#pragma mark - 添加一个子控制器
- (void)setUpOneChildViewController:(UIViewController *)vc image:(UIImage *)image selectedImage:(UIImage *)selectedImage title:(NSString *)title
{
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selectedImage;
    [self.items addObject:vc.tabBarItem];
    LWNavigationController * nav = [[LWNavigationController alloc]initWithRootViewController:vc];
    [self addChildViewController:nav];
}





@end
