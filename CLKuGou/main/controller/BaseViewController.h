//
//  BaseViewController.h
//  CLKuGou
//
//  Created by Darren on 16/7/30.
//  Copyright © 2016年 darren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavgationBarView.h"

@interface BaseViewController : UIViewController
@property (strong, nonatomic ) NavgationBarView        *navBar;
@property (strong, nonatomic          ) UIImageView            *backItem;
@property (strong, nonatomic          ) UIImageView            *leftItem;
@property (strong, nonatomic          ) UIImageView            *rightItem;
@property (strong, nonatomic          ) UIButton               *leftButton;
@property (strong, nonatomic          ) UIButton               *rightButton;

- (void)backItemTouched:(id)sender;
- (void)leftItemTouched:(id)sender;
- (void)rightItemTouched:(id)sender;
- (void)leftButtonClick:(id)sender;
- (void)rightButtonClick:(id)sender;

/**
 *  返回实现
 */
- (void)goBack;
/**
 *  返回
 */
- (void)addBackItem;
/**
 *  添加左侧按钮，传入图片名
 *
 *  @param rightItemImageName  传入图片名
 */
- (void)addleftItem:(NSString *)leftItemImageName;
/**
 *  添加右侧按钮，传入图片名
 *
 *  @param rightItemImageName  传入图片名
 */
- (void)addrightItem:(NSString *)rightItemImageName;

/**
 *  添加左侧按钮。传入一个Title
 *
 *  @param Title
 */
- (void)addleftButton:(NSString *)Title;
/**
 *  添加右侧按钮。传入一个Title
 *
 *  @param Title
 */
- (void)addrightButton:(NSString *)Title;

@end
