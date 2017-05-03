//
//  PDChangeMapTypeView.m
//  DemosGround
//
//  Created by EG on 2017/4/25.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "PDChangeMapTypeView.h"
#import <Masonry.h>

@implementation ChangeTypeButton

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.imageEdgeInsets = UIEdgeInsetsMake(10, 15, 20, 0);
    self.titleEdgeInsets = UIEdgeInsetsMake(50, -30, 0, 0);
}

@end




#define SpaceMargin 10

@interface PDChangeMapTypeView()

/*2D map*/
@property (strong, nonatomic)ChangeTypeButton * MapType2DButton;

/*satelite map*/
@property (strong, nonatomic)ChangeTypeButton * MapSateliteTypeButton;

/*mix map*/
@property (strong, nonatomic)ChangeTypeButton * MapMixTypeButton;

/*seperate line1*/
@property (strong, nonatomic)UIView *seperateLine1;

/*seperate line2*/
@property (strong, nonatomic)UIView *seperateLine2;

@end


@implementation PDChangeMapTypeView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.image = [UIImage imageNamed:@"icon_map_box"];
        [self addSubview:self.MapType2DButton];
        [self addSubview:self.MapSateliteTypeButton];
        [self addSubview:self.MapMixTypeButton];
    }
    return self;
}

- (void)userChooseType:(ChangeTypeButton *)button {
    NSInteger index = 0;
    if ([button isEqual:self.MapType2DButton]) {
        index = 0;
    }else if ([button isEqual:self.MapSateliteTypeButton]) {
        index = 1;
    }else if ([button isEqual:self.MapMixTypeButton]) {
        index = 2;
    }
    
    if (self.callBack) {
        self.callBack(index);
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.MapType2DButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self).offset(SpaceMargin);
        make.bottom.equalTo(self).offset(-SpaceMargin);
        make.width.equalTo(self.MapSateliteTypeButton);
    }];
    
    [self.MapSateliteTypeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(SpaceMargin);
        make.left.equalTo(self.MapType2DButton.mas_right);
        make.bottom.equalTo(self).offset(-SpaceMargin);
        make.width.equalTo(self.MapMixTypeButton);
    }];
    
    [self.MapMixTypeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(SpaceMargin);
        make.left.equalTo(self.MapSateliteTypeButton.mas_right);
        make.bottom.equalTo(self).offset(-SpaceMargin);
        make.right.equalTo(self).offset(-SpaceMargin * 2);
        make.width.equalTo(self.MapType2DButton);
    }];
}


#pragma mark - lazy


- (ChangeTypeButton *)MapType2DButton {
    if (!_MapType2DButton) {
        _MapType2DButton = [ChangeTypeButton buttonWithType:UIButtonTypeCustom];
        [_MapType2DButton setTitle:@"2D 地图" forState:UIControlStateNormal];
        [_MapType2DButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _MapType2DButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_MapType2DButton setImage:[UIImage imageNamed:@"map_2d"] forState:UIControlStateNormal];
        [_MapType2DButton addTarget:self action:@selector(userChooseType:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _MapType2DButton;
}


- (ChangeTypeButton *)MapSateliteTypeButton {
    if (!_MapSateliteTypeButton) {
        _MapSateliteTypeButton = [ChangeTypeButton buttonWithType:UIButtonTypeCustom];
        [_MapSateliteTypeButton setTitle:@"卫星地图" forState:UIControlStateNormal];
        [_MapSateliteTypeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _MapSateliteTypeButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_MapSateliteTypeButton setImage:[UIImage imageNamed:@"map_satellite"] forState:UIControlStateNormal];
        [_MapSateliteTypeButton addTarget:self action:@selector(userChooseType:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _MapSateliteTypeButton;
}

- (ChangeTypeButton *)MapMixTypeButton {
    if (!_MapMixTypeButton) {
        _MapMixTypeButton = [ChangeTypeButton buttonWithType:UIButtonTypeCustom];
        [_MapMixTypeButton setTitle:@"混合地图" forState:UIControlStateNormal];
        [_MapMixTypeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _MapMixTypeButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_MapMixTypeButton setImage:[UIImage imageNamed:@"map_hybrid"] forState:UIControlStateNormal];
        [_MapMixTypeButton addTarget:self action:@selector(userChooseType:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _MapMixTypeButton;
}

- (UIView *)seperateLine1 {
    if (!_seperateLine1) {
        
    }
    return _seperateLine1;
}

- (UIView *)seperateLine2 {
    if (!_seperateLine2) {
        
    }
    return _seperateLine2;
}

@end
