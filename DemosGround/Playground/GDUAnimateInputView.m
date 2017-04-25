//
//  GDUAnimateInputView.m
//  GFlight
//
//  Created by EG on 17/2/15.
//  Copyright © 2017年 GDU. All rights reserved.
//

#import "GDUAnimateInputView.h"
#import "UIView+PDExtension.h"
#import <Masonry.h>
#define animationDuration .5

@interface GDUAnimateInputView()
<UITextFieldDelegate>

/*input field*/
@property (strong, nonatomic)UITextField *inputField;

/*uilabel*/
@property (strong, nonatomic)UILabel *animateLayer;

/*clear button*/
@property (strong, nonatomic)UIButton *clearButton;

/*underline*/
@property (strong, nonatomic)UIView *underline;

/*animated mark*/
@property (assign, nonatomic)BOOL showAnimatedAction;

@end

@implementation GDUAnimateInputView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.inputField];
        [self addSubview:self.animateLayer];
        [self addSubview:self.underline];
        [self addSubview:self.clearButton];
        self.showAnimatedAction = YES;
    }
    return self;
}

- (void)setAnimatePlaceholder:(NSString *)placeholder animated:(BOOL)animated {
    self.animateLayer.text = placeholder;
    if (!animated) {
        self.showAnimatedAction = NO;
    }
}

- (void)setSecurityMode:(BOOL)securityMode {
    _securityMode = securityMode;
    if (securityMode) {
        self.inputField.secureTextEntry = YES;
    }
}


#pragma mark - delegate

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.text = textField.text;

    if (self.showAnimatedAction)
    [UIView animateWithDuration:animationDuration animations:^{
        self.animateLayer.transform = CGAffineTransformMakeScale(0.8, 0.8);;
        self.animateLayer.frame = CGRectMake(0, -7, self.animateLayer.frame.size.width, self.animateLayer.frame.size.height);
    }];
    
    if ([self.delegate respondsToSelector:@selector(inputViewBeginEditing:)]) {
        [self.delegate performSelector:@selector(inputViewBeginEditing:) withObject:self];
    }
    
    self.clearButton.hidden = NO;
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    self.text = textField.text;
    self.text = self.inputField.text;
    self.clearButton.hidden = YES;

    
    if ([self.delegate respondsToSelector:@selector(inputViewEndEdit:)]) {
        [self.delegate performSelector:@selector(inputViewEndEdit:) withObject:self];
    }
    
    if (textField.text.length != 0) return;
    
    if (self.showAnimatedAction) {
        [UIView animateWithDuration:animationDuration animations:^{
            self.animateLayer.transform = CGAffineTransformScale(self.animateLayer.transform, 1.25, 1.25);
            self.animateLayer.frame =
            CGRectMake( self.inputField.pd_x,self.inputField.pd_y - 9,self.inputField.pd_width,self.inputField.pd_height)
           ;
        }];
    }
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([self.delegate respondsToSelector:@selector(inputViewShouldReturn:)]) {
        return [self.delegate performSelector:@selector(inputViewShouldReturn:) withObject:textField];
    }else {
        return NO;
    }
}

#pragma mark - over write

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.inputField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self);
        make.left.mas_equalTo(self);
        make.right.mas_equalTo(self);
    }];
    
    [self.animateLayer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.inputField);
        make.bottom.mas_equalTo(self.inputField).offset(-9);
        make.left.mas_equalTo(self.inputField);
        make.right.mas_equalTo(self.inputField);
    }];
    
    [self.underline mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.inputField);
        make.left.mas_equalTo(self.inputField);
        make.right.mas_equalTo(self.inputField);
        make.height.mas_equalTo(0.5);
    }];
    
    [self.clearButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.inputField);
        make.right.mas_equalTo(self.inputField);
        make.size.mas_equalTo(CGSizeMake(15, 15));
    }];
    
    self.clearButton.hidden = YES;
}

- (void)setPlaceholder:(NSString *)placeholder {
    _placeholder = placeholder;
    self.animateLayer.text = placeholder;
}

#pragma mark - lazy 

- (UITextField *)inputField {
    if (!_inputField) {
        _inputField = [[UITextField alloc]initWithFrame:CGRectZero];
        
        _inputField.delegate = self;
    }
    return _inputField;
}

- (UILabel *)animateLayer {
    if (!_animateLayer) {
        _animateLayer = [[UILabel alloc]initWithFrame:CGRectZero];
//        _animateLayer.textColor = [UIColor colorWithHexString:@"bbbbbb"];
        _animateLayer.font = [UIFont systemFontOfSize:16];
        _animateLayer.text = @"请输入内容";
    }
    return _animateLayer;
}

- (UIView *)underline {
    if (!_underline) {
        _underline = [[UIView alloc]initWithFrame:CGRectZero];
//        _underline.backgroundColor = [UIColor colorWithHexString:@"bbbbbb"];
    }
    return _underline;
}

- (UIButton *)clearButton {
    if (!_clearButton) {
        _clearButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _clearButton.highlighted = NO;
        [_clearButton setImage:[UIImage imageNamed:@"clear_black"] forState:UIControlStateNormal];
        [_clearButton addTarget:self action:@selector(clearTextInput) forControlEvents:UIControlEventTouchUpInside];
    }
    return _clearButton;
}

- (void)clearTextInput {
    self.inputField.text = nil;
}

@end
