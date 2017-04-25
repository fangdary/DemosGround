//
//  EG_PieView.h
//  DemosGround
//
//  Created by EG on 17/3/27.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EG_PieView : UIView


- (instancetype)initWithFrame:(CGRect)frame
   withStrokeWidth:(CGFloat )width
          andColor:(UIColor *)color
        andPercent:(CGFloat)percent
      andAnimation:(BOOL) animation;

- (void)TestMethod;


@end
