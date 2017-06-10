//
//  Model.m
//  realmDemo
//
//  Created by apple on 16/3/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "Model.h"

@implementation DataRealm
+ (NSDictionary *)JSONInboundMappingDictionary {
    return @{

             @"hostID":@"hostID",
             @"image_url": @"image_url",

             @"title": @"title",

             };
}

+ (NSDictionary *)JSONOutboundMappingDictionary {
    return @{

             @"hostID":@"hostID",
             @"image_url": @"image_url",
             
             @"title": @"title",

             };
}
@end
@implementation ImageRealm

+ (NSDictionary *)JSONInboundMappingDictionary {
    return @{
             @"hostID":@"hostID",
             @"image": @"image",

             
             };
}

+ (NSDictionary *)JSONOutboundMappingDictionary {
    return @{
             @"hostID":@"hostID",
             @"image": @"image",

             
             };
}

@end

@implementation DataModel



@end

@implementation ImageModel



@end