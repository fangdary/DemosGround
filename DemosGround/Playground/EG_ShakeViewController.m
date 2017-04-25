//
//  EG_ShakeViewController.m
//  DemosGround
//
//  Created by EG on 17/3/6.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EG_ShakeViewController.h"

@interface EG_ShakeViewController ()


@end

@implementation EG_ShakeViewController

    /*
     // for UIEventTypeMotion, available in iPhone OS 3.0
     UIEventSubtypeMotionShake                       = 1,
     
     // for UIEventTypeRemoteControl, available in iOS 4.0
     UIEventSubtypeRemoteControlPlay                 = 100,
     UIEventSubtypeRemoteControlPause                = 101,
     UIEventSubtypeRemoteControlStop                 = 102,
     UIEventSubtypeRemoteControlTogglePlayPause      = 103,
     UIEventSubtypeRemoteControlNextTrack            = 104,
     UIEventSubtypeRemoteControlPreviousTrack        = 105,
     UIEventSubtypeRemoteControlBeginSeekingBackward = 106,
     UIEventSubtypeRemoteControlEndSeekingBackward   = 107,
     UIEventSubtypeRemoteControlBeginSeekingForward  = 108,
     UIEventSubtypeRemoteControlEndSeekingForward    = 109,
     */
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    UIViewAutoresizingFlexibleWidth;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self motionBegan:UIEventSubtypeRemoteControlPlay withEvent:event];
}

@end
