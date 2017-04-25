//
//  EG_ForgetPasswordView.h
//  DemosGround
//
//  Created by EG on 17/3/15.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^getPasswordBlock)();

@interface EG_ForgetPasswordView : UIView

/*callBack*/
@property (copy, nonatomic)getPasswordBlock callBack;

@end
