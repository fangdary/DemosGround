//
//  EG_SignInVIew.h
//  DemosGround
//
//  Created by EG on 17/3/15.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^signInBlock)();


@interface EG_SignInVIew : UIView


/*callBack*/
@property (copy, nonatomic)signInBlock callBack;

@end
