//
//  EG_PresentViewController.m
//  DemosGround
//
//  Created by EG on 2017/5/13.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EG_PresentViewController.h"

#import "EG_AnimationPresentTool.h"

@interface EG_PresentViewController ()
<
UIViewControllerTransitioningDelegate
>

@end

@implementation EG_PresentViewController

- (instancetype)init {
    if (self = [super init]) {
        self.transitioningDelegate = self;
        self.modalPresentationStyle = UIModalPresentationCustom;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - delegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [EG_AnimationPresentTool transitionWithTransitionType:EGPresentOneTransitionTypePresent];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [EG_AnimationPresentTool transitionWithTransitionType:EGPresentOneTransitionTypeDismiss];
}


@end
