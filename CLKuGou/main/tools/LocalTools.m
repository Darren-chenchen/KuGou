//
//  LocalTools.m
//  CLKuGou
//
//  Created by Darren on 16/7/31.
//  Copyright © 2016年 darren. All rights reserved.
//

#import "LocalTools.h"

@implementation LocalTools

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.mediaItem forKey:@"mediaItem"];
}
- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init]) {
        // 读取文件的内容
        self.mediaItem = [decoder decodeObjectForKey:@"mediaItem"];
    }
    return self;
}
@end
