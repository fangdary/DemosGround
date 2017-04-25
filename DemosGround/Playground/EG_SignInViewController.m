//
//  EG_SignInViewController.m
//  DemosGround
//
//  Created by EG on 17/3/15.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EG_SignInViewController.h"

#import "UIView+PDExtension.h"
#import "UIColor+PDExtension.h"
#import <Masonry.h>

#import "EG_RegisterView.h"
#import "EG_SignInVIew.h"
#import "EG_ForgetPasswordView.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_BOUNDS [UIScreen mainScreen].bounds

@interface EG_SignInViewController ()

/*container*/
@property (strong, nonatomic)UIScrollView *container;

/*horizon scorll*/
@property (strong, nonatomic)UIScrollView *horizonScrollView;

/*register view*/
@property (strong, nonatomic)EG_RegisterView *registerView;

/*signIn view*/
@property (strong, nonatomic)EG_SignInVIew *signInView;

/*getpassword view*/
@property (strong, nonatomic)EG_ForgetPasswordView *getpasswordView;

@end

@implementation EG_SignInViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.container.contentOffset = CGPointMake(0, 100);
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.hidden = YES;
    [self initSubviews];
}

- (void)initSubviews {
    [self.view addSubview:self.container];
    [self.container addSubview:self.horizonScrollView];
    
    [self.horizonScrollView addSubview:self.registerView];
    [self.horizonScrollView addSubview:self.signInView];
    [self.horizonScrollView addSubview:self.getpasswordView];
}


#pragma mark - layout
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self.container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.mas_equalTo(self.view);
    }];
    
    [self.horizonScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view).offset(SCREEN_HEIGHT * .5);
    }];
    
    [self.registerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.horizonScrollView);
        make.left.mas_equalTo(self.horizonScrollView);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.mas_equalTo(self.horizonScrollView);
    }];
    
    [self.signInView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.horizonScrollView);
        make.left.mas_equalTo(self.registerView.mas_right);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.mas_equalTo(self.horizonScrollView);
    }];
    
    [self.getpasswordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.horizonScrollView);
        make.left.mas_equalTo(self.signInView.mas_right);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.mas_equalTo(self.horizonScrollView);
    }];
}

#pragma mark - lazyload

- (UIScrollView *)container {
    if (!_container) {
        _container = [[UIScrollView alloc]initWithFrame:CGRectZero];
        _container.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT);
        _container.backgroundColor = [UIColor lightGrayColor];
    }
    return _container;
}

- (UIScrollView *)horizonScrollView {
    if (!_horizonScrollView) {
        _horizonScrollView = [[UIScrollView alloc]initWithFrame:CGRectZero];
        _horizonScrollView.contentSize = CGSizeMake(SCREEN_WIDTH * 3, SCREEN_HEIGHT * .5);
        _horizonScrollView.backgroundColor = [UIColor darkGrayColor];
        _horizonScrollView.showsHorizontalScrollIndicator = YES;
        _horizonScrollView.scrollEnabled = NO;
    }
    return _horizonScrollView;
}

- (EG_RegisterView *)registerView {
    if (!_registerView) {
        _registerView = [[EG_RegisterView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT * .5)];
        _registerView.backgroundColor = [UIColor redColor];
        __weak typeof(self) weakSelf = self;
        _registerView.callBack = ^(){
            [weakSelf scrollToTop];
        };
    }
    return _registerView;
}

- (EG_SignInVIew *)signInView {
    if (!_signInView) {
        _signInView = [[EG_SignInVIew alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT * .5)];
        _signInView.backgroundColor = [UIColor greenColor];
        __weak typeof(self) weakSelf = self;
        _signInView.callBack = ^(){
            [weakSelf scrollToTop];
        };
    }
    return _signInView;
}

- (EG_ForgetPasswordView *)getpasswordView {
    if (!_getpasswordView) {
        _getpasswordView =  [[EG_ForgetPasswordView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT * .5)];
        _signInView.backgroundColor = [UIColor blueColor];
        __weak typeof(self) weakSelf = self;
        _getpasswordView.callBack = ^(){
            [weakSelf scrollToTop];
        };

    }
    return _getpasswordView;
}


- (void)scrollToTop {
    [UIView animateWithDuration:.8 animations:^{
        self.container.contentOffset = CGPointMake(0, 0);
    }];
}

@end
