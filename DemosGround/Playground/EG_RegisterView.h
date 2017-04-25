//
//  EG_RegisterView.h
//  DemosGround
//
//  Created by EG on 17/3/15.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^registerBlock)();

@interface EG_RegisterView : UIView

/*callBack*/
@property (copy, nonatomic)registerBlock callBack;

@end
