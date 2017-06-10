//
//  EG_FlightRecord.h
//  DemosGround
//
//  Created by EG on 2017/5/12.
//  Copyright © 2017年 EGMade. All rights reserved.
//


#import <Realm/Realm.h>

/**
 航点
*/
@interface EG_FlightPoint : RLMObject

/**
 当前时间，作为主键使用
*/
@property NSString *current_time;

    //纬度
@property NSNumber<RLMDouble>*latitude;

    //经度
@property NSNumber <RLMDouble>*longtitude;

@end
RLM_ARRAY_TYPE(EG_FlightPoint)


/**
 每条记录对应的数据
 */
@interface EG_FlightRecord : RLMObject

/**
 start time  起始时间，作为主键使用
 */
@property NSString *start_time;

/*start coordinate*/
@property NSString *start_coor;

/*duration */
@property NSString *duration;

/*end coordinate*/
@property NSString *end_coor;

/*max height*/
@property NSString *max_height;

/*max distance*/
@property NSString *max_distance;

/*points*/
@property RLMArray<EG_FlightPoint> *points;

/*sync mark*/
@property BOOL sync;

+ (NSString *)primaryKey;

@end
RLM_ARRAY_TYPE(EG_FlightRecord)

/**
 某天所有记录
 */
@interface EG_RecordTable : RLMObject

/**
 date 日期，主键
 */
@property NSString *date;

/*weather*/
@property NSString *weather;

/*wind level*/
@property NSString *windlevel;

/*location*/
@property NSString *location;

/*record array*/
@property RLMArray<EG_FlightRecord> *array;

@end
RLM_ARRAY_TYPE(EG_RecordTable)
