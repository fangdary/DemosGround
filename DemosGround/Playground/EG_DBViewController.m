//
//  EG_DBViewController.m
//  DemosGround
//
//  Created by EG on 17/3/7.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EG_DBViewController.h"

@interface EG_DBViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textField;

@end

@implementation EG_DBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


- (IBAction)userClick:(UIButton *)sender {
    NSMutableArray *array = [NSMutableArray array];

    [array addObject:self.textField.text];
    
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"uploadedList.src"];
    [NSKeyedArchiver archiveRootObject:array toFile:filePath];
}

- (IBAction)userClick2:(UIButton *)sender {
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"uploadedList.src"];
    NSArray *list = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    
    NSLog(@"%@", list);
}

@end
