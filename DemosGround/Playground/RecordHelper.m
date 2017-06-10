//
//  RecordHelper.m
//  DemosGround
//
//  Created by EG on 2017/5/17.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "RecordHelper.h"
#import <FMDB.h>


@implementation RecordHelper

static   FMDatabase *database;

+ (BOOL)isCurrentTableExist {
    
    NSString *databasePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES)  lastObject] stringByAppendingPathComponent:@"flightRecords.db"];
    
    database = [FMDatabase databaseWithPath:databasePath];//打开数据库
    
    if ([database open]) {
            //单条记录列表
        NSString *recordTableCreate = [NSString stringWithFormat:
                                    @"create table if not exists record_%@ (id integer primary key autoincrement, currentTime text, coordinate text)", [self stringWithCurrentDate]];
        
        [database executeUpdate:recordTableCreate];
        
            //所有记录都先写到这里
        NSString *tempCreate =  @"create table if not exists flightRecordsTable (id integer primary key autoincrement, start_time text, duration text, start_coor text, end_coor text, max_distance text,max_height text, weather text, windLevel text, syncMark integer)";
        
        [database executeUpdate:tempCreate];
    }
     return YES;
}

+ (void)insertCoordinate:(CGPoint)coordinate atMoment:(NSString *)time {
    if ([database open]) {
        NSString *insertExecute = [NSString stringWithFormat:@"insert into record_%@ (currentTime,coordinate) values (?,?)",[self stringWithCurrentDate]];
        [database executeUpdate:insertExecute withArgumentsInArray:@[time, NSStringFromCGPoint(coordinate)]];
    }
}

#pragma mark - private method

+ (NSString *)stringWithCurrentDate {
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"YYYY_MM_dd"];
    return [formatter stringFromDate:[NSDate date]];
}

@end
