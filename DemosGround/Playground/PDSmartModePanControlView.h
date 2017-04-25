//
//  PDSmartModePanControlView.h
//  GDUMini
//
//  Created by EG on 2017/4/15.
//  Copyright © 2017年 ProFlight. All rights reserved.
//

#import <UIKit/UIKit.h>


@class PDSmartModePanControlView;
typedef enum : NSUInteger {
    kUserTouchedTop = 0,
    kUserTouchedLeft,
    kUserTouchedBottom,
    kUserTouchedRight
} UserTouchPanType;

@protocol PDPanTouchedDelegate <NSObject>

    /*按下按钮*/
- (void)panTopButtonTouchedDown:(PDSmartModePanControlView *)panView;

- (void)panLeftButtonTouchedDown:(PDSmartModePanControlView *)panView;

- (void)panBottomButtonTouchedDown:(PDSmartModePanControlView *)panView;

- (void)panRightButtonTouchedDown:(PDSmartModePanControlView *)panView;

    /*离开按钮*/
- (void)panTopButtonTouchedUp:(PDSmartModePanControlView *)panView;

- (void)panLeftButtonTouchedUp:(PDSmartModePanControlView *)panView;

- (void)panBottomButtonTouchedUp:(PDSmartModePanControlView *)panView;

- (void)panRightButtonTouchedUp:(PDSmartModePanControlView *)panView;


@end

@interface PDSmartModePanControlView : UIView

/*delegate*/
@property (weak, nonatomic)id<PDPanTouchedDelegate> touchDelegate;

+ (PDSmartModePanControlView *)panControlWithTopTitle:(NSString *)topTitle
                                            leftTitle:(NSString *)leftTitle
                                           rightTitle:(NSString *)rightTitle
                                          bottomTitle:(NSString *)bottomTitle
                                          centerImage:(NSString *)imageName;




@end
