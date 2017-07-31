//
//  MenuTableViewCell.m
//  DKPopMenu
//
//  Created by NSLog on 2017/7/31.
//  Copyright © 2017年 DK-Coder. All rights reserved.
//

#import "MenuTableViewCell.h"

@implementation MenuTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat viewWidth = CGRectGetWidth(self.frame);
    CGFloat viewHeight = CGRectGetHeight(self.frame);
    if (_imageIcon.image) {
        CGSize size = _imageIcon.image.size;
        CGFloat iconHeight = 30.f;
        CGFloat iconWidth = iconHeight * size.width / size.height;
        _imageIcon.frame = CGRectMake(10.f, (viewHeight - iconHeight) / 2, iconWidth, iconHeight);
    }
    
    if (_labelText) {
        _labelText.frame = CGRectMake(CGRectGetMaxX(_imageIcon.frame) + 5.f, (viewHeight - 30.f) / 2, viewWidth - CGRectGetMaxX(_imageIcon.frame) - 10.f, 30.f);
    }
}

#pragma mark - getter
- (UIImageView *)imageIcon
{
    if (!_imageIcon) {
        _imageIcon = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageIcon];
    }
    return _imageIcon;
}

- (UILabel *)labelText
{
    if (!_labelText) {
        _labelText = [[UILabel alloc] init];
        _labelText.font = [UIFont systemFontOfSize:15.f];
        [self.contentView addSubview:_labelText];
    }
    return _labelText;
}
@end
