//
//  EG_LoadingPieView.m
//  DemosGround
//
//  Created by EG on 17/3/29.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EG_LoadingPieView.h"

@interface EG_LoadingPieView ()
<
CAAnimationDelegate
>

/*loading layer*/
@property (strong, nonatomic)CAShapeLayer *loadingPieLayer;

/*backlayer*/
@property (strong, nonatomic)CAShapeLayer *backCircleLayer;

@end

@implementation EG_LoadingPieView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self.layer addSublayer:self.loadingPieLayer];
        [self.layer addSublayer:self.backCircleLayer];
    }
    return self;
}

-(void)loadingAnimationToPercent:(CGFloat)percent {
    CABasicAnimation *strokeEndAnimation = nil;
    strokeEndAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeEndAnimation.duration = 2.0f;
    strokeEndAnimation.fromValue = @(0.0f);
    strokeEndAnimation.toValue = @(percent);
    strokeEndAnimation.autoreverses = NO; //无自动动态倒退效果
    strokeEndAnimation.delegate = self;
    [self.loadingPieLayer addAnimation:strokeEndAnimation forKey:@"strokeEnd"];
}


#pragma mark - delegate

- (void)animationDidStart:(CAAnimation *)anim {

}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
}

#pragma mark - lazy

- (CAShapeLayer *)loadingPieLayer {
    if (!_loadingPieLayer) {
        _loadingPieLayer = [CAShapeLayer layer];
        _loadingPieLayer.strokeColor = [UIColor whiteColor].CGColor;
        _loadingPieLayer.fillColor = [UIColor clearColor].CGColor;
        _loadingPieLayer.path =
        [UIBezierPath bezierPathWithArcCenter:self.center
                                       radius:(self.bounds.size.width * .5 - 3)
                                   startAngle:M_PI_2 * 3
                                     endAngle:- M_PI_2
                                    clockwise:NO].CGPath;
    }
    return _loadingPieLayer;
}

- (CAShapeLayer *)backCircleLayer {
    if (!_backCircleLayer) {
        _backCircleLayer = [CAShapeLayer layer];
        _backCircleLayer.strokeColor = [UIColor whiteColor].CGColor;
        _backCircleLayer.lineWidth = 1;
        _backCircleLayer.fillColor = [UIColor clearColor].CGColor;
        _backCircleLayer.path = [UIBezierPath bezierPathWithOvalInRect:self.frame].CGPath;
    }
    return _backCircleLayer;
}

@end
