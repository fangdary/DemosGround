//
//  EG_PeiAnimationViewController.m
//  DemosGround
//
//  Created by EG on 17/3/29.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EG_PeiAnimationViewController.h"

#import "EG_LoadingPieView.h"

#import "JNPieLoader.h"


@interface EG_PeiAnimationViewController (){
    NSTimer *_timer;
}


/*loading*/
@property (strong, nonatomic)EG_LoadingPieView *pie;

@property (strong, nonatomic)CAShapeLayer *shapeLayer;

/*loader*/
@property (strong, nonatomic)JNPieLoader *loader;
@end

@implementation EG_PeiAnimationViewController

    
//    EG_LoadingPieView *view = [[EG_LoadingPieView alloc]initWithFrame:CGRectMake(50, 100, 100, 100)];
//    self.pie = view;
//    [self.view addSubview:view];

static CGFloat progress;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor darkGrayColor];
    
    JNPieLoader *loader = [[JNPieLoader alloc]initWithFrame:CGRectMake(100, 100, 50, 50)];
    self.loader = loader;
    progress = 0;
    [self.view addSubview:loader];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
        //    [self circleBezierPath];
        //        //用定时器模拟数值输入的情况
        //    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1
        //                                              target:self
        //                                            selector:@selector(circleAnimationTypeOne)
        //                                            userInfo:nil
        //                                             repeats:YES];
//    [self.pie loadingAnimationToPercent:.3];
    progress += .01;
    [self.loader updateCurrentValue:progress];
    
}

-(void)circleBezierPath
{
        //创建出CAShapeLayer
    self.shapeLayer = [CAShapeLayer layer];
    self.shapeLayer.frame = CGRectMake(0, 0, 150, 150);
    self.shapeLayer.position = self.view.center;
    self.shapeLayer.fillColor = [UIColor clearColor].CGColor;
    
        //设置线条的宽度和颜色
    self.shapeLayer.lineWidth = 2.0f;
    self.shapeLayer.strokeColor = [UIColor redColor].CGColor;
    
        //设置stroke起始点
    self.shapeLayer.strokeStart = 0;
    self.shapeLayer.strokeEnd = 0;
    
        //创建出圆形贝塞尔曲线
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 150, 150)];
    
        //让贝塞尔曲线与CAShapeLayer产生联系
    self.shapeLayer.path = circlePath.CGPath;
    
        //添加并显示
    [self.view.layer addSublayer:self.shapeLayer];
}

- (void)circleAnimationTypeOne
{
    if (self.shapeLayer.strokeEnd > 1 && self.shapeLayer.strokeStart < 1) {
        self.shapeLayer.strokeStart += 0.1;
    }else if(self.shapeLayer.strokeStart == 0){
        self.shapeLayer.strokeEnd += 0.1;
    }
    
    if (self.shapeLayer.strokeEnd == 0) {
        self.shapeLayer.strokeStart = 0;
    }
    
    if (self.shapeLayer.strokeStart == self.shapeLayer.strokeEnd) {
        self.shapeLayer.strokeEnd = 0;
    }
}

- (void)circleAnimationTypeTwo
{
    CGFloat valueOne = arc4random() % 100 / 100.0f;
    CGFloat valueTwo = arc4random() % 100 / 100.0f;
    
    self.shapeLayer.strokeStart = valueOne < valueTwo ? valueOne : valueTwo;
    self.shapeLayer.strokeEnd = valueTwo > valueOne ? valueTwo : valueOne;
}


@end
