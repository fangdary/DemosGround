//
//  RecordHelper.h
//  DemosGround
//
//  Created by EG on 2017/5/17.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "RecordModel.h"

@interface RecordHelper : NSObject


/**
 检查记录数据库是否存在, 不存在则创建;
 检查当天飞行记录列表是否存在,不存在则创建
*/
+ (BOOL)isCurrentTableExist;


+ (void)insertCoordinate:(CGPoint)coordinate atMoment:(NSString *)time ;

@end
