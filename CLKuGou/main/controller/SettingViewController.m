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

@property (nonatomic,strong) UIView *bottomView;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *topImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, APPW, APPH)];
    topImage.image = [UIImage imageNamed:@"set_bj1.jpg"];
    topImage.userInteractionEnabled = YES;
    [self.view addSubview:topImage];
    
    self.bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APPW, APPH)];
    [self.view addSubview:self.bottomView];
    [self.bottomView addSubview:[self setupTopView]];
    [self.bottomView addSubview:[self setupBottomView]];
    
    [self setupTableView];
    // 左滑手势
    [self setupLeftGesture];
    
    // 给mainVC增加点击手势
    [self setupMainVCTapGesture];
}

- (UIView *)setupTopView
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
    
    return self.topView;
}

- (UIView *)setupBottomView
{
    UIView *foot = [[UIView alloc] initWithFrame:CGRectMake(0, APPH-111, APPW, 110)];
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(10, 1, APPW-70, 0.5)];
    lineView.backgroundColor = [UIColor whiteColor];
    lineView.alpha = 0.3;
    [foot addSubview:lineView];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 40, 80, 30)];
    [btn setTitle:@"设置" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    [btn setImage:[UIImage imageNamed:@"setting"] forState:UIControlStateNormal];
    [foot addSubview:btn];
    return foot;
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
    [self.bottomView addSubview:tableView];
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
    if (point.x>0) {
        return;
    }
    double deltaX= fabs(point.x);
    CGFloat scare = 1-deltaX/1000.0;
    
    CGFloat tranX = -fabs(deltaX)/200.0;
    CGFloat tranY = fabs(deltaX)/1000.0;

//    NSLog(@"%f",(1-deltaX/1000.0));
    NSLog(@"%f",scare);
    if (0.5<scare<1) {
        self.bottomView.transform = CGAffineTransformMakeScale(0.5,0.5);
    } else {
        self.bottomView.transform = CGAffineTransformScale(self.view.transform, scare, scare);
        
        if (((APPW-50)/APPW + tranX)>=0) {
            self.presentingViewController.view.x =  ((APPW-50)/APPW + tranX)*APPW;
            self.presentingViewController.view.y =  (100/APPH-tranY)*APPH;
            self.presentingViewController.view.height = APPH-2*self.presentingViewController.view.y;
        }
        
        if (pan.state == UIGestureRecognizerStateEnded) {
            if (((APPW-50)/APPW + tranX)<=0.2) {
                [UIView animateWithDuration:0.1 animations:^{
                    self.presentingViewController.view.x = 0;
                    self.presentingViewController.view.y = 0;
                    self.presentingViewController.view.height = APPH;
                    self.bottomView.transform = CGAffineTransformMakeScale(1,1);
                } completion:^(BOOL finished) {
                    [self dismissViewControllerAnimated:YES completion:nil];
                    [CLNotificationCenter postNotificationName:ChangeMainVCContentEnable object:nil];
                }];
            } else {
                [UIView animateWithDuration:0.3 animations:^{
                    self.presentingViewController.view.x = APPW-50;
                    self.presentingViewController.view.y = 100;
                    self.presentingViewController.view.height = APPH-200;
                    self.bottomView.transform = CGAffineTransformMakeScale(1,1);
                }];
            }
        }
    }
}

- (void)setupMainVCTapGesture
{
    [self.presentingViewController.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickMainVC)]];
}
- (void)clickMainVC
{
    [self dismissViewControllerAnimated:YES completion:^{
        [CLNotificationCenter postNotificationName:ChangeMainVCContentEnable object:nil];
    }];
}
@end
