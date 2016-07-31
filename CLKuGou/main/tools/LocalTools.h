//
//  LocalTools.h
//  CLKuGou
//
//  Created by Darren on 16/7/31.
//  Copyright © 2016年 darren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayer.h>


@interface LocalTools : NSObject
// 存储上一次播放歌曲的信息

@property (nonatomic,strong) MPMediaItem *mediaItem;

@end
