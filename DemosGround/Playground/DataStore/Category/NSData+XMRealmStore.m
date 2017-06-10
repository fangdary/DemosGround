//
//  NSData+XMRealmStore.m
//  dataDemo
//
//  Created by 郭建斌 on 15/11/30.
//  Copyright © 2015年 郭建斌. All rights reserved.
//

#import "NSData+XMRealmStore.h"

@implementation NSData (XMRealmStore)

+ (NSData *) xm_realmDefaultData
{
    return [[NSData alloc] init];
}

- (BOOL)xm_isRealmDefaultData
{
    return [self isEqualToData:[NSData xm_realmDefaultData]];
}

@end
