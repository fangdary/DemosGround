//
//  PDChangeMapTypeView.h
//  DemosGround
//
//  Created by EG on 2017/4/25.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChangeTypeButton : UIButton

@end


typedef void(^userChooseMapType)(NSInteger);

@interface PDChangeMapTypeView : UIImageView

/*callbakc*/
@property (copy, nonatomic)userChooseMapType callBack;

@end
