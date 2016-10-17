//
//  LLCommentCell.h
//  Coach
//
//  Created by apple on 16/8/1.
//  Copyright © 2016年 sskz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LLCommentCell;

@protocol LLCommentCellDelegate <NSObject>

- (void)LLCommentCell:(LLCommentCell *)cell clickHeadBtn:(UIButton *)headBtn;

- (void)LLCommentCell:(LLCommentCell *)cell clickLikeBtn:(UIButton *)likeBtn;

@end

@interface LLCommentCell : SuperTableViewCell

@property (nonatomic,strong) UIView *bgView,*lineView;

@property (nonatomic,strong) UIButton *headBtn,*likeBtn;

@property (nonatomic,strong) UILabel *nameLbl,*contentLbl,*pubTimeLbl;

@property (nonatomic,assign) id delegate;

@end
