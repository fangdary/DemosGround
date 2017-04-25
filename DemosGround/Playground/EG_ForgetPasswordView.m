//
//  EG_ForgetPasswordView.m
//  DemosGround
//
//  Created by EG on 17/3/15.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EG_ForgetPasswordView.h"

#import "GDUAnimateInputView.h"

#define SubWidth 240
#define HorizonMargin 40
#define CustomHeight 60

#import <Masonry.h>

@interface EG_ForgetPasswordView()
/*getPasswordbackView*/
@property (strong, nonatomic)GDUAnimateInputView *getPasswordbackView;

/*button*/
@property (strong, nonatomic)UIButton *getPasswordbackButton;

@end

@implementation EG_ForgetPasswordView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubviews];
    }
    return self;
}

- (void)addSubviews {
    [self addSubview:self.getPasswordbackView];
    [self addSubview:self.getPasswordbackButton];
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.getPasswordbackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(HorizonMargin);
        make.centerX.mas_equalTo(self);
        make.width.mas_equalTo(SubWidth);
        make.height.mas_equalTo(CustomHeight);
    }];
    
    [self.getPasswordbackButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.getPasswordbackView.mas_bottom).offset(HorizonMargin);
        make.centerX.mas_equalTo(self);
        make.width.mas_equalTo(SubWidth);
        make.height.mas_equalTo(CustomHeight);
    }];
    
}

- (UIButton *)getPasswordbackButton {
    if (!_getPasswordbackButton) {
        _getPasswordbackButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_getPasswordbackButton addTarget:self action:@selector(registerClick) forControlEvents:UIControlEventTouchUpInside];
        [_getPasswordbackButton setTitle:@"找回密码" forState:UIControlStateNormal];

    }
    return _getPasswordbackButton;
}


- (GDUAnimateInputView *)getPasswordbackView {
    if (!_getPasswordbackView) {
        _getPasswordbackView  = [[GDUAnimateInputView alloc]initWithFrame:CGRectMake(0, 0, SubWidth, 40)];
    }
    return _getPasswordbackView;
}


- (void)registerClick {
    if (self.callBack) {
        self.callBack();
    }
}

@end
