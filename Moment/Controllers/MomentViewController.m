//
//  MomentViewController.m
//  Coach
//
//  Created by apple on 16/7/8.
//  Copyright © 2016年 sskz. All rights reserved.
//

#import "LLNewMessageCell.h"
#import "LLCommentCell.h"
#import "LLMomentHeaderView.h"
#import "MomentViewController.h"

@interface MomentViewController ()

@end

@implementation MomentViewController
{
    UITableView *bg_TableView;
    UISegmentedControl *segmentedControl;
}

- (id)init
{
    if (self = [super init]) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavigation];
    [self setUI];
}

#pragma mark - Setup

- (void)setNavigation
{
    self.navigationController.navigationBar.barTintColor = kAppThemeColor;
    
    segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"新消息",@"已发布"]];
    segmentedControl.bounds = CGRectMake(0, 0, 200, 30);
    [segmentedControl addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
    [segmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"ffffff" ],NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateNormal];
    [segmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName:kAppThemeColor,NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateSelected];
    segmentedControl.tintColor = [UIColor colorWithHexString:@"ffffff"];
    [self.navigationController.navigationBar.topItem setTitleView:segmentedControl];
    segmentedControl.selectedSegmentIndex = 0;
}

- (void)setUI
{
    [self setBg_TableView];
}

- (void)setBg_TableView
{
    bg_TableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    [self.view addSubview:bg_TableView];
    [bg_TableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    bg_TableView.delegate = self;
    bg_TableView.dataSource = self;
    [bg_TableView registerClass:[LLMomentHeaderView class] forHeaderFooterViewReuseIdentifier:@"LLMomentHeaderView"];
    [bg_TableView registerClass:[LLCommentCell class] forCellReuseIdentifier:@"LLCommentCell"];
    [bg_TableView registerClass:[LLNewMessageCell class] forCellReuseIdentifier:@"LLNewMessageCell"];
    bg_TableView.backgroundColor = kBackgroundColor;
//    [bg_TableView setSeparatorColor:kLineColor];
    bg_TableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    [self setSeparatorInsetWithTableView:bg_TableView inset:UIEdgeInsetsMake(0, 3, 0, 3)];
}

#pragma mark - UITableViewDelegate && UITableViewDateSource

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (segmentedControl.selectedSegmentIndex == 0) {
        return 15;
    }
    else
    {
         return 410*kHeightScale;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (segmentedControl.selectedSegmentIndex == 0) {
         return 1;
    }
    else
    {
         return 2;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (segmentedControl.selectedSegmentIndex == 0) {
        return 4;
    }
    else
    {
        return 3;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (segmentedControl.selectedSegmentIndex == 0) {
        return 60*kHeightScale;
    }
    else
    {
        return 110*kHeightScale;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (segmentedControl.selectedSegmentIndex == 0) {
        return [UIView new];
    }
    else
    {
        LLMomentHeaderView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"LLMomentHeaderView"];
        view.backgroundColor = [UIColor clearColor];
        view.bgView.backgroundColor = [UIColor  colorWithHexString:@"ffffff"];
        [view.headBtn setImage:[UIImage imageNamed:@"圈子大头像1"] forState:UIControlStateNormal];
        view.nameLbl.text = @"嫣然为诗笑";
        NSMutableAttributedString *attStr = [NSMutableAttributedString attributeStringWithText:@"#吐槽#" attributes:@[[UIColor colorWithHexString:@"999999"],kFont14]];
        [attStr appendText:@"驾照已收到，感谢学车秘书这60天的陪伴，以后常联系。" withAttributesArr:@[[UIColor colorWithHexString:@"333333"],kFont14]];
        view.contentLbl.attributedText = attStr;
        for (int i = 0; i < 4; i++) {
            UIImageView *imgView = view.imgViewArr[i];
            imgView.image = [UIImage imageNamed:i==0?@"圈子图层-1":i==1?@"圈子图层-2":i==2?@"圈子图层-3":@"圈子图层-4"];
        }
        view.pubTimeLbl.text = @"1小时前  安徽 合肥";
        [view.likeBtn setImage:[UIImage imageNamed:@"iconfont-circle-za2n"] forState:UIControlStateNormal];
        [view.likeBtn setImage:[UIImage imageNamed:@"iconfont-circle-zan-copy"] forState:UIControlStateSelected];
        [view.commentBtn setImage:[UIImage imageNamed:@"iconfont-circle-talk"] forState:UIControlStateNormal];
        [view.forwardBtn setImage:[UIImage imageNamed:@"iconfont-zhuanfa"] forState:UIControlStateNormal];
        [view.likeBtn setTitle:@"9" forState:UIControlStateNormal];
        [view.commentBtn setTitle:@"21" forState:UIControlStateNormal];
        [view.forwardBtn setTitle:@"45" forState:UIControlStateNormal];
        
        view.likeBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, -5);
        view.commentBtn.titleEdgeInsets = view.likeBtn.titleEdgeInsets;
        view.forwardBtn.titleEdgeInsets = view.likeBtn.titleEdgeInsets;
        
        view.likeBtn.selected = YES;
        
        view.sepImgView.image = [UIImage imageNamed:@"Moment_Sep"];
        NSMutableAttributedString *titleAttStr = [NSMutableAttributedString attributeStringWithImg:[UIImage imageNamed:@"iconfont-redstar"] bounds:CGRectMake(0, -1.5, 15, 15)];
        [titleAttStr appendText:@" 热门评论  (3)" withAttributesArr:@[kDarkGrayColor,kFont15]];
        view.titleLbl.attributedText = titleAttStr;
        
        return view;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (segmentedControl.selectedSegmentIndex == 0) {
        LLNewMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LLNewMessageCell"];
        [cell.headBtn setImage:[UIImage imageNamed:@"圈子大头像34"] forState:UIControlStateNormal];
        cell.nameLbl.text = @"嫣然为诗笑";
        cell.contentLbl.text = @"赞了你的圈子";
        cell.accessoryImgView.image = [UIImage imageNamed:@"iconfont-jiantou"];
        return cell;
    }
    else
    {
        LLCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LLCommentCell"];
        [cell.headBtn setImage:[UIImage imageNamed:@"圈子大头像34"] forState:UIControlStateNormal];
        NSMutableAttributedString *attStr = [NSMutableAttributedString attributeStringWithText:@"张晓彬" attributes:@[[UIColor colorWithHexString:@"16458b"],kFont15]];
        [attStr appendText:@"   评论了嫣然为诗笑的圈子" withAttributesArr:@[kLightGreyColor,kFont11]];
        cell.nameLbl.attributedText = attStr;
        cell.contentLbl.text = @"不是跟你吹牛逼，我在康庄学车30天就拿到了驾照";
        cell.pubTimeLbl.text = @"2016-05-23 15:52:22";
        [cell.likeBtn setImage:[UIImage imageNamed:@"iconfont-circle-za2n"] forState:UIControlStateNormal];
        [cell.likeBtn setImage:[UIImage imageNamed:@"iconfont-circle-zan-copy"] forState:UIControlStateSelected];
        [cell.likeBtn setTitle:@"9" forState:UIControlStateNormal];
        if (indexPath.row == [tableView numberOfRowsInSection:indexPath.section]-1) {
            cell.lineView.hidden = YES;
        }
        else
        {
            cell.lineView.hidden = NO;
        }
        return cell;
    }
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)segmentedControlChangedValue:(UISegmentedControl *)segment
{
    [bg_TableView reloadData];
}

@end
