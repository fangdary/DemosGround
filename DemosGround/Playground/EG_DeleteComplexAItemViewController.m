//
//  EG_DeleteComplexAItemViewController.m
//  DemosGround
//
//  Created by EG on 2017/5/22.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EG_DeleteComplexAItemViewController.h"

@interface EG_DeleteComplexAItemViewController ()

@end

@implementation EG_DeleteComplexAItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSArray *array = @[@"A",
                       @"B",
                       @"A",
                       @"B",
                       @"C",
                       @"D",
                       @"E"
                       ];
    
    NSSet *Set = [NSSet setWithArray:array];
    
    
    NSLog(@"%@", Set);
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
