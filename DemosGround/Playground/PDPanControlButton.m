//
//  PDPanControlButton.m
//  GDUMini
//
//  Created by EG on 2017/4/15.
//  Copyright © 2017年 ProFlight. All rights reserved.
//

#import "PDPanControlButton.h"
#import <Masonry.h>

@interface PDPanControlButton ()

/*title label*/
@property (strong, nonatomic)UILabel *label;

@end

@implementation PDPanControlButton


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.label];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
    
}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc]init];
        _label.textColor = [UIColor whiteColor];
        _label.text = @"测试";
    }
    return _label;
}

@end
