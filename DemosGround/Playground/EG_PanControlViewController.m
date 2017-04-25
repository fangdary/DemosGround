//
//  EG_PanControlViewController.m
//  DemosGround
//
//  Created by EG on 2017/4/15.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EG_PanControlViewController.h"

#import "PDSmartModePanControlView.h"

@interface EG_PanControlViewController ()

@end

@implementation EG_PanControlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    PDSmartModePanControlView *view = [[PDSmartModePanControlView alloc]initWithFrame:CGRectMake(0, 0, 127, 127)];
    
    view.center = self.view.center;
    
    [self.view addSubview:view];
}

@end
