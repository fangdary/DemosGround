//
//  EG_TraceController.m
//  DemosGround
//
//  Created by EG on 2017/5/17.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EG_TraceController.h"
#import "RecordHelper.h"

@implementation EG_TraceController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [RecordHelper isCurrentTableExist];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [RecordHelper insertCoordinate:CGPointMake(113, 31) atMoment:@"20101010"];
}

@end
