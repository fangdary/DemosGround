//
//  EG_SignInVIew.m
//  DemosGround
//
//  Created by EG on 17/3/15.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EG_SignInVIew.h"
#import "GDUAnimateInputView.h"

#define SubWidth 240
#define HorizonMargin 40
#define CustomHeight 60

#import <Masonry.h>

@interface EG_SignInVIew()

/*userEmaiView*/
@property (strong, nonatomic)GDUAnimateInputView *userEmaiView;

/*passwordView*/
@property (strong, nonatomic)GDUAnimateInputView *passwordView;

/*button*/
@property (strong, nonatomic)UIButton *signInButton;

@end

@implementation EG_SignInVIew

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubviews];
    }
    return self;
}

- (void)addSubviews {
    [self addSubview:self.userEmaiView];
    [self addSubview:self.passwordView];
    [self addSubview:self.signInButton];
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.userEmaiView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(HorizonMargin);
        make.centerX.mas_equalTo(self);
        make.width.mas_equalTo(SubWidth);
        make.height.mas_equalTo(CustomHeight);
    }];
    
    [self.passwordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.userEmaiView.mas_bottom).offset(HorizonMargin);
        make.centerX.mas_equalTo(self);
        make.width.mas_equalTo(SubWidth);
        make.height.mas_equalTo(CustomHeight);
    }];
    
    [self.signInButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.passwordView.mas_bottom).offset(HorizonMargin);
        make.centerX.mas_equalTo(self);
        make.width.mas_equalTo(SubWidth);
        make.height.mas_equalTo(CustomHeight);
    }];
    
}

- (UIButton *)signInButton {
    if (!_signInButton) {
        _signInButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_signInButton addTarget:self action:@selector(registerClick) forControlEvents:UIControlEventTouchUpInside];
        [_signInButton setTitle:@"登录" forState:UIControlStateNormal];
    }
    return _signInButton;
}

- (GDUAnimateInputView *)userEmaiView {
    if (!_userEmaiView) {
        _userEmaiView  = [[GDUAnimateInputView alloc]initWithFrame:CGRectMake(0, 0, SubWidth, 40)];
    }
    return _userEmaiView;
}

- (GDUAnimateInputView *)passwordView {
    if (!_passwordView) {
        _passwordView  = [[GDUAnimateInputView alloc]initWithFrame:CGRectMake(0, 0, SubWidth, 40)];
    }
    return _passwordView;
}


- (void)registerClick {
    if (self.callBack) {
        self.callBack();
    }
}

@end
