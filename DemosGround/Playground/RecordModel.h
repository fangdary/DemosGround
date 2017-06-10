//
//  RecordModel.h
//  DemosGround
//
//  Created by EG on 2017/5/17.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecordModel : NSObject

/*Start Time
 
 Main key!!!
 */
@property (strong, nonatomic)NSString *startTime;

/*Duration*/
@property (strong, nonatomic)NSString *duration;

/*Start Coordinate*/
@property (assign, nonatomic)NSValue *start_coor;

/*End Coordinate*/
@property (strong, nonatomic)NSValue *end_coor;

/*Max Distance*/
@property (strong, nonatomic)NSNumber *max_distance;

/*Max Height*/
@property (strong, nonatomic)NSNumber *max_height;

/*Weather*/
@property (strong, nonatomic)NSString *weather;

/*Wind*/
@property (strong, nonatomic)NSString *windLevel;

/*Sync Mark*/
@property (assign, nonatomic)BOOL syncMark;

/*Points*/
@property (strong, nonatomic)NSString *points;

@end

