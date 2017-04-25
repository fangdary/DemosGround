//
//  EG_LocalArchieveViewController.m
//  DemosGround
//
//  Created by EG on 17/3/9.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EG_LocalArchieveViewController.h"

@interface EG_LocalArchieveViewController ()

/*mark*/
@property (assign, nonatomic)BOOL mark;

@end

@implementation EG_LocalArchieveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    /*
    if (self.mark) {
        NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"uploadedList.src"];
        BOOL result = [NSKeyedArchiver archiveRootObject:@"2017-01-01" toFile:filePath];
        if (result) {
            NSLog(@"存储成功");
        }else {
            NSLog(@"存储失败");
        }
        
    }else {
        NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"uploadedList.src"];
        NSString *latestTime = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
        NSLog(@"get archieved %@", latestTime);
    }
    self.mark = !self.mark;
    */
}

- (void)timeToInterver {
    NSString *time = @"2017-03-09 11:08:41";
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSDate *date = [formatter dateFromString:time];
    
    NSLog(@"%@",
          [NSString stringWithFormat:@"%d",
           (int)[date timeIntervalSince1970]]);
}

- (void)InteverToTime {
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[@"1489028921" doubleValue]];
    NSString* dateString = [formatter stringFromDate:date];
    
    NSLog(@"%@", dateString);
}

@end
