//
//  EG_RACViewController.m
//  DemosGround
//
//  Created by EG on 2017/6/8.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EG_RACViewController.h"
#import <ReactiveObjC.h>

@interface EG_RACViewController ()

@property (weak, nonatomic) UIButton *button1;

@property (weak, nonatomic) UIButton *button2;

@property (weak, nonatomic) UIButton *button3;

/*button*/
@property (strong, nonatomic)UIButton *codeButton;

@end

@implementation EG_RACViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor colorWithRed:.3 green:.1 blue:.7 alpha:.2];
    [self.view addSubview:self.codeButton];

    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:@"codeButton.selected" object:nil] subscribeNext:^(NSNotification *notification) {
        NSLog(@"%@", notification.name);
        NSLog(@"%@", notification.object);
    }];
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]init];
    [self.view addGestureRecognizer:longPress];
    [[longPress rac_gestureSignal] subscribeNext:^(__kindof UIGestureRecognizer * _Nullable x) {
        NSLog(@"long press ing ing");
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert"
                                                        message:@"Message"
                                                       delegate:self
                                              cancelButtonTitle:@"Cancel"
                                              otherButtonTitles:@"Confirm", nil];
        
        [[self rac_signalForSelector:@selector(alertView:clickedButtonAtIndex:)] subscribeNext:^(RACTuple * _Nullable x) {
            NSLog(@"alert");
        }];
        
        [alert show];
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (UIButton *)codeButton {
    if (!_codeButton) {
        _codeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _codeButton.bounds = CGRectMake(0, 0, 100, 30);
        _codeButton.backgroundColor = [UIColor redColor];
        _codeButton.center = self.view.center;
        [_codeButton setTitle:@"codeButton" forState:UIControlStateNormal];
        [[_codeButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            NSLog(@"the button code is clicked");
            x.selected = YES;
        }];
    }
    return _codeButton;
}

@end
