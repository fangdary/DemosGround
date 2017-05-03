//
//  EG_ShakingViewController.m
//  DemosGround
//
//  Created by EG on 2017/5/3.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EG_ShakingViewController.h"
#import "EG_SoundTool.h"

@interface EG_ShakingViewController ()

@end

@implementation EG_ShakingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *shake = [UIButton buttonWithType:UIButtonTypeCustom];
    [shake setTitle:@"shake" forState:UIControlStateNormal];
    [shake addTarget:self action:@selector(shake) forControlEvents:UIControlEventTouchUpInside];
    shake.center = self.view.center;
    shake.bounds = CGRectMake(0, 0, 100, 50);
    shake.backgroundColor = [UIColor redColor];
    [self.view addSubview:shake];
}

- (void)shake {
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    EG_SoundTool *playSound =[[EG_SoundTool alloc]initForPlayingVibrate];
//    [playSound play];
//}

@end
