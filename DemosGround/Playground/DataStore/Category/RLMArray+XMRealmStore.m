//
//  RLMArray+XMRealmStore.m
//  dataDemo
//
//  Created by 郭建斌 on 15/11/30.
//  Copyright © 2015年 郭建斌. All rights reserved.
//

#import "RLMArray+XMRealmStore.h"

@implementation RLMArray (XMRealmStore)

- (BOOL)xm_containsObject:(RLMObject*)object
{
    if (!object) return NO;
    return [self indexOfObject:object] != NSNotFound;
}

- (void)xm_uniqueAddObject:(RLMObject*)object
{
    if (!object) return;
    if (![self xm_containsObject:object]) {
        [self addObject:object];
    }
}

- (void)xm_removeObject:(RLMObject*)object
{
    if (!object) return;
    if ([self xm_containsObject:object]) {
        [self removeObjectAtIndex:[self indexOfObject:object]];
    }
}
@end
