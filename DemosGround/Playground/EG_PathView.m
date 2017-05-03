//
//  EG_PathView.m
//  DemosGround
//
//  Created by EG on 2017/4/26.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EG_PathView.h"

@interface EG_PathView ()

    //当前绘制的路径
@property(nonatomic,strong)UIBezierPath *path;

@property(nonatomic,strong)NSMutableArray *pathArray;

@end

@implementation EG_PathView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
            //    创建手势
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
            //    添加手势
        [self addGestureRecognizer:longPress];
    }
    return self;
}

- (void)longPress:(UILongPressGestureRecognizer *)longPress {
    NSLog(@"开始啦");
    
    CGPoint curP = [longPress locationInView:self];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
        // 设置线的起点
    [path moveToPoint:CGPointMake(50, 200)];
    [path addLineToPoint:curP];
    [path addLineToPoint:CGPointMake(200, 200)];
    path.lineWidth = 5;
    self.path = path;
    self.path.lineCapStyle = kCGLineCapRound;
    self.path.lineJoinStyle = kCGLineJoinRound;
        // 每一次创建路径时,都把当前创建的路径保存到路径数组里面
    self.pathArray = [NSMutableArray arrayWithObject:path];
    
    [self setNeedsDisplay];
    
}

- (void)drawRect:(CGRect)rect {
        //    遍历出所有的路径
    for (UIBezierPath *path in self.pathArray) {
            //        绘制路径
        [path stroke];
    }
}

-(NSMutableArray *)pathArray{
    if (_pathArray == nil) {
        _pathArray = [NSMutableArray array];
    }
    return _pathArray;
}

@end
