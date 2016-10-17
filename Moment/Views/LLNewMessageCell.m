//
//  LLNewMessageCell.m
//  Coach
//
//  Created by apple on 16/8/1.
//  Copyright © 2016年 sskz. All rights reserved.
//

#import "LLNewMessageCell.h"

@implementation LLNewMessageCell

#pragma mark - Setup

- (void)setUI
{
    [super setUI];
    
    _headBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.contentView addSubview:_headBtn];
    
    _nameLbl = [UILabel new];
    [self.contentView addSubview:_nameLbl];
    
    _contentLbl = [UILabel new];
    [self.contentView addSubview:_contentLbl];
    
    _accessoryImgView = [UIImageView new];
    [self.contentView addSubview:_accessoryImgView];
}

- (void)setContraints
{
    [super setContraints];
    
    [_headBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(12*kWidthScale);
        make.centerY.offset(0);
        make.width.height.offset(40*kWidthScale);
    }];
    
    WeakObj(_headBtn)
    WeakObj(_accessoryImgView)
    [_nameLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_headBtnWeak.mas_right).offset(9*kWidthScale);
        make.bottom.equalTo(_headBtnWeak.mas_centerY);
        make.height.offset(20*kHeightScale);
        make.right.equalTo(_accessoryImgViewWeak.mas_left).offset(-10);
    }];
    
    WeakObj(_nameLbl)
    [_contentLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.height.equalTo(_nameLblWeak);
        make.top.equalTo(_nameLblWeak.mas_bottom);
    }];
    
    [_accessoryImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-10);
        make.centerY.offset(0);
        make.width.height.offset(25);
    }];
}

- (void)setAttributes
{
    [super setAttributes];
    
    _headBtn.layer.masksToBounds = YES;
    _headBtn.contentMode = UIViewContentModeScaleAspectFit;
    
    _nameLbl.textColor = [UIColor colorWithHexString:@"16458b"];
    _nameLbl.font = kFont15;
    
    _contentLbl.textColor = [UIColor colorWithHexString:@"4d4d4d"];
    _contentLbl.font = kFont15;
    
    _accessoryImgView.contentMode = UIViewContentModeCenter;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _headBtn.layer.cornerRadius = _headBtn.frame.size.width/2;
}

@end
