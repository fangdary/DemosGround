//
//  EG_PieView.m
//  DemosGround
//
//  Created by EG on 17/3/27.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#define kAnimationDuration 1.0

#import "EG_PieView.h"

@interface EG_PieView ()

@property (strong,nonatomic) UIColor *percentColor;
@property (strong,nonatomic) CAShapeLayer *bgCircleLayer;
@property (strong,nonatomic) CAShapeLayer *percentLayer;
@property (strong,nonatomic) UIBezierPath *circlePath;

@property (nonatomic) CGFloat strokeWidth;
@property (nonatomic) CGFloat persentShow;

@property BOOL isAnimation;

@end

@implementation EG_PieView

-(instancetype)initWithFrame:(CGRect)frame
             withStrokeWidth:(CGFloat )width
                    andColor:(UIColor *)color
                  andPercent:(CGFloat)percent
                andAnimation:(BOOL) animation {
    self = [super initWithFrame:frame];
    if (self) {
        self.strokeWidth = width;
        self.percentColor = color;
        self.persentShow = percent;
        self.isAnimation = animation;
        [self buildBGCircleLayer];
    }
    return self;
}

- (void)TestMethod {
    CABasicAnimation *strokeEndAnimation = nil;
    strokeEndAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeEndAnimation.duration = 2.0f;
    strokeEndAnimation.fromValue = @(.3);
    strokeEndAnimation.toValue = @(.9);
    strokeEndAnimation.autoreverses = NO; //无自动动态倒退效果
        //    strokeEndAnimation.delegate = self;
    [self.percentLayer addAnimation:strokeEndAnimation forKey:@"strokeEnd"];
}

-(void)buildBGCircleLayer {
    [self.layer addSublayer:self.bgCircleLayer];
    
    if (self.isAnimation) {
        [self percentAnimation];
    }
    
  [self.layer addSublayer:self.percentLayer];
}


-(void)percentAnimation {
    CABasicAnimation *strokeEndAnimation = nil;
    strokeEndAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeEndAnimation.duration = 2.0f;
    strokeEndAnimation.fromValue = @(0.0f);
    strokeEndAnimation.toValue = @(self.persentShow);
    strokeEndAnimation.autoreverses = NO; //无自动动态倒退效果
    [self.percentLayer addAnimation:strokeEndAnimation forKey:@"strokeEnd"];
}

#pragma mark - lazy 

- (UIBezierPath *)circlePath {
    if (!_circlePath) {
        _circlePath = [UIBezierPath bezierPathWithArcCenter:self.center
                                                         radius:self.frame.size.height * .5
                                                     startAngle:M_PI_2 * 3
                                                       endAngle:- M_PI_2
                                                      clockwise:NO];
    }
    return _circlePath;
}

- (CAShapeLayer *)bgCircleLayer {
    if (!_bgCircleLayer) {
        _bgCircleLayer = [CAShapeLayer layer];
        _bgCircleLayer.strokeColor = [UIColor whiteColor].CGColor;
        _bgCircleLayer.fillColor = [UIColor clearColor].CGColor;
        _bgCircleLayer.path = self.circlePath.CGPath;
        _bgCircleLayer.lineWidth = 1;
    }
    return _bgCircleLayer;
}


- (CAShapeLayer *)percentLayer {
    if (!_percentLayer) {
        _percentLayer = [CAShapeLayer layer];
        _percentLayer.path = [UIBezierPath bezierPathWithArcCenter:self.center
                                                           radius:self.frame.size.height * .5
                                                       startAngle:M_PI_2 * 3
                                                         endAngle:- M_PI_2
                                                        clockwise:NO].CGPath;
        _percentLayer.strokeColor = [UIColor redColor].CGColor;
        _percentLayer.fillColor = [UIColor clearColor].CGColor;
        _percentLayer.lineWidth = 9;
//        _percentLayer.strokeStart = 0.0f;
//        _percentLayer.strokeEnd = self.persentShow;
    }
    return _percentLayer;
}

@end
