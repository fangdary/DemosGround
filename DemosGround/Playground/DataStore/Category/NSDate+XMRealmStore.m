//
//  NSDate+XMRealmStore.m
//  dataDemo
//
//  Created by 郭建斌 on 15/11/30.
//  Copyright © 2015年 郭建斌. All rights reserved.
//

#import "NSDate+XMRealmStore.h"

@implementation NSDate (XMRealmStore)
+ (NSDate *)xm_realmDefaultDate
{
    return [NSDate dateWithTimeIntervalSince1970:0.];
}

-(BOOL)xm_isRealmDefaultDate
{
    return [self isEqualToDate:[NSDate xm_realmDefaultDate]];
}
@end
