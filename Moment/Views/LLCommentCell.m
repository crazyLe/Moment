//
//  LLCommentCell.m
//  Coach
//
//  Created by apple on 16/8/1.
//  Copyright © 2016年 sskz. All rights reserved.
//

#define kHeadBtnOffset 12*kWidthScale

#import "LLCommentCell.h"

@implementation LLCommentCell

#pragma mark - Setup

- (void)setUI
{
    [super setUI];
    
    _bgView = [UIView new];
    [self.contentView addSubview:_bgView];
    
    _headBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_bgView addSubview:_headBtn];
    
    _nameLbl = [UILabel new];
    [_bgView addSubview:_nameLbl];
    
    _contentLbl = [UILabel new];
    [_bgView addSubview:_contentLbl];
    
    _pubTimeLbl = [UILabel new];
    [_bgView addSubview:_pubTimeLbl];
    
    _likeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_bgView addSubview:_likeBtn];
    
    _lineView = [UIView new];
    [_bgView addSubview:_lineView];
}

- (void)setContraints
{
    [super setContraints];
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    [_headBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(kHeadBtnOffset);
        make.width.height.offset(40*kWidthScale);
    }];
    
    WeakObj(_headBtn)
    WeakObj(_likeBtn)
    [_nameLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_headBtnWeak.mas_right).offset(11*kWidthScale);
        make.top.equalTo(_headBtnWeak);
        make.right.equalTo(_likeBtnWeak.mas_left).offset(-10*kWidthScale);
        make.height.offset(20*kHeightScale);
    }];
    
    WeakObj(_nameLbl)
    [_contentLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameLblWeak);
        make.top.equalTo(_nameLblWeak.mas_bottom).offset(5);
        make.right.offset(-20*kWidthScale);
    }];
    
    WeakObj(_contentLbl)
    [_pubTimeLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameLblWeak);
        make.top.equalTo(_contentLblWeak.mas_bottom).offset(5);
        make.right.equalTo(_contentLblWeak);
        make.height.offset(20*kHeightScale);
    }];
    
    [_likeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameLblWeak.mas_right);
        make.top.bottom.equalTo(_nameLblWeak);
        make.right.offset(0);
    }];
    
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.offset(0);
        make.height.offset(kLineWidth);
    }];
}

- (void)setAttributes
{
    [super setAttributes];
    
    _bgView.backgroundColor = [UIColor colorWithHexString:@"fdfdfd"];
    
    _headBtn.layer.masksToBounds = YES;
    _headBtn.contentMode = UIViewContentModeScaleAspectFit;
    _headBtn.tag = 10;
    [_headBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    _contentLbl.textColor = kDarkGrayColor;
    _contentLbl.font = kFont14;
    _contentLbl.numberOfLines = 0;
    
    _pubTimeLbl.textColor = kLightGreyColor;
    _pubTimeLbl.font = kFont11;
    
    [_likeBtn setTitleColor:kLightGreyColor forState:UIControlStateNormal];
    _likeBtn.titleLabel.font = kFont12;
    _likeBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, -5);
    [_likeBtn setTitleColor:rgb(255, 93, 91) forState:UIControlStateSelected];
    _likeBtn.tag = 20;
    [_likeBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    _lineView.backgroundColor = kLineColor;
}

- (void)clickBtn:(UIButton *)btn
{
    if (btn.tag == 10) {
        if (_delegate && [_delegate respondsToSelector:@selector(LLCommentCell:clickHeadBtn:)]) {
            [_delegate LLCommentCell:self clickHeadBtn:btn];
        }
    }
    else
    {
        if (_delegate && [_delegate respondsToSelector:@selector(LLCommentCell:clickLikeBtn:)]) {
            [_delegate LLCommentCell:self clickLikeBtn:btn];
        }
    }
}

@end
