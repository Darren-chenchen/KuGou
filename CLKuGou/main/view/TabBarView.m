//
//  TabBarView.m
//  CLKuGou
//
//  Created by Darren on 16/7/30.
//  Copyright © 2016年 darren. All rights reserved.
//

#import "TabBarView.h"

@interface TabBarView()
@property (weak, nonatomic) IBOutlet UIImageView *IconView;
@property (weak, nonatomic) IBOutlet UISlider *sliderView;
@property (weak, nonatomic) IBOutlet UIButton *starBtn;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;
@property (weak, nonatomic) IBOutlet UIButton *menuBtn;

@end

@implementation TabBarView
+ (instancetype)show
{
    return [[[NSBundle mainBundle] loadNibNamed:@"TabBarView" owner:nil options:nil] lastObject];
}
- (IBAction)clickStartBtn:(id)sender {
    self.starBtn.selected = !self.starBtn.selected;
}

- (void)awakeFromNib
{
    KGViewsBorder(self.IconView, self.IconView.width*0.5, 0,[UIColor whiteColor]);
    [self.sliderView setThumbImage:[UIImage imageNamed:@"slider"] forState:UIControlStateNormal];
}
@end
