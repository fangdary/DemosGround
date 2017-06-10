//
//  NSString+XMRealmStore.m
//  dataDemo
//
//  Created by 郭建斌 on 15/11/30.
//  Copyright © 2015年 郭建斌. All rights reserved.
//

#import "NSString+XMRealmStore.h"

@implementation NSString (XMRealmStore)
+ (NSString *)xm_realmDefaultString
{
    return @"";
}

- (BOOL)xm_isRealmDefaultString
{
    return [self isEqualToString:[NSString xm_realmDefaultString]];
}
@end
