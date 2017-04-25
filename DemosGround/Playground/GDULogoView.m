//
//  GDULogoView.m
//  GFlight
//
//  Created by EG on 17/3/15.
//  Copyright © 2017年 GDU. All rights reserved.
//

#import "GDULogoView.h"
#import <Masonry.h>

@interface GDULogoView()

/*label*/
@property (strong, nonatomic)UIImageView *labelImage;

@end

@implementation GDULogoView

+ (GDULogoView *)animationLogoView {
    GDULogoView *logo = [[GDULogoView alloc]initWithFrame:CGRectMake(0, 0, 20, 30)];
//                         WithImage:[UIImage imageNamed:@"logo_white"]];
    logo.backgroundColor = [UIColor lightGrayColor];
    return logo;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.labelImage];
    }
    return self;
}

- (instancetype)initWithImage:(UIImage *)image {
    if (self = [super initWithImage:image]) {
        [self addSubview:self.labelImage];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.labelImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self);
        make.left.mas_equalTo(self);
        make.right.mas_equalTo(self);
        make.height.mas_equalTo(100);
    }];
}

- (UIImageView *)labelImage {
    if (!_labelImage) {
        _labelImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 10)];
        _labelImage.backgroundColor = [UIColor blackColor];
//                       Image:[UIImage imageNamed:@"title_logo_black"]];
    }
    return _labelImage;
}

@end
