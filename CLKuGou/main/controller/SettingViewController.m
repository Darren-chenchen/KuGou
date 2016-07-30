//
//  SettingViewController.m
//  CLKuGou
//
//  Created by Darren on 16/7/29.
//  Copyright © 2016年 darren. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 30, 30, 30)];
    btn.backgroundColor = [UIColor blackColor];
    [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}
- (void)clickBtn:(UIButton *)btn
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)dealloc
{
    [CLNotificationCenter removeObserver:self];
}
@end
