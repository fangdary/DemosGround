//
//  EG_FlightRecord.m
//  DemosGround
//
//  Created by EG on 2017/5/12.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EG_FlightRecord.h"

@implementation EG_FlightPoint
+ (NSString *)primaryKey {
    return @"current_time";
}

@end

@implementation EG_FlightRecord

+ (NSString *)primaryKey {
    return @"start_time";
}

@end

@implementation EG_RecordTable

+ (NSString *)primaryKey {
    return @"date";
}

@end
