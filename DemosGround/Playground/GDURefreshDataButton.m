//
//  GDURefreshDataButton.m
//  GFlight
//
//  Created by EG on 17/3/6.
//  Copyright © 2017年 GDU. All rights reserved.
//

#import "GDURefreshDataButton.h"

@implementation GDURefreshDataButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
       
    }
    return self;
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    
    CABasicAnimation *animation;
        //动画
    animation =  [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        //默认是顺时针效果，若将fromValue和toValue的值互换，则为逆时针效果
    animation.fromValue = [NSNumber numberWithFloat:0.f];
    animation.toValue = [NSNumber numberWithFloat:M_PI * 2];
    animation.duration = 1  ;
    animation.autoreverses = NO;
    animation.fillMode = kCAFillModeBoth;
    animation.repeatCount = MAXFLOAT;
    
    if (selected) {
        [self.layer addAnimation:animation forKey:nil];
    }else {
        [self.layer removeAllAnimations];
    }
}


@end
