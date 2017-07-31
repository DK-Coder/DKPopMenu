//
//  DKPopMenu.m
//  DKPopMenu
//
//  Created by NSLog on 2017/7/31.
//  Copyright © 2017年 DK-Coder. All rights reserved.
//

#import "DKPopMenu.h"
#import "MenuTableViewCell.h"
#import "CALayer+DKAnimation.h"

static NSInteger DEFAULT_ANIMATION_DURATION = .5f;

@interface DKPopMenu () <UITableViewDelegate, UITableViewDataSource,
                        CAAnimationDelegate>
{
    
}
@property (nonatomic, strong) UITableView *tableOptions;
@end

@implementation DKPopMenu

- (void)showPopMenuOnView:(UIView *)view frame:(CGRect)frame
{
    [view addSubview:self];
    [view bringSubviewToFront:self];
    
    self.layer.anchorPoint = CGPointMake(1, 0);
    
    frame.size.height = self.tableOptions.rowHeight * self.arrayTitles.count;
    self.frame = frame;
    self.tableOptions.frame = self.bounds;
    
    [self addShowAniamtion];
}

#pragma mark - 内部方法实现
- (void)hidePopMenu
{
    [self addHideAnimation];
}

- (void)addShowAniamtion
{
    [self.layer addAlphaAnimationWithDuration:DEFAULT_ANIMATION_DURATION from:0.f to:1.f animationKey:nil complete:nil];
    
    [self.layer addScaleAnimationWithDuration:DEFAULT_ANIMATION_DURATION from:.3f to:1.f animationKey:nil complete:nil];
}

- (void)addHideAnimation
{
    [self.layer addScaleAnimationWithDuration:DEFAULT_ANIMATION_DURATION from:1.f to:.3f animationKey:nil complete:nil];
    
//    CABasicAnimation *alphaAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
//    alphaAnimation.duration = DEFAULT_ANIMATION_DURATION;
//    alphaAnimation.fromValue = @(1.f);
//    alphaAnimation.toValue = @(0.f);
//    alphaAnimation.fillMode = kCAFillModeForwards;
//    alphaAnimation.removedOnCompletion = NO;
//    alphaAnimation.delegate = self;
//    [self.layer addAnimation:alphaAnimation forKey:@"hideAlphaAnimation"];
    [self.layer addAlphaAnimationWithDuration:DEFAULT_ANIMATION_DURATION from:1.f to:0.f animationKey:nil complete:^{
        [self.tableOptions removeFromSuperview];
        self.tableOptions = nil;
        [self removeFromSuperview];
    }];
}

#pragma mark - caanimation 代理
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (flag) {
        [self.tableOptions removeFromSuperview];
        self.tableOptions = nil;
        [self removeFromSuperview];
    }
}

#pragma mark - table view 数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrayTitles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMenuTableViewCellIdentifier];
    NSInteger row = indexPath.row;
    cell.imageIcon.image = [UIImage imageNamed:self.arrayIconNames[row]];
    cell.labelText.text = self.arrayTitles[row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

#pragma mark - table view 代理
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.menu_delegate && [self.menu_delegate respondsToSelector:@selector(popMenu:didSelectAtIndex:)]) {
        [self.menu_delegate popMenu:self didSelectAtIndex:indexPath.row];
    }
    [self hidePopMenu];
}

#pragma mark - getter
- (UITableView *)tableOptions
{
    if (!_tableOptions) {
        _tableOptions = [[UITableView alloc] init];
        _tableOptions.delegate = self;
        _tableOptions.dataSource = self;
        _tableOptions.rowHeight = 40.f;
        _tableOptions.separatorInset = UIEdgeInsetsZero;
        _tableOptions.tableFooterView = [UIView new];
        [_tableOptions registerClass:[MenuTableViewCell class] forCellReuseIdentifier:kMenuTableViewCellIdentifier];
        [self addSubview:_tableOptions];
    }
    return _tableOptions;
}
@end
