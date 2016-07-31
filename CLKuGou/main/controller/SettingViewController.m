//
//  SettingViewController.m
//  CLKuGou
//
//  Created by Darren on 16/7/29.
//  Copyright © 2016年 darren. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,weak) UITableView *tableView;

@property (nonatomic,strong) UIView *topView;
@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *topImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, APPW, APPH)];
    topImage.image = [UIImage imageNamed:@"set_bj1.jpg"];
    topImage.userInteractionEnabled = YES;
    [self.view addSubview:topImage];
    
    [self setupTopView];
    
    [self setupTableView];
    
    [self setupBottomView];
    
    // 左滑手势
    [self setupLeftGesture];
}

- (void)setupTopView
{
    self.topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPW, 100)];
    [self.view addSubview:self.topView];
    
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(15, 0, 40, 40)];
    img.image = [UIImage imageNamed:@"placeHoder-128"];
    img.centerY = self.topView.centerY;
    img.layer.cornerRadius = img.width*0.5;
    img.layer.masksToBounds = YES;
    [self.topView addSubview:img];
    
    UIImageView *img2 = [[UIImageView alloc] initWithFrame:CGRectMake(APPW-80, 0, 40, 40)];
    img2.image = [UIImage imageNamed:@"placeHoder-128"];
    img2.centerY = self.topView.centerY;
    img2.layer.cornerRadius = img.width*0.5;
    img2.layer.masksToBounds = YES;
    [self.topView addSubview:img2];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(10, 105, APPW-70, 0.5)];
    lineView.backgroundColor = [UIColor whiteColor];
    lineView.alpha = 0.3;
    [self.topView addSubview:lineView];
}

- (void)setupBottomView
{
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(10, APPH-110, APPW-70, 0.5)];
    lineView.backgroundColor = [UIColor whiteColor];
    lineView.alpha = 0.3;
    [self.view addSubview:lineView];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(20, APPH-80, 80, 30)];
    [btn setTitle:@"设置" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    [btn setImage:[UIImage imageNamed:@"setting"] forState:UIControlStateNormal];
    [self.view addSubview:btn];
}
- (void)setupTableView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.topView.height+10, APPW, APPH-220) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    self.tableView = tableView;
    tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"set_bj1.jpg"]];
    tableView.tableFooterView = [UIView new];
    tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:tableView];
}
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 12;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *setId = @"setCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:setId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:setId];
    }
    cell.imageView.image = [UIImage imageNamed:@"music"];
    cell.textLabel.text = @"手机专享";
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)setupLeftGesture
{
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(clickPan:)];
    [self.view addGestureRecognizer:panGesture];
}
- (void)clickPan:(UIPanGestureRecognizer *)pan
{
    CGPoint point = [pan translationInView:self.view];
    double deltaX=fabs(point.x);
    
    NSLog(@"%f",deltaX);

//    if (0.1<=deltaX/170.0<1) {
//        self.view.transform = CGAffineTransformMakeScale(1-deltaX/170.0,1-deltaX/170.0);
//    }
//    self.view.transform = CGAffineTransformScale(self.view.transform, deltaX/150.0, deltaX/150.0);

//    self.view.transform = CGAffineTransformTranslate(self.view.transform, point.x, point.y);
//    self.view.transform = CGAffineTransformScale(self.view.transform, [str floatValue], [str floatValue]);
//    [pan setTranslation:CGPointZero inView:self.view];
}
@end
