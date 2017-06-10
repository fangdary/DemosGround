//
//  EG_RealmController.m
//  DemosGround
//
//  Created by EG on 2017/5/12.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EG_RealmController.h"

#import <Realm.h>

#import "EG_FlightRecord.h"

@interface EG_RealmController ()

@property (weak, nonatomic) IBOutlet UITextField *label1;
@property (weak, nonatomic) IBOutlet UITextField *label2;

@end

@implementation EG_RealmController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"FlightRecord"] stringByAppendingPathExtension:@"realm"];

    if (![[NSFileManager defaultManager]fileExistsAtPath:filePath]) {
        RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
        config.fileURL = [NSURL URLWithString:filePath];
        config.readOnly = NO;
        config.schemaVersion = 1.0;
        [RLMRealmConfiguration setDefaultConfiguration:config];
        NSLog(@"新建数据库 %@", filePath);

    }else {
        NSLog(@"数据库存在");
    }
    
}
    //初始化
- (IBAction)action1:(UIButton *)sender {
}

    //增加
- (IBAction)action2:(UIButton *)sender {    
    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    
    NSLog(@"%@", config.fileURL);
    
    RLMRealm *realm = [RLMRealm defaultRealm];
 
    EG_FlightRecord *aRecord = [EG_FlightRecord new];
    aRecord.start_time = @"2017/05/13/1";
    aRecord.sync = YES;
    
    EG_FlightRecord *bRecord = [EG_FlightRecord new];
    bRecord.start_time = @"2017/05/13/2";
    bRecord.sync = YES;
    
   
    EG_FlightRecord *cRecord = [EG_FlightRecord new];
    cRecord.start_time = @"2017/05/13/3";
    cRecord.sync = NO;
    
    EG_FlightRecord *dRecord = [EG_FlightRecord new];
    dRecord.start_time = @"2017/05/13/4";
    dRecord.sync = NO;
    
    EG_RecordTable *table = [EG_RecordTable new];
    table.date = @"2017/05/13";
    [table.array addObject:aRecord];
    [table.array addObject:bRecord];
    [table.array addObject:cRecord];
    [table.array addObject:dRecord];
    
    
    EG_RecordTable *table1 = [EG_RecordTable new];
    table1.date = @"2017/05/14";
    [table1.array addObject:aRecord];
    [table1.array addObject:bRecord];
    [table1.array addObject:cRecord];
    [table1.array addObject:dRecord];
    
    [realm transactionWithBlock:^{
        [realm addObjects:@[table,table1]];
    }];
}

    //修改
- (IBAction)action3:(UIButton *)sender {
    dispatch_async(dispatch_queue_create("background", 0), ^{
        @autoreleasepool {
            EG_FlightRecord *theRecord = [[EG_FlightRecord objectsWhere:@"start_time == 2017/05/13"] firstObject];
            RLMRealm *realm = [RLMRealm defaultRealm];
            [realm beginWriteTransaction];
            theRecord.start_time = @"0303030";
            [realm commitWriteTransaction];
        }
    });
}

    //查询
- (IBAction)action4:(UIButton *)sender {
//    RLMResults<EG_FlightRecord *> *table = [EG_FlightRecord allObjects];
//    NSLog(@"--- %@", table);

        // 使用断言字符串查询
//    RLMResults<EG_FlightRecord *> *theRecord = [EG_FlightRecord objectsWhere:@"sync = NO"];
//    
        // 使用 NSPredicate 查询
//    NSPredicate *pred = [NSPredicate predicateWithFormat:@"sync = NO"];
//    RLMResults *results = [EG_FlightRecord objectsWithPredicate:pred];
//    
    
    
}

- (RLMRealm *)memoryDatabase {
    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    config.inMemoryIdentifier = @"MyInMemoryRealm";
    return [RLMRealm realmWithConfiguration:config error:nil];
}

@end
