//
//  EG_AnimationPresentTool.h
//  DemosGround
//
//  Created by EG on 2017/5/13.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    EGPresentOneTransitionTypePresent = 0,
    EGPresentOneTransitionTypeDismiss,
} EGPresentOneTransitionType;

typedef enum : NSUInteger {
    EGCardMode,
    EGPageMode,
    EGWindowMode,
} EGAnimationMode;




typedef void(^GestureConfig)();

typedef enum : NSUInteger {
    EGInteractiveTransitionGestureDirectionLeft = 0,
    EGInteractiveTransitionGestureDirectionRight,
    EGInteractiveTransitionGestureDirectionUp,
    EGInteractiveTransitionGestureDirectionDown
} EGInteractiveTransitionGestureDirection;

typedef enum : NSUInteger {//手势控制哪种转场
    EGInteractiveTransitionTypePresent = 0,
    EGInteractiveTransitionTypeDismiss,
    EGInteractiveTransitionTypePush,
    EGInteractiveTransitionTypePop,
} EGInteractiveTransitionType;

@interface EG_InteractiveTransition :UIPercentDrivenInteractiveTransition

/**记录是否开始手势，判断pop操作是手势触发还是返回键触发*/
@property (nonatomic, assign) BOOL interation;

/**促发手势present的时候的config，config中初始化并present需要弹出的控制器*/
@property (nonatomic, copy) GestureConfig presentConifg;

/**促发手势push的时候的config，config中初始化并push需要弹出的控制器*/
@property (nonatomic, copy) GestureConfig pushConifg;

    //初始化方法
+ (instancetype)interactiveTransitionWithTransitionType:(EGInteractiveTransitionType)type GestureDirection:(EGInteractiveTransitionGestureDirection)direction;

- (instancetype)initWithTransitionType:(EGInteractiveTransitionType)type GestureDirection:(EGInteractiveTransitionGestureDirection)direction;

/** 给传入的控制器添加手势*/
- (void)addPanGestureForViewController:(UIViewController *)viewController;

@end



@interface EG_AnimationPresentTool : NSObject
<UIViewControllerAnimatedTransitioning>

/*animation type*/
@property (assign, nonatomic)EGPresentOneTransitionType type;

/*mode*/
@property (assign, nonatomic)EGAnimationMode mode;

+ (instancetype)transitionWithTransitionType:(EGPresentOneTransitionType)type;

- (instancetype)initWithTransitionType:(EGPresentOneTransitionType)type;

@end
