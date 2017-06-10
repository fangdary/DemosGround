//
//  EG_CurrentViewController.m
//  DemosGround
//
//  Created by EG on 2017/5/13.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EG_CurrentViewController.h"

#import "EG_PresentViewController.h"

@interface EG_CurrentViewController ()

@end

@implementation EG_CurrentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self presentViewController:[EG_PresentViewController new] animated:YES completion:^{
        
    }];
}

@end
