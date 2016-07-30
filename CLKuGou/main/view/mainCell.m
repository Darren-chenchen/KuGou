//
//  mainCell.m
//  CLKuGou
//
//  Created by Darren on 16/7/30.
//  Copyright © 2016年 darren. All rights reserved.
//

#import "mainCell.h"

@implementation mainCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *mainCellID = @"mainID";
    
    mainCell *cell = [tableView dequeueReusableCellWithIdentifier:mainCellID];
    if (!cell) {
        cell = [[mainCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:mainCellID];
    }
    return cell;
}
@end
