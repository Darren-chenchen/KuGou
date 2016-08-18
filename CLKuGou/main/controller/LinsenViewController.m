//
//  LinsenViewController.m
//  CLKuGou
//
//  Created by Darren on 16/7/29.
//  Copyright © 2016年 darren. All rights reserved.
//

#define headerH 300

#import "LinsenViewController.h"
#import "mainCell.h"
#import "mainHeaderView.h"
#import "LocalMusicViewController.h"

@interface LinsenViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,weak) UITableView *tableView;

@property (nonatomic,strong) NSArray *titlesArr;

@property (nonatomic,strong) mainHeaderView *headerView;
@end

@implementation LinsenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titlesArr = @[@"工具",@"游戏",@"推广"];
    [self setupTableView];
}
- (mainHeaderView *)headerView
{
    if (_headerView == nil) {
        _headerView = [[mainHeaderView alloc] initWithFrame:CGRectMake(0, 0, APPW, headerH)];
    }
    return _headerView;
}
#pragma mark - 创建tableView
- (void)setupTableView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, APPW, APPH-TabBarHeight+2) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    self.tableView = tableView;
    tableView.tableFooterView = [UIView new];
    tableView.showsVerticalScrollIndicator = NO;
    tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bj"]];
    tableView.backgroundView.contentMode = UIViewContentModeRedraw;
    tableView.tableHeaderView = self.headerView;
    tableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    [self.view addSubview:tableView];
    
    UIView *viewtab = [[UIView alloc] initWithFrame:CGRectMake(0, headerH+44*self.titlesArr.count, APPW, 500)];
    viewtab.backgroundColor = [UIColor whiteColor];
    [tableView addSubview:viewtab];
    
    // 访问系统本地音乐
    WS(weakSelf);
    self.headerView.localMusic = ^{
        LocalMusicViewController *localVC = [[LocalMusicViewController alloc] init];
        [weakSelf.navigationController pushViewController:localVC animated:NO];
    };
}
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    mainCell *cell = [mainCell cellWithTableView:tableView];
    cell.imageView.image = [UIImage imageNamed:@"music"];
    cell.textLabel.text = self.titlesArr[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
@end
