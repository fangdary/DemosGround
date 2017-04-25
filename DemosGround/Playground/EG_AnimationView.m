//
//  EG_AnimationView.m
//  DemosGround
//
//  Created by EG on 17/3/3.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EG_AnimationView.h"

@interface EG_AnimationView()

/*bottom*/
@property (strong, nonatomic)CALayer *bottomLayer;

/*top*/
@property (strong, nonatomic)CALayer *topLayer;

@end

@implementation EG_AnimationView


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self.layer addSublayer:self.bottomLayer];
    }
    return self;
}


- (CALayer *)bottomLayer {
    if (!_bottomLayer) {
        _bottomLayer = [[CALayer alloc]initWithLayer:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo_white"]]];
        [_bottomLayer addSublayer:self.topLayer];
    }
    return _bottomLayer;
}


- (CALayer *)topLayer {
    if (!_topLayer) {
        _topLayer = [[CALayer alloc]initWithLayer:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo_black"]]];

    }
    return _topLayer;
}

@end
