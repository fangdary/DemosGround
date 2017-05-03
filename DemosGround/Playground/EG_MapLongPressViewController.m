//
//  EG_MapLongPressViewController.m
//  DemosGround
//
//  Created by EG on 2017/4/26.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EG_MapLongPressViewController.h"
#import "EG_MapView.h"
#import "EG_PathView.h"

@interface EG_MapLongPressViewController ()

/*map*/
@property (strong, nonatomic)EG_PathView *mapView;

@end

@implementation EG_MapLongPressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor  = [UIColor lightGrayColor];
    [self.view addSubview:self.mapView];    
}



- (EG_PathView *)mapView {
    if (!_mapView) {
        _mapView  = [[EG_PathView alloc]initWithFrame:self.view.bounds];
    }
    return _mapView;
}

@end
