//
//  EG_ProgressCircleViewController.m
//  DemosGround
//
//  Created by EG on 17/3/8.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EG_ProgressCircleViewController.h"

#import "GradientPeogressView.h"

@interface EG_ProgressCircleViewController ()

/*progress*/
@property (strong, nonatomic)GradientPeogressView *progressView;

@end

@implementation EG_ProgressCircleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.progressView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.progressView setPercent:.5 animated:YES duration:1];
}

- (GradientPeogressView *)progressView {
    if (!_progressView) {
        _progressView = [[GradientPeogressView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.width)];
    }
    return _progressView;
}



@end
