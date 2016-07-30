//
//  NavgationBarView.m
//  CLKuGou
//
//  Created by Darren on 16/7/30.
//  Copyright © 2016年 darren. All rights reserved.
//

#import "NavgationBarView.h"

@implementation NavgationBarView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _titleLabel = [[UILabel alloc] init];
        _titleLine  = [[UILabel alloc] init];
        _titleLine.backgroundColor = [UIColor grayColor];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.numberOfLines = 1;
        _titleLabel.textColor = NavBarItemBtnColor;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = NavTextFont;
        [self addSubview:_titleLabel];
        [self addSubview:_titleLine];
        
        self.backgroundColor = NavColor;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _titleLabel.frame = CGRectMake(0, 20, APPW, 64-20);
    _titleLine.frame = CGRectMake(0, 64, APPW, 0.26);
}

@end
