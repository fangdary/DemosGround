//
//  EG_DraggableLineViewController.m
//  DemosGround
//
//  Created by EG on 2017/4/20.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EG_DraggableLineViewController.h"
#import "EG_Drawview.h"
@interface EG_DraggableLineViewController ()

@property (nonatomic, strong) CAShapeLayer *shapeLayer;

@end

@implementation EG_DraggableLineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    EG_Drawview *drawview = [[EG_Drawview alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:drawview];
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    path.lineJoinStyle = kCGLineJoinRound;
//    [path moveToPoint:CGPointMake(150, 150)];
//    [path addLineToPoint:CGPointMake(100, 350)];
//    path.lineWidth = 5.0f;
//    path.lineJoinStyle = kCGLineJoinRound;
//    [path stroke];
//   
//    self.shapeLayer = [CAShapeLayer layer];
//    self.shapeLayer.strokeColor = [UIColor redColor].CGColor;
//    self.shapeLayer.path = path.CGPath;
//    
//    [self.view.layer addSublayer:self.shapeLayer];
    
}
//
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    UITouch *touch = [touches anyObject];
//    CGPoint point = [touch locationInView:self.view];
//
//    
//   UIBezierPath *path = [UIBezierPath bezierPath];
//    path.lineCapStyle = kCGLineCapRound;
//    path.lineJoinStyle = kCGLineJoinRound;
//    path.lineWidth = 5;
//    [path moveToPoint:CGPointMake(150, 150)];
//    [path addLineToPoint:point];
//    [path addLineToPoint:CGPointMake(100, 350)];
//    
//    
//    
//    self.shapeLayer.strokeColor = [UIColor redColor].CGColor;
//    self.shapeLayer.fillColor = [UIColor clearColor].CGColor;
//    self.shapeLayer.lineJoin = kCALineJoinRound;
//    self.shapeLayer.lineCap = kCALineCapRound;
//    self.shapeLayer.lineWidth = 5;
//    self.shapeLayer.path = path.CGPath;
//    
//    [self.view.layer addSublayer:self.shapeLayer];
//    
//}


@end
