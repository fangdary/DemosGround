//
//  EG_LocalViewController.m
//  DemosGround
//
//  Created by EG on 17/3/7.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EG_LocalViewController.h"

#import <FMDB.h>


#define NAME @"name"
#define AGE @"age"
#define GRADE @"grade"
#define GENDER @"gender"
#define WEIGHT @"weight"
#define HEIGHT @"height"
#define TRACE @"trace"

@interface EG_LocalViewController (){
    dispatch_source_t _timer;
}

@property (weak, nonatomic) IBOutlet UILabel *longtitudeLabel;

@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;

@property (weak, nonatomic) IBOutlet UILabel *height;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;




@property (weak, nonatomic) IBOutlet UILabel *results;

@property (weak, nonatomic) IBOutlet UIView *mark;

/*database*/
@property (strong, nonatomic)FMDatabase *database;

@end

@implementation EG_LocalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)lockClick:(id)sender {
    
}

- (IBAction)writeIn:(id)sender {
    [self searchFromDB];
}


- (IBAction)readFrom:(id)sender {

}

#pragma mark - lazy private

- (void)searchFromDB {
    [self check:nil];
    
//    NSString *insertSql1= [NSString stringWithFormat:
//                           @"INSERT INTO '%@' ('%@', '%@', '%@') VALUES ('%@', '%@', '%@')",
//                           ];
//    BOOL res = [self.database executeUpdate:insertSql1];
    
//    if (!res) {
//        NSLog(@"error when insert db table");
//    } else {
//        NSLog(@"success to insert db table");
//    }
//    
    [self.database close];
}

- (void)updateDataWithInfo {
    
}


- (IBAction)check:(id)sender {
        // 文件路径
//    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
//    NSString *filePath = [documentsPath stringByAppendingPathComponent:@"database.sqlite"];
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"FlightRecrodsDatabase" ofType:@"db"];
    self.database = [FMDatabase databaseWithPath:filePath];
    
    if([self.database open]) {
        self.mark.backgroundColor = [UIColor greenColor];
    
    }else {
        self.mark.backgroundColor = [UIColor redColor];
    }
    
    [self timerAction];
}

- (void)timerAction {
    
     dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
      _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
     dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), .5 * NSEC_PER_SEC, 0);
     dispatch_source_set_event_handler(_timer, ^{
         self.longtitudeLabel.text = [self getRandomNumber:114 to:115];
         self.latitudeLabel.text = [self getRandomNumber:31 to:32];
         self.height.text = [self getRandomNumber:10 to:20];
         self.timeLabel.text = [self getCurrentTime];
     });
    
    dispatch_resume(_timer);
    
}

- (NSString *)getCurrentTime {
    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd hh:mm:ss"];
    return [dateFormatter stringFromDate:currentDate];
}

    /*
     1、  获取一个随机整数范围在：[0,100)包括0，不包括100
     
     int x = arc4random() % 100;
     
     2、  获取一个随机数范围在：[500,1000），包括500，包括1000
     
     int y = (arc4random() % 501) + 500;
     
     3、  获取一个随机整数，范围在[from,to），包括from，包括to
     
     -(int)getRandomNumber:(int)from to:(int)to
     
     {
     
     return (int)(from + (arc4random() % (to – from + 1)));
     
     }*/

-(NSString *)getRandomNumber:(int)from to:(int)to {
    return [NSString stringWithFormat:@"%f",
            (double)(from + (arc4random() % ((to - from) + 1)))];
}
@end
