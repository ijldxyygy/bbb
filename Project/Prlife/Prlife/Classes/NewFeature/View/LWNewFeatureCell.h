//
//  LWNewFeatureController.h
//
//  Created by W.LW on 12-3-7.
//  Copyright (c) 2012年 W.LW All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LWNewFeatureCell : UICollectionViewCell

@property (nonatomic, strong) UIImage *image;


// 判断是否是最后一页
- (void)setIndexPath:(NSIndexPath *)indexPath count:(int)count;
@end
