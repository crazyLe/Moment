//
//  LLMomentHeaderView.m
//  Coach
//
//  Created by apple on 16/8/1.
//  Copyright © 2016年 sskz. All rights reserved.
//

#define kContentRightOffset (-25*kWidthScale)

#import "LLMomentHeaderView.h"

@implementation LLMomentHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self setUI];
        [self setContraints];
        [self setAttributes];
    }
    return self;
}

#pragma mark - Setup

- (void)setUI
{
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
    
    _commentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_bgView addSubview:_commentBtn];
    
    _forwardBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_bgView addSubview:_forwardBtn];
    
    _sepImgView = [UIImageView new];
    [_bgView addSubview:_sepImgView];
    
    _titleBgView = [UIView new];
    [_bgView addSubview:_titleBgView];
    
    _titleLbl = [UILabel new];
    [_bgView addSubview:_titleLbl];
    
    _imgViewArr = [[NSMutableArray alloc] init];
    
    WeakObj(_contentLbl)
    int imgNum = 4;
    CGFloat imgViewWidth = 100*kHeightScale;
    CGFloat imgViewHeight = imgViewWidth;
    CGFloat imgViewInterval = 2*kWidthScale;
    for (int i = 0;  i < imgNum; i++) {
        UIImageView *imgView = [[UIImageView alloc] init];
        [self.contentView addSubview:imgView];
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_contentLblWeak).offset(i==0||i==2?0:imgViewWidth+imgViewInterval);
            make.top.equalTo(_contentLblWeak.mas_bottom).offset(i==0||i==1?17*kHeightScale:17*kHeightScale+imgViewHeight+imgViewInterval);
            make.width.height.offset(imgViewWidth);
        }];
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        imgView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImgView:)];
        [imgView addGestureRecognizer:tap];
        [_imgViewArr addObject:imgView];
    }
}

- (void)setContraints
{
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(15, 0, 0, 0));
    }];
    
    [_headBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(12*kWidthScale);
        make.top.offset(6*kHeightScale);
        make.width.height.offset(40*kWidthScale);
    }];
    
    WeakObj(_headBtn)
    [_nameLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_headBtnWeak.mas_right).offset(11*kWidthScale);
        make.top.equalTo(_headBtnWeak);
        make.right.offset(-10);
        make.height.offset(35*kHeightScale);
    }];
    
    WeakObj(_nameLbl)
    [_contentLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameLblWeak);
        make.top.equalTo(_nameLblWeak.mas_bottom);
        make.right.offset(kContentRightOffset);
    }];
    
    WeakObj(_imgViewArr)
    [_pubTimeLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameLblWeak);
        make.top.equalTo(((UIImageView *)[_imgViewArrWeak lastObject]).mas_bottom).offset(10*kHeightScale);
        make.width.offset(125*kWidthScale);
        make.height.offset(25*kHeightScale);
    }];
    
    WeakObj(_pubTimeLbl)
    [_likeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_pubTimeLblWeak.mas_right);
        make.width.offset(40*kWidthScale);
        make.centerY.equalTo(_pubTimeLblWeak);
        make.height.offset(35*kHeightScale);
    }];
    
    WeakObj(_likeBtn)
    [_commentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_likeBtnWeak.mas_right);
        make.centerY.equalTo(_pubTimeLblWeak);
        make.width.height.equalTo(_likeBtnWeak);
    }];
    
    WeakObj(_commentBtn)
    [_forwardBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_commentBtnWeak.mas_right);
        make.centerY.equalTo(_pubTimeLblWeak);
        make.width.height.equalTo(_likeBtnWeak);
    }];
    
    [_sepImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.equalTo(_pubTimeLblWeak.mas_bottom);
        make.height.offset(20);
    }];
    
    WeakObj(_sepImgView)
    [_titleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15*kWidthScale);
        make.top.equalTo(_sepImgViewWeak.mas_bottom).offset(5);
        make.height.offset(25*kHeightScale);
        make.right.offset(-10);
    }];
    
    [_titleBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_sepImgViewWeak.mas_bottom).offset(-2);
        make.left.bottom.right.offset(0);
    }];
}

- (void)setAttributes
{
    _headBtn.contentMode = UIViewContentModeScaleAspectFit;
    _headBtn.layer.masksToBounds = YES;
    [_headBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    _headBtn.tag = 10;
    
    _nameLbl.textColor = [UIColor colorWithHexString:@"16458b"];
    _nameLbl.font = kFont15;
    
    _contentLbl.numberOfLines = 0;
    
    _pubTimeLbl.textColor = kLightGreyColor;
    _pubTimeLbl.font = kFont11;
    
    [_likeBtn setTitleColor:kLightGreyColor forState:UIControlStateNormal];
    [_likeBtn setTitleColor:rgb(255, 93, 91) forState:UIControlStateSelected];
    _likeBtn.titleLabel.font = kFont12;
    [_likeBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    _likeBtn.tag = 20;
    
    [_commentBtn setTitleColor:kLightGreyColor forState:UIControlStateNormal];
    _commentBtn.titleLabel.font = _likeBtn.titleLabel.font;
    [_commentBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    _commentBtn.tag = 30;
    
    [_forwardBtn setTitleColor:kLightGreyColor forState:UIControlStateNormal];
    _forwardBtn.titleLabel.font = _likeBtn.titleLabel.font;
    [_forwardBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    _forwardBtn.tag = 40;
    
    _sepImgView.contentMode = UIViewContentModeScaleAspectFit;
    
    _titleBgView.backgroundColor = [UIColor colorWithHexString:@"fdfdfd"];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _headBtn.layer.cornerRadius = _headBtn.frame.size.width/2;
}

- (void)tapImgView:(UITapGestureRecognizer *)tap
{
    if (_delegate && [_delegate respondsToSelector:@selector(LLMomentHeaderView:clickImgView:)]) {
        [_delegate LLMomentHeaderView:self clickImgView:(UIImageView *)tap.view];
    }
}

- (void)clickBtn:(UIButton *)btn
{
    switch (btn.tag) {
        case 10:
        {
            if (_delegate && [_delegate respondsToSelector:@selector(LLMomentHeaderView:clickHeadBtn:)]) {
                [_delegate LLMomentHeaderView:self clickHeadBtn:btn];
            }
        }
            break;
        case 20:
        {
            if (_delegate && [_delegate respondsToSelector:@selector(LLMomentHeaderView:clickLikeBtn:)]) {
                [_delegate  LLMomentHeaderView:self clickLikeBtn:btn];
            }
        }
            break;
        case 30:
        {
            if (_delegate && [_delegate respondsToSelector:@selector(LLMomentHeaderView:clickCommentBtn:)]) {
                [_delegate LLMomentHeaderView:self clickCommentBtn:btn];
            }
        }
            break;
        case 40:
        {
            if (_delegate && [_delegate respondsToSelector:@selector(LLMomentHeaderView:clickForwordBtn:)]) {
                [_delegate LLMomentHeaderView:self clickForwordBtn:btn];
            }
        }
            break;
            
        default:
            break;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
