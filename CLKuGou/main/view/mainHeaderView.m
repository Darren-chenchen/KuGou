//
//  mainHeaderView.m
//  CLKuGou
//
//  Created by Darren on 16/7/30.
//  Copyright © 2016年 darren. All rights reserved.
//

#import "mainHeaderView.h"
#import "CoustomButtom.h"

@interface mainHeaderView()

@property (nonatomic,strong) UIImageView *imageView;

@property (nonatomic,strong) UIView *bottomView;
@end

@implementation mainHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // 最底层
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, APPW, 170)];
        self.imageView.userInteractionEnabled = YES;
//        self.imageView.image = [UIImage imageNamed:@"bj2"];
        [self addSubview:self.imageView];
        
        //最上面
        [self setupTopButtoms];
    }
    return self;
}

- (void)setupTopButtoms
{
    CGFloat btnW = 60;
    CGFloat btnH = 60;
    CGFloat magin = (APPW-4*btnW)/5.0;
    NSArray *titleArr = @[@"我喜欢",@"歌单",@"下载",@"最近"];
    for (int i = 0; i < 4; i ++) {
        CGFloat btnX = magin + (magin + btnW)*i;
        CoustomButtom *btn = [[CoustomButtom alloc] initWithFrame:CGRectMake(btnX, 30, btnW, btnH)];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [btn setImage:[UIImage imageNamed:@"main_clock"] forState:UIControlStateNormal];
        [btn setTitle:titleArr[i] forState:UIControlStateNormal];
        [self addSubview:btn];
    }
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(10, btnH + 30 + 30, APPW-20, 0.5)];
    lineView.backgroundColor = [UIColor whiteColor];
    lineView.alpha = 0.3;
    [self addSubview:lineView];
    
    UIImageView *phoneimage = [[UIImageView alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(lineView.frame)+15, 20, 20)];
    phoneimage.image = [UIImage imageNamed:@"main_phone"];
    [self addSubview:phoneimage];
    
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(phoneimage.frame)+8, phoneimage.y, 100, 25)];
    lable.text = @"本地音乐";
    lable.font = [UIFont systemFontOfSize:14];
    lable.textColor = [UIColor whiteColor];
    [self addSubview:lable];
    
    UILabel *lable2 = [[UILabel alloc] initWithFrame:CGRectMake(APPW-130, phoneimage.y, 100, 25)];
    lable2.text = @"50首";
    lable2.font = [UIFont systemFontOfSize:12];
    lable2.textColor = [UIColor whiteColor];
    lable2.textAlignment = NSTextAlignmentRight;
    [self addSubview:lable2];
    
    UIImageView *imageArrow = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(lable2.frame), lable2.y, 25, 25)];
    imageArrow.image = [UIImage imageNamed:@"arrow"];
    [self addSubview:imageArrow];
    
    // 底部
    [self setupBottonButtons];
}

- (void)setupBottonButtons
{
    UIView *bView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.imageView.frame), APPW, 130)];
    bView.backgroundColor = [UIColor whiteColor];
    [self addSubview:bView];
    
    CGFloat btnW = 80;
    CGFloat btnH = 100;
    CGFloat magin = (APPW-3*btnW)/4.0;
    NSArray *titleArr = @[@"乐库",@"电台",@"库群"];
    for (int i = 0; i < 3; i ++) {
        CGFloat btnX = magin + (magin + btnW)*i;
        CoustomButtom *btn = [[CoustomButtom alloc] initWithFrame:CGRectMake(btnX, 15, btnW, btnH)];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"n%d",i+1]] forState:UIControlStateNormal];
        [btn setTitle:titleArr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [bView addSubview:btn];
    }

}

@end
