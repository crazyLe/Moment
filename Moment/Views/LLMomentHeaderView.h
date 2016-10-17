//
//  LLMomentHeaderView.h
//  Coach
//
//  Created by apple on 16/8/1.
//  Copyright © 2016年 sskz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LLMomentHeaderView;

@protocol LLMomentHeaderViewDelegate <NSObject>

- (void)LLMomentHeaderView:(LLMomentHeaderView *)view clickHeadBtn:(UIButton *)headBtn;

- (void)LLMomentHeaderView:(LLMomentHeaderView *)view clickImgView:(UIImageView *)imgView;

- (void)LLMomentHeaderView:(LLMomentHeaderView *)view clickLikeBtn:(UIButton *)likeBtn;

- (void)LLMomentHeaderView:(LLMomentHeaderView *)view clickCommentBtn:(UIButton *)commentBtn;

- (void)LLMomentHeaderView:(LLMomentHeaderView *)view clickForwordBtn:(UIButton *)forwardBtn;

@end

@interface LLMomentHeaderView : UITableViewHeaderFooterView

@property (nonatomic,strong) UIView *bgView;

@property (nonatomic,strong) UIButton *headBtn,*likeBtn,*commentBtn,*forwardBtn;

@property (nonatomic,strong) UILabel  *nameLbl,*contentLbl,*pubTimeLbl,*titleLbl;

@property (nonatomic,strong) NSMutableArray *imgViewArr;

@property (nonatomic,strong) UIImageView *sepImgView;

@property (nonatomic,strong) UIView *titleBgView;

@property (nonatomic,assign) id delegate;

@end
