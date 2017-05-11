

    //
//  EG_TypeView.m
//  DemosGround
//
//  Created by EG on 2017/5/9.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EG_TypeView.h"

@interface EG_TypeView ()

@property (nonatomic, strong) UISegmentedControl   *imageSegmentedControl;

@end

@implementation EG_TypeView{
     CGFloat wid ;
    CGFloat hei ;
}

- (instancetype)initWithFrame:(CGRect)frame backgroundImage:(UIImage *)bgImage{
    
    if (self = [super initWithFrame:frame]) {
         self.image = bgImage;
        self.contentMode = UIViewContentModeScaleToFill;
        self.userInteractionEnabled = YES;
        
        [self addSubview:self.imageSegmentedControl];
    }
    return self;
}

- (void)layoutSubviews{
     [super layoutSubviews];
}

- (UISegmentedControl *)imageSegmentedControl{
    
    if (!_imageSegmentedControl) {
        
        _imageSegmentedControl = [[UISegmentedControl alloc] initWithItems:@[[UIImage imageNamed:@"map_2d"],
                                                                             [UIImage imageNamed:@"map_satellite"],
                                                                             [UIImage imageNamed:@"map_hybrid"]]];
        _imageSegmentedControl.frame = CGRectMake(wid * 0.08, hei * 0.1, wid * 0.77, hei * 0.65);
        _imageSegmentedControl.backgroundColor  = [UIColor clearColor];
        _imageSegmentedControl.tintColor = [UIColor redColor];
        _imageSegmentedControl.layer.masksToBounds = YES;
        
            //Add clear color to mask any bits of a selection state that the object might show around the images
        UIImage *onceActive;
        UIImage *recurringActive;
        UIImage *scheduledActive;
        
        CGSize newSize = CGSizeMake((_imageSegmentedControl.bounds.size.width - 30)/3, _imageSegmentedControl.bounds.size.height - 10);
      
        [_imageSegmentedControl setImage:onceActive forSegmentAtIndex:0];
        [_imageSegmentedControl setImage:recurringActive forSegmentAtIndex:1];
        [_imageSegmentedControl setImage:scheduledActive forSegmentAtIndex:2];
        [_imageSegmentedControl setDividerImage:[self imageWithColor:[UIColor clearColor]] forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        
//        [_imageSegmentedControl addTarget:self action:@selector(mapType:) forControlEvents:UIControlEventValueChanged];
    }
    return _imageSegmentedControl;
}

- (UIImage *)imageWithColor:(UIColor *)color{
    
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (NSInteger)selectedIndex{
    
    return self.imageSegmentedControl.selectedSegmentIndex;
}

- (void)imageSelectedIndex:(NSInteger)index{
    
      wid = CGRectGetWidth(self.bounds);
    hei = CGRectGetHeight(self.bounds);
    
    [self addSubview:self.imageSegmentedControl];
    self.imageSegmentedControl.selectedSegmentIndex = index;
}

- (void)setFootTitles:(NSArray *)footTitles{
    
    _footTitles = footTitles;
    
    if (_footTitles.count >= 1) {
        
        [self.footTitles enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(wid * 0.08 + (idx * wid * 0.77/3), hei * 0.77, wid * 0.77/3, hei * 0.2)];
            label.text = obj;
            label.font = [UIFont systemFontOfSize:10];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor whiteColor];
            label.backgroundColor = [UIColor clearColor];
            [self addSubview:label];
        }];
    }
}

- (void)removeAllSubViews{
    
    [_imageSegmentedControl removeFromSuperview];
    _imageSegmentedControl = nil;
    for (UIView *view in self.subviews) { [view removeFromSuperview]; }
    [self removeFromSuperview];
}

- (void)dealloc{
     [self removeAllSubViews];
}

@end

