//
//  TabBarViewController.m
//  CLKuGou
//
//  Created by Darren on 16/7/30.
//  Copyright © 2016年 darren. All rights reserved.
//

#import "TabBarViewController.h"
#import "MainViewController.h"
#import "TabBarView.h"

@interface TabBarViewController ()


@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MainViewController *main = [[MainViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:main];
    [self addChildViewController:nav];
}
- (TabBarView *)coustomTabBar
{
    if (_coustomTabBar == nil) {
        _coustomTabBar = [TabBarView show];
        _coustomTabBar.frame = CGRectMake(0, 49-TabBarHeight, APPW, TabBarHeight);
    }
    return _coustomTabBar;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.tabBar addSubview:self.coustomTabBar];

}
@end
