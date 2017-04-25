//
//  EG_UploadBackupViewController.m
//  DemosGround
//
//  Created by EG on 17/3/9.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EG_UploadBackupViewController.h"

typedef struct  CGPoint GDUBackup;





@interface EG_UploadBackupViewController ()



@end

@implementation EG_UploadBackupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    GDUBackup back = CGPointMake(1, 1);
    NSStringFromCGPoint(back);
    NSLog(@"%f %f", back.x, back.y);
    
}


@end
