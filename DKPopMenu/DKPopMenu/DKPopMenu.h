//
//  DKPopMenu.h
//  DKPopMenu
//
//  Created by NSLog on 2017/7/31.
//  Copyright © 2017年 DK-Coder. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DKPopMenu;
@protocol DKPopMenuDelegate <NSObject>

@optional
- (void)popMenu:(DKPopMenu * _Nonnull)menu didSelectAtIndex:(NSInteger)index;

@end

@interface DKPopMenu : UIView

@property (nullable, nonatomic, copy) NSArray *arrayIconNames;

@property (nonnull, nonatomic, copy) NSArray *arrayTitles;

@property (nullable, nonatomic, weak) id<DKPopMenuDelegate> menu_delegate;

- (void)showPopMenuOnView:(UIView * _Nonnull)view frame:(CGRect)frame;
@end
