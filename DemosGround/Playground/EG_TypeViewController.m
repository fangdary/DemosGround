//
//  EG_TypeViewController.m
//  DemosGround
//
//  Created by EG on 2017/5/11.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EG_TypeViewController.h"

#import "EG_TypeView.h"

@interface EG_TypeViewController ()

@end

@implementation EG_TypeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    EG_TypeView *view = [[EG_TypeView alloc]initWithFrame:CGRectMake(100, 100, 200, 70)];
    view.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:view];
}

@end
