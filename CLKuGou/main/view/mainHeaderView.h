//
//  mainHeaderView.h
//  CLKuGou
//
//  Created by Darren on 16/7/30.
//  Copyright © 2016年 darren. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^clickLocalMusicBlock)();

@interface mainHeaderView : UIView

@property (nonatomic,copy) clickLocalMusicBlock localMusic;

@end
