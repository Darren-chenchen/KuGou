//
//  MainViewController.m
//  CLKuGou
//
//  Created by Darren on 16/7/29.
//  Copyright © 2016年 darren. All rights reserved.
//

#import "MainViewController.h"
#import "LinsenViewController.h"
#import "LookViewController.h"
#import "SingViewController.h"
#import "SKPresent.h"
#import "SettingViewController.h"
@interface MainViewController ()<UIScrollViewDelegate>
@property (nonatomic, weak) UIScrollView *contentView;

@property (nonatomic, strong) TitleScrollView *titleView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNav];
    
    [self setupChildViews];

    [self setupContentView];
    
    [self setupRightGesture];
    
    [CLNotificationCenter addObserver:self selector:@selector(getMessage) name:ChangeMainVCContentEnable object:nil];
}

- (void)getMessage
{
    self.contentView.userInteractionEnabled = YES;
}
- (void)dealloc{
    [CLNotificationCenter removeObserver:self];
}
- (TitleScrollView *)titleView
{
    if (_titleView == nil) {
        _titleView = [[TitleScrollView alloc] initWithFrame:CGRectMake(100, 34, APPW-200, 30) TitleArray:@[@"听",@"看",@"唱"] selectedIndex:0 scrollEnable:NO lineEqualWidth:NO color:[UIColor whiteColor] selectColor:[UIColor orangeColor] SelectBlock:^(NSInteger index) {
            [self titleClick:index];
        }];
    }
    return _titleView;
}

- (void)setupRightGesture
{
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(clickPan:)];
    [self.contentView addGestureRecognizer:panGesture];
}
- (void)clickPan:(UIPanGestureRecognizer *)pan
{
//    CGPoint point = [pan translationInView:self.view];
//    if (point.x<0) {
//        return;
//    }
//    SettingViewController *setVC = [[SettingViewController alloc] init];
//    double deltaX= fabs(point.x);
//    CGFloat scare = 1-deltaX/1000.0;
//    
//    CGFloat tranX = -fabs(deltaX)/200.0;
//    CGFloat tranY = fabs(deltaX)/1000.0;
//    
//    //    NSLog(@"%f",(1-deltaX/1000.0));
//    NSLog(@"%f",scare);
//    if (0.5<scare<1) {
//        setVC.view.transform =CGAffineTransformMakeScale(0.5,0.5);
//        [self.view addSubview:setVC.view];
//        self.view.transform = CGAffineTransformMakeScale(0.5,0.5);
//    } else {
//        self.view.transform = CGAffineTransformScale(self.view.transform, scare, scare);
//        
//        if (((APPW-50)/APPW + tranX)>=0) {
//            self.presentingViewController.view.x =  ((APPW-50)/APPW + tranX)*APPW;
//            self.presentingViewController.view.y =  (100/APPH-tranY)*APPH;
//            self.presentingViewController.view.height = APPH-2*self.presentingViewController.view.y;
//        }
//        
//        if (pan.state == UIGestureRecognizerStateEnded) {
//            if (((APPW-50)/APPW + tranX)<=0.2) {
//                [UIView animateWithDuration:0.1 animations:^{
//                    self.presentingViewController.view.x = 0;
//                    self.presentingViewController.view.y = 0;
//                    self.presentingViewController.view.height = APPH;
//                    self.bottomView.transform = CGAffineTransformMakeScale(1,1);
//                } completion:^(BOOL finished) {
//                    [self dismissViewControllerAnimated:YES completion:nil];
//                    [CLNotificationCenter postNotificationName:ChangeMainVCContentEnable object:nil];
//                }];
//            } else {
//                [UIView animateWithDuration:0.3 animations:^{
//                    self.presentingViewController.view.x = APPW-50;
//                    self.presentingViewController.view.y = 100;
//                    self.presentingViewController.view.height = APPH-200;
//                    self.bottomView.transform = CGAffineTransformMakeScale(1,1);
//                }];
//            }
//        }
//    }
}

- (void)setupNav
{
    [self.navBar addSubview:self.titleView];    
    self.leftItem.image = [UIImage imageNamed:@"placeHoder-128"];
    self.leftItem.frame = CGRectMake(15, 34, 25, 25);
    KGViewsBorder(self.leftItem, self.leftItem.width*0.5, 1, [UIColor grayColor])
    
    self.rightItem.image = [UIImage imageNamed:@"main_search"];
    self.rightItem.frame = CGRectMake(APPW-40, 34, 20, 20);
    
    self.navBar.backgroundColor = [UIColor colorWithWhite:1 alpha:0];
}

- (void)setupChildViews
{
    LinsenViewController *linsenVc = [[LinsenViewController alloc] init];
    [self addChildViewController:linsenVc];
    
    LookViewController *lookVc = [[LookViewController alloc] init];
    [self addChildViewController:lookVc];
    
    SingViewController *singVc = [[SingViewController alloc] init];
    [self addChildViewController:singVc];
}

- (void)titleClick:(NSInteger)index
{
    [self.titleView setSelectedIndex:index];
    // 滚动
    CGPoint offset = self.contentView.contentOffset;
    offset.x = index * self.contentView.width;
    [self.contentView setContentOffset:offset animated:YES];
}

/**
 * 底部的scrollView
 */
- (void)setupContentView
{
    // 不要自动调整inset
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *contentView = [[UIScrollView alloc] init];
    contentView.frame = self.view.bounds;
    contentView.delegate = self;
    contentView.bounces = NO;
    contentView.pagingEnabled = YES;
    [self.view insertSubview:contentView atIndex:0];
    contentView.contentSize = CGSizeMake(contentView.width * self.childViewControllers.count, 0);
    self.contentView = contentView;
    
    // 添加第一个控制器的view
    [self scrollViewDidEndScrollingAnimation:contentView];
}
#pragma mark - <UIScrollViewDelegate>
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    // 当前的索引
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    
    // 取出子控制器
    UIViewController *vc = self.childViewControllers[index];
    vc.view.x = scrollView.contentOffset.x;
    vc.view.y = 0; // 设置控制器view的y值为0(默认是20)
    vc.view.height = scrollView.height; // 设置控制器view的height值为整个屏幕的高度(默认是比屏幕高度少个20)
    [scrollView addSubview:vc.view];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollViewDidEndScrollingAnimation:scrollView];

    // 点击按钮
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    [self titleClick:index];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat alphe = scrollView.contentOffset.x / scrollView.width;
    
    self.navBar.backgroundColor = [UIColor colorWithRed:51/255. green:124/255. blue:200/255. alpha:alphe];
}
#pragma mark - 抽屉效果
-(void)leftItemTouched:(id)sender
{
    // 如果是已经跳转了，点击后没有反应
    if (self.view.x != 0) {
        return;
    }
    SettingViewController *setVC = [[SettingViewController alloc] init];
    SKPresent *present = [SKPresent sharedSKPresent];
    setVC.transitioningDelegate = present;
    setVC.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:setVC animated:YES completion:nil];
    self.contentView.userInteractionEnabled = NO;
}
@end
