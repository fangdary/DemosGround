//
//  EG_GradualColorViewController.m
//  DemosGround
//
//  Created by EG on 17/3/10.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EG_GradualColorViewController.h"

@interface EG_GradualColorViewController ()

/*CAGradientLayer*/
@property (strong, nonatomic)CAGradientLayer *gradientLayer;
@end

@implementation EG_GradualColorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
//    CAGradientLayer *layer = [CAGradientLayer layer];
//    layer.frame = CGRectMake(0, 0, self.view.bounds.size.width, 100);
//    layer.colors = [NSArray arrayWithObjects:(id)[UIColor darkGrayColor].CGColor, (id)[UIColor clearColor].CGColor, nil];
//    for (CALayer *sublayer in [self.view.layer sublayers]) {
//        [sublayer removeFromSuperlayer];
//    }
//      [self.view.layer insertSublayer:layer atIndex:0];
    
    
    
        //初始化CAGradientlayer对象，使它的大小为UIView的大小
    self.gradientLayer = [CAGradientLayer layer];
    self.gradientLayer.frame = self.view.bounds;
    
        //将CAGradientlayer对象添加在我们要设置背景色的视图的layer层
    [self.view.layer addSublayer:self.gradientLayer];
    
        //设置渐变区域的起始和终止位置（范围为0-1）
    self.gradientLayer.startPoint = CGPointMake(0, 0);
    self.gradientLayer.endPoint = CGPointMake(0, 1);
    
        //设置颜色数组
    self.gradientLayer.colors = @[(__bridge id)[UIColor blueColor].CGColor,
                                  (__bridge id)[UIColor redColor].CGColor];
    
        //设置颜色分割点（范围：0-1）
    self.gradientLayer.locations = @[@(0.5f), @(1.0f)];
}

@end
