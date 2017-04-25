//
//  LogoAnimationViewController.m
//  DemosGround
//
//  Created by EG on 17/3/3.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "LogoAnimationViewController.h"

#import <Masonry.h>

@interface LogoAnimationViewController ()
<UIScrollViewDelegate>
/*container*/
@property (strong, nonatomic)UIScrollView *container;

/*logo*/
@property (strong, nonatomic)UIImageView *logoImageView;

/*logo label*/
@property (strong, nonatomic)UIImageView *logoLabelImageView;

@end

@implementation LogoAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.container];
    [self.container addSubview:self.logoImageView];
    [self.logoImageView addSubview:self.logoLabelImageView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.logoLabelImageView.alpha = fabs(scrollView.contentOffset.y / 200);
}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self.logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.container);
    }];
    
    [self.logoLabelImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.logoImageView);
        make.bottom.mas_equalTo(self.logoImageView);
    }];
}


#pragma mark - lazy 

- (UIScrollView *)container {
    if (!_container) {
        _container = [[UIScrollView alloc]initWithFrame:self.view.bounds];
        _container.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height);
        _container.backgroundColor = [UIColor darkGrayColor];
        _container.delegate = self;
    }
    return _container;
}

- (UIImageView *)logoImageView {
    if (!_logoImageView) {
        _logoImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"logo_white"]];
        [_logoImageView sizeToFit];
        _logoImageView.contentMode = UIViewContentModeCenter;
    }
    return _logoImageView;
}

- (UIImageView *)logoLabelImageView {
    if (!_logoLabelImageView) {
        _logoLabelImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"logo_black"]];
        [_logoLabelImageView sizeToFit];
    }
    return _logoLabelImageView;
}

@end
