//
//  LWBannerTableViewCell.h
//  Prlife
//
//  Created by ijldxyygy on 15/10/28.
//  Copyright (c) 2015年 LinkXin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LWBannerTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *bannerImageView;
@property (weak, nonatomic) IBOutlet UIButton *sort;
@property (weak, nonatomic) IBOutlet UILabel *bigTitle;
@property (weak, nonatomic) IBOutlet UILabel *smallTitle;

@end
