//
//  EG_RegisterView.m
//  DemosGround
//
//  Created by EG on 17/3/15.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EG_RegisterView.h"
#import "GDUAnimateInputView.h"

#define SubWidth 240
#define HorizonMargin 40
#define CustomHeight 60

#import <Masonry.h>

@interface EG_RegisterView()

/*registerEmailView*/
@property (strong, nonatomic)GDUAnimateInputView *registerEmailView;

/*registerPasswordView*/
@property (strong, nonatomic)GDUAnimateInputView *registerPasswordView;

/*registerComfirmPasswordView*/
@property (strong, nonatomic)GDUAnimateInputView *registerComfirmPasswordView;

/*button*/
@property (strong, nonatomic)UIButton *registerButton;

@end

@implementation EG_RegisterView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubviews];
    }
    return self;
}

- (void)addSubviews {
    [self addSubview:self.registerEmailView];
    [self addSubview:self.registerPasswordView];
    [self addSubview:self.registerComfirmPasswordView];
    [self addSubview:self.registerButton];
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.registerEmailView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(HorizonMargin);
        make.centerX.mas_equalTo(self);
        make.width.mas_equalTo(SubWidth);
        make.height.mas_equalTo(CustomHeight);
    }];
    
    [self.registerPasswordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.registerEmailView.mas_bottom).offset(HorizonMargin);
        make.centerX.mas_equalTo(self);
        make.width.mas_equalTo(SubWidth);
        make.height.mas_equalTo(CustomHeight);
    }];
    
    [self.registerComfirmPasswordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.registerPasswordView.mas_bottom).offset(HorizonMargin);
        make.centerX.mas_equalTo(self);
        make.width.mas_equalTo(SubWidth);
        make.height.mas_equalTo(CustomHeight);
    }];
    
    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.registerComfirmPasswordView.mas_bottom).offset(HorizonMargin);
        make.centerX.mas_equalTo(self);
        make.width.mas_equalTo(SubWidth);
        make.height.mas_equalTo(CustomHeight);
    }];
    
}

- (UIButton *)registerButton {
    if (!_registerButton) {
        _registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_registerButton addTarget:self action:@selector(registerClick) forControlEvents:UIControlEventTouchUpInside];
        [_registerButton setTitle:@"注册" forState:UIControlStateNormal];

    }
    return _registerButton;
}

- (GDUAnimateInputView *)registerEmailView {
    if (!_registerEmailView) {
        _registerEmailView  = [[GDUAnimateInputView alloc]initWithFrame:CGRectMake(0, 0, SubWidth, 40)];
    }
    return _registerEmailView;
}

- (GDUAnimateInputView *)registerPasswordView {
    if (!_registerPasswordView) {
        _registerPasswordView  = [[GDUAnimateInputView alloc]initWithFrame:CGRectMake(0, 0, SubWidth, 40)];
    }
    return _registerPasswordView;
}

- (GDUAnimateInputView *)registerComfirmPasswordView {
    if (!_registerComfirmPasswordView) {
        _registerComfirmPasswordView  = [[GDUAnimateInputView alloc]initWithFrame:CGRectMake(0, 0, SubWidth, 40)];
    }
    return _registerComfirmPasswordView;
}

- (void)registerClick {
    if (self.callBack) {
        self.callBack();
    }
}


@end
