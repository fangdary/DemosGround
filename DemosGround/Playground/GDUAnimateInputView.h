//
//  GDUAnimateInputView.h
//  GFlight
//
//  Created by EG on 17/2/15.
//  Copyright © 2017年 GDU. All rights reserved.
//

#import <UIKit/UIKit.h>


@class GDUAnimateInputView;
@protocol GDUAnimateInputViewDelegate <NSObject>

    //开始编辑
- (void)inputViewBeginEditing:(GDUAnimateInputView *)inputView;

    //结束编辑
- (void)inputViewEndEdit:(GDUAnimateInputView *)inputView;

    //点击回车键
- (BOOL)inputViewShouldReturn:(GDUAnimateInputView *)inputView;

@end

@interface GDUAnimateInputView : UIView

/*text*/
@property (copy, nonatomic)NSString *text;

@property (copy, nonatomic)NSString *placeholder;

/*密码模式*/
@property (nonatomic, assign)BOOL securityMode;

/*delegate*/
@property (weak, nonatomic)id<GDUAnimateInputViewDelegate> delegate;

- (void)setAnimatePlaceholder:(NSString *)placeholder animated:(BOOL)animated;

@end
