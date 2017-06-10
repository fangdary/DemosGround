//
//  NSDictionary+XMRealmSotre.m
//  dataDemo
//
//  Created by 郭建斌 on 15/11/30.
//  Copyright © 2015年 郭建斌. All rights reserved.
//

#import "NSDictionary+XMRealmSotre.h"
#import "NSString+XMRealmStore.h"
@implementation NSDictionary (XMRealmSotre)
- (id)xm_objectOrNilForKey:(NSString *)key
{
    id obj = [self objectForKey:key];
    if (obj == [NSNull null]) {
        return nil;
    } else {
        return obj;
    }
}

- (NSString *)xm_stringOrDefaultStringForKey:(NSString *)key
{
    NSString *str = [self xm_objectOrNilForKey:key];
    if (str) {
        return str;
    } else {
        return [NSString xm_realmDefaultString];
    }
}
@end
