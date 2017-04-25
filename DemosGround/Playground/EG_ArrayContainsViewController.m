//
//  EG_ArrayContainsViewController.m
//  DemosGround
//
//  Created by EG on 17/3/13.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EG_ArrayContainsViewController.h"

@interface EG_ArrayContainsViewController ()

@end

@implementation EG_ArrayContainsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray *listArray = @[
                           @[@1,@2,@3],
                           @[@4,@5,@6],
                                  ];
    NSArray *found = @[
                       @1,@2
                       ];
    
    for (NSArray *array in listArray) {
        for (NSNumber *num in found) {
            if ([array containsObject:num]) {
                NSLog(@"contain");
            }
        }
    }
}

@end
