//
//  EG_EnumViewController.m
//  DemosGround
//
//  Created by EG on 17/3/6.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EG_EnumViewController.h"

    /*
     通用枚举写法
     typedef NS_ENUM(NSInteger, UIViewAnimationTransition) {
     UIViewAnimationTransitionNone,
     UIViewAnimationTransitionFlipFromLeft,
     UIViewAnimationTransitionFlipFromRight,
     UIViewAnimationTransitionCurlUp,
     UIViewAnimationTransitionCurlDown,
     };
     
     官方写法 -> 多种情况（通过|连在一起）
     typedef NS_OPTIONS(NSUInteger, UIViewAutoresizing) {
     UIViewAutoresizingNone                 = 0,
     UIViewAutoresizingFlexibleLeftMargin   = 1 << 0,
     UIViewAutoresizingFlexibleWidth        = 1 << 1,
     UIViewAutoresizingFlexibleRightMargin  = 1 << 2,
     UIViewAutoresizingFlexibleTopMargin    = 1 << 3,
     UIViewAutoresizingFlexibleHeight       = 1 << 4,
     UIViewAutoresizingFlexibleBottomMargin = 1 << 5
     };

     */

typedef NS_ENUM(NSInteger, EnumStyle){
    kEnumStyle1 = 1 << 0,
    kEnumStyle2 = 1 << 1,
    kEnumStyle3 = 1 << 2,
    kEnumStyle4 = 1 << 3,
    kEnumStyle5 = 1 << 4,
    kEnumStyle6 = 1 << 5,
    kEnumStyle7 = 1 << 6
};

@interface EG_EnumViewController ()

@end

@implementation EG_EnumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
