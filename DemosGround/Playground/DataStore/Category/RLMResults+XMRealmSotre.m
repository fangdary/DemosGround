//
//  RLMResults+XMRealmSotre.m
//  dataDemo
//
//  Created by 郭建斌 on 15/11/30.
//  Copyright © 2015年 郭建斌. All rights reserved.
//

#import "RLMResults+XMRealmSotre.h"

@implementation RLMResults (XMRealmSotre)

- (BOOL)xm_containsObject:(RLMObject*)object
{
    if (!object) return NO;
    return [self indexOfObject:object] != NSNotFound;
}
@end
