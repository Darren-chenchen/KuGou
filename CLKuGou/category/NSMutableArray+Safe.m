//
//  NSMutableArray+Safe.m
//  CLKuGou
//
//  Created by Darren on 16/7/31.
//  Copyright © 2016年 darren. All rights reserved.
//

#import "NSMutableArray+Safe.h"

@implementation NSMutableArray (Safe)
- (void)addSafeObject:(id)key
{
    if (!key) {
        key = @"";
    }
    [self addObject:key];
}
@end
