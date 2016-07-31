//
//  CoustomPresentationController.m
//  Budayang
//
//  Created by darren on 16/3/24.
//  Copyright © 2016年 chinaPnr. All rights reserved.
//

#import "CoustomPresentationController.h"

@implementation CoustomPresentationController
- (void)presentationTransitionWillBegin
{
    self.presentedView.frame = CGRectMake(0, 0,APPW, APPH);
    [self.containerView addSubview:self.presentedView];
    
    [self.containerView addSubview:self.presentingViewController.view];
    
    [UIView animateWithDuration:0.2 animations:^{
        self.presentingViewController.view.x = APPW-50;
        self.presentingViewController.view.y = 100;
        self.presentingViewController.view.height = APPH-200;
    }];
}

- (void)presentationTransitionDidEnd:(BOOL)completed
{
    
}

- (void)dismissalTransitionWillBegin
{
    [[UIApplication sharedApplication].keyWindow addSubview:self.presentingViewController.view];
    [UIView animateWithDuration:0.5 animations:^{
        self.presentingViewController.view.x = 0;
        self.presentingViewController.view.y = 0;
        self.presentingViewController.view.height = APPH;
    }];
}

- (void)dismissalTransitionDidEnd:(BOOL)completed
{
    [self.presentedView removeFromSuperview];
}
@end
