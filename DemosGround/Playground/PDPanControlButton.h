//
//  PDPanControlButton.h
//  GDUMini
//
//  Created by EG on 2017/4/15.
//  Copyright © 2017年 ProFlight. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    kHorizonStyle,
    kVerticalStyle,
} kTitleStyle;

@interface PDPanControlButton : UIButton

/*top title*/
@property (copy, nonatomic)UILabel *topTitle;

@end
