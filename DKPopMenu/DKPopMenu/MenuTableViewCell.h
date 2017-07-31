//
//  MenuTableViewCell.h
//  DKPopMenu
//
//  Created by NSLog on 2017/7/31.
//  Copyright © 2017年 DK-Coder. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *kMenuTableViewCellIdentifier = @"kMenuTableViewCellIdentifier";

@interface MenuTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *imageIcon;

@property (nonatomic, strong) UILabel *labelText;

@property (nonatomic) NSInteger badgeValue;
@end
