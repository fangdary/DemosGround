//
//  EG_GradualViewController.m
//  DemosGround
//
//  Created by EG on 17/3/15.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EG_GradualViewController.h"

#import "GDULogoView.h"

#import "UIView+PDExtension.h"

@interface EG_GradualViewController ()

/*mark*/
@property (assign, nonatomic)BOOL mark;

/*logo*/
@property (strong, nonatomic)GDULogoView *logo;

@end

@implementation EG_GradualViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.logo];
    self.mark = YES;
}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.logo.center = self.view.center;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.mark) {
        [UIView animateWithDuration:0.8 animations:^{
            self.logo.pd_centerY = -10;
        }];
    }else {
        [UIView animateWithDuration:0.8 animations:^{
            self.logo.pd_centerY = 10;
        }];
    }
    self.mark = !self.mark;
    
}

- (GDULogoView *)logo {
    if (!_logo) {
        _logo = [GDULogoView animationLogoView];
    }
    return _logo;
}

@end
