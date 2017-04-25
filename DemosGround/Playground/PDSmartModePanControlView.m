//
//  PDSmartModePanControlView.m
//  GDUMini
//
//  Created by EG on 2017/4/15.
//  Copyright © 2017年 ProFlight. All rights reserved.
//

#import "PDSmartModePanControlView.h"
#import "PDPanControlButton.h"
#import <Masonry.h>

@interface PDSmartModePanControlView()

/*top*/
@property (strong, nonatomic)PDPanControlButton *topButton;

/*left*/
@property (strong, nonatomic)PDPanControlButton *leftButton;

/*bottom*/
@property (strong, nonatomic)PDPanControlButton *bottomButton;

/*right*/
@property (strong, nonatomic)PDPanControlButton *rightButton;

/*center*/
@property (strong, nonatomic)UIImageView *centerImage;

@end

@implementation PDSmartModePanControlView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initSubviews];
    }
    return self;
}

- (void)initSubviews {
    [self addSubview:self.topButton];
    [self addSubview:self.leftButton];
    [self addSubview:self.bottomButton];
    [self addSubview:self.rightButton];
    [self addSubview:self.centerImage];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.centerImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
    
    [self.topButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.centerX.equalTo(self);
    }];
    
    [self.bottomButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self);
        make.centerX.equalTo(self);
    }];
    
    
    [self.leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.centerY.equalTo(self);
    }];
    
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self);
        make.centerY.equalTo(self);
    }];
    
}

#pragma mark - user action

/*按下按钮*/
- (void)panTopButtonTouched {
    if ([self.touchDelegate respondsToSelector:@selector(panTopButtonTouchedDown:)]) {
        [self.touchDelegate panTopButtonTouchedDown:self];
    }
}

- (void)panLeftButtonTouched {
    if ([self.touchDelegate respondsToSelector:@selector(panLeftButtonTouchedDown:)]) {
        [self.touchDelegate panLeftButtonTouchedDown:self];
    }
}

- (void)panRightButtonTouched {
    if ([self.touchDelegate respondsToSelector:@selector(panRightButtonTouchedDown:)]) {
        [self.touchDelegate panRightButtonTouchedDown:self];
    }
}

- (void)panBottomButtonTouched {
    if ([self.touchDelegate respondsToSelector:@selector(panBottomButtonTouchedDown:)]) {
        [self.touchDelegate panBottomButtonTouchedDown:self];
    }
}

/*离开按钮*/
- (void)panTopButtonTouchedUp {
    if ([self.touchDelegate respondsToSelector:@selector(panTopButtonTouchedUp:)]) {
        [self.touchDelegate panTopButtonTouchedUp:self];
    }
}

- (void)panLeftButtonTouchedUp {
    if ([self.touchDelegate respondsToSelector:@selector(panLeftButtonTouchedUp:)]) {
        [self.touchDelegate panLeftButtonTouchedUp:self];
    }
}

- (void)panRightButtonTouchedUp {
    if ([self.touchDelegate respondsToSelector:@selector(panRightButtonTouchedUp:)]) {
        [self.touchDelegate panRightButtonTouchedUp:self];
    }
}

- (void)panBottomButtonTouchedUp {
    if ([self.touchDelegate respondsToSelector:@selector(panBottomButtonTouchedUp:)]) {
        [self.touchDelegate panBottomButtonTouchedUp:self];
    }
}


#pragma mark - lazy

- (PDPanControlButton *)topButton {
    if (!_topButton) {
        _topButton = [PDPanControlButton buttonWithType:UIButtonTypeCustom];
        [_topButton setImage:[UIImage imageNamed:[self imageNames][0]] forState:UIControlStateNormal];
        [_topButton setImage:[UIImage imageNamed:[self highlightedImageNames][0]] forState:UIControlStateHighlighted];
        [_topButton addTarget:self action:@selector(panTopButtonTouched) forControlEvents:UIControlEventTouchDown];
        [_topButton addTarget:self action:@selector(panTopButtonTouchedUp) forControlEvents:UIControlEventTouchUpOutside | UIControlEventTouchUpInside];
        [_topButton sizeToFit];
    }
    return _topButton;
}

- (PDPanControlButton *)leftButton {
    if (!_leftButton) {
        _leftButton = [PDPanControlButton buttonWithType:UIButtonTypeCustom];
        [_leftButton setImage:[UIImage imageNamed:[self imageNames][1]] forState:UIControlStateNormal];
        [_leftButton setImage:[UIImage imageNamed:[self highlightedImageNames][1]] forState:UIControlStateHighlighted];
        [_leftButton addTarget:self action:@selector(panLeftButtonTouched) forControlEvents:UIControlEventTouchDown];
        [_leftButton addTarget:self action:@selector(panLeftButtonTouchedUp) forControlEvents:UIControlEventTouchUpOutside | UIControlEventTouchUpInside];
        [_leftButton sizeToFit];
    }
    return _leftButton;
}

- (PDPanControlButton *)bottomButton {
    if (!_bottomButton) {
        _bottomButton = [PDPanControlButton buttonWithType:UIButtonTypeCustom];
        [_bottomButton setImage:[UIImage imageNamed:[self imageNames][2]] forState:UIControlStateNormal];
        [_bottomButton setImage:[UIImage imageNamed:[self highlightedImageNames][2]] forState:UIControlStateHighlighted];
         [_bottomButton addTarget:self action:@selector(panBottomButtonTouched) forControlEvents:UIControlEventTouchDown];
        [_bottomButton addTarget:self action:@selector(panBottomButtonTouchedUp) forControlEvents:UIControlEventTouchUpOutside | UIControlEventTouchUpInside];
        [_bottomButton sizeToFit];
    }
    return _bottomButton;
}


- (PDPanControlButton *)rightButton {
    if (!_rightButton) {
        _rightButton = [PDPanControlButton buttonWithType:UIButtonTypeCustom];
        [_rightButton setImage:[UIImage imageNamed:[self imageNames][3]] forState:UIControlStateNormal];
        [_rightButton setImage:[UIImage imageNamed:[self highlightedImageNames][3]] forState:UIControlStateHighlighted];
        [_rightButton addTarget:self action:@selector(panRightButtonTouched) forControlEvents:UIControlEventTouchDown];
        [_rightButton addTarget:self action:@selector(panRightButtonTouchedUp) forControlEvents:UIControlEventTouchUpOutside | UIControlEventTouchUpInside];
        [_rightButton sizeToFit];
    }
    return _rightButton;
}

- (UIImageView *)centerImage {
    if (!_centerImage) {
        _centerImage = [[UIImageView alloc]initWithFrame:CGRectZero];
    }
    return _centerImage;
}

- (NSArray *)imageNames {
    return @[@"Smart_top",@"Smart_left",@"Smart_bottom",@"Smart_right"];
}
- (NSArray *)highlightedImageNames {
    return @[@"Smart_top_click",@"Smart_left_click",@"Smart_bottom_click",@"Smart_right_click"];
}


@end
