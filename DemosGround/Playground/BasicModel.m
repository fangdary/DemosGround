//
//  BasicModel.m
//  realmDemo
//
//  Created by apple on 16/3/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "BasicModel.h"
/**
 *  数据库版本
 */
#define REALM_CONFIGURATION_VERSION 1.0
@implementation BasicRealm
+(XMRealmStoreManager *)realmManager
{
    return [[[self alloc] init] realmManager];
}
// Specify default values for properties

//+ (NSDictionary *)defaultPropertyValues
//{
//    return @{};
//}

// Specify properties to ignore (Realm won't persist these)

//+ (NSArray *)ignoredProperties
//{
//    return @[];
//}

-(XMRealmStoreManager *)realmManager
{
    RLMRealmConfiguration * confi = [RLMRealmConfiguration defaultConfiguration];
    confi.schemaVersion = REALM_CONFIGURATION_VERSION;
    
    return [[XMRealmStoreManager shareManager] initWithConfiguration:confi];
}

+(NSString *)primaryKey
{
    return @"hostID";
}
@end

@implementation BasicModel



@end
