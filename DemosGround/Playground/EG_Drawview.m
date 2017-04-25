//
//  EG_Drawview.m
//  DemosGround
//
//  Created by EG on 2017/4/21.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EG_Drawview.h"


@interface EG_Drawview()
//保存所有路径的数组
@property(nonatomic,strong)NSMutableArray *pathArray;
//当前绘制的路径
@property(nonatomic,strong)UIBezierPath *path;

/*confimbutton*/
@property (strong, nonatomic)UIButton *confirmButton;

@end


@implementation EG_Drawview

//懒加载路径数组
-(NSMutableArray *)pathArray{
    if (_pathArray == nil) {
        _pathArray = [NSMutableArray array
                      ];
    }
    return _pathArray;
}


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.confirmButton];
            //    创建手势
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
            //    添加手势
        [self addGestureRecognizer:pan];
    }
    return self;
}

    //当手指开始拖动的时候调用
- (void)pan:(UIPanGestureRecognizer *)pan{
    
        //    当手指开始拖动的时候画线
        //    获取当前手指所在的点.
    CGPoint curP = [pan locationInView:self];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
        //        设置线的起点
    [path moveToPoint:CGPointMake(100, 240)];
    [path addLineToPoint:curP];
    [path addLineToPoint:CGPointMake(240, 240)];
    self.path = path;
    self.path.lineCapStyle = kCGLineCapRound;
    self.path.lineJoinStyle = kCGLineJoinRound;
        //        每一次创建路径时,都把当前创建的路径保存到路径数组里面
    self.pathArray = [NSMutableArray arrayWithObject:path];
    path.lineWidth = 5;
    [[UIColor blueColor] setStroke];
    [self setNeedsDisplay];
    if(pan.state == UIGestureRecognizerStateEnded){
    }
}

- (void)drawRect:(CGRect)rect {
        //    遍历出所有的路径
    for (UIBezierPath *path in self.pathArray) {
            //        绘制路径
        [path stroke];
    }
}

- (UIButton *)confirmButton  {
    if (!_confirmButton) {
        [_confirmButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        _confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_confirmButton setTitle:@"确定" forState:UIControlStateNormal];
        [_confirmButton addTarget:self action:@selector(confirmClick) forControlEvents:UIControlEventTouchUpInside];
        _confirmButton.frame = CGRectMake(20, 70, 100, 40);
    }
    return _confirmButton;
}

- (void)confirmClick {
    self.pathArray = nil;
    [self setNeedsDisplay];
}

@end

