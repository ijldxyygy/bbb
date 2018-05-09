//
//  DpLabel.h
//  Prlife
//
//  Created by ijldxyygy on 15/11/5.
//  Copyright (c) 2015年 LinkXin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DpLabel : UILabel
/**
 *  设置UILabel的对齐方式
 
 对于官方已经提供UILabel的一些对齐方式，在这里就不做说明了，这里主要补充官方没有提供的对齐方式。主要提供了三种常用的对齐方式：垂直顶端对齐、顶端居中对齐、顶端靠右对齐。
 
 测试
 <span style="font-size:18px;">- (void)viewDidLoad {
 [super viewDidLoad];
 
 DpLabel *label = [[DpLabel alloc] initWithFrame:CGRectMake(20, 120, self.view.frame.size.width-40, 50)];
 label.text = @测试对齐方式;
 label.textAlignment = VerticalAlignmentTop;
 label.backgroundColor = [UIColor redColor];
 [self.view addSubview:label];
 }</span>
 */
typedef enum{
    VerticalAlignmentTop = 0, //default 垂直顶端对齐
    VerticalAlignmentMidele,  //顶端居中对齐
    VerticalAlignmentBottom,  //顶端靠右对齐
}VerticalAlignment;

@property (nonatomic, assign) VerticalAlignment verticalAlignment;
@end
