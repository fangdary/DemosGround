//
//  GradientPeogressView.m
//  drawViw
//
//  Created by EG on 17/2/27.
//  Copyright © 2017年 edao. All rights reserved.
//

#import "GradientPeogressView.h"
#import "UIColor+PDExtension.h"

#define Degree(x) (M_PI * (x)/180.0)

#define PROGRESS_WIDTH 80

#define PROGRESS_LINE_WIDTH 15

#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a];

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface GradientPeogressView() {
    CAShapeLayer *_trackLayer;
    CAShapeLayer *_progressLayer;
    UIColor *_strokeColor;
}

@end

@implementation GradientPeogressView

-(void)setPercent:(CGFloat)percent animated:(BOOL)animated duration:(CGFloat)duration {
    [CATransaction begin];
    [CATransaction setDisableActions:!animated];
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    [CATransaction setAnimationDuration:duration];
    _progressLayer.strokeEnd = percent;
    
    [CATransaction commit];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self drawTrackView];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

#pragma mark - draw progress
- (void)drawTrackView {
    _strokeColor=[UIColor darkGrayColor];//背景圆环的颜色
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:
                        CGPointMake(self.frame.size.width * .5, self.frame.size.height * .5)
                                                      radius:PROGRESS_WIDTH
                                                  startAngle:Degree(-85)
                                                    endAngle:Degree(265)
                                                   clockwise:YES];
    
    _trackLayer = [CAShapeLayer layer];
    _trackLayer.frame = self.bounds;
    _trackLayer.fillColor = [UIColor clearColor].CGColor;
    _trackLayer.strokeColor = _strokeColor.CGColor;
    _trackLayer.opacity = 0.25;//背景圆环的背景透明度
    _trackLayer.lineCap = kCALineCapRound;//这个参数主要是调整环型进度条边上是不圆角，主要有三个参数kCALineCapRound(圆角)，kCALineCapButt（直角），kCALineCapSquare（这个参数设了跟直角一样）
    _trackLayer.lineWidth=PROGRESS_LINE_WIDTH;
    _trackLayer.path=[path CGPath];
    
    [self.layer addSublayer:_trackLayer];

    
    _progressLayer = [CAShapeLayer layer];
    _progressLayer.frame = self.bounds;
    _progressLayer.fillColor = [[UIColor clearColor] CGColor];
    _progressLayer.strokeColor = [UIColor redColor].CGColor;//这个一定不能用clearColor，然显示不出来
    _progressLayer.lineCap = kCALineCapRound;
    _progressLayer.lineWidth = PROGRESS_LINE_WIDTH;
    _progressLayer.path = [path CGPath];
    _progressLayer.strokeEnd = 0.0;
    
    
        //背景渐变色
    CALayer *gradientLayer=[CALayer layer];
    CAGradientLayer *gradientLayerPart1 = [CAGradientLayer layer];
    
    gradientLayerPart1.frame = CGRectMake(0, 0, self.bounds.size.width * .5,self.bounds.size.height);
    [gradientLayerPart1 setColors:[NSArray arrayWithObjects:
                                   (id)[UIColor colorWithHexString:@"ef4e22"].CGColor,
                                   (id)[UIColor colorWithHexString:@"eb9251" alpha:0.8].CGColor,
                                   nil]];
    
    [gradientLayerPart1 setStartPoint:CGPointMake(0.5, 0)];//调整颜色比例主要是调这两个参数（0－1之间）
    [gradientLayerPart1 setEndPoint:CGPointMake(0.5, 1)];//调整颜色比例主要是调这两个参数（0－1之间）
    [gradientLayer addSublayer:gradientLayerPart1];

    
    CAGradientLayer *gradientLayerPart2 = [CAGradientLayer layer];
    gradientLayerPart2.frame = CGRectMake(self.bounds.size.width * .5, 0, self.bounds.size.width * .5 , self.bounds.size.height);
    [gradientLayerPart2 setColors:[NSArray arrayWithObjects:
                                   (id)[UIColor colorWithHexString:@"e8b86c" alpha:0.8].CGColor,
                                   (id)[UIColor colorWithHexString:@"eb9251"].CGColor,
                                   nil]];
    [gradientLayerPart2 setStartPoint:CGPointMake(0.5, 0)];
    [gradientLayerPart2 setEndPoint:CGPointMake(0.5, 1)];
        //如果只需要两种颜色渐变
    [gradientLayer addSublayer:gradientLayerPart2];
    
    [gradientLayer setMask:_progressLayer];
    [self.layer addSublayer:gradientLayer];
}

@end
