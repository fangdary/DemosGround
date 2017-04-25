//
//  EG_LoadingProgressTableViewCell.m
//  DemosGround
//
//  Created by EG on 17/3/27.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EG_LoadingProgressTableViewCell.h"
#import "EG_PieView.h"
#import <Masonry.h>

@interface EG_LoadingProgressTableViewCell()

/*loading View*/
@property (strong, nonatomic)EG_PieView *loadingView;

@end

@implementation EG_LoadingProgressTableViewCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
//    [self.loadingView TestMethod];
    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.loadingView];
    }
    return self;
}

- (void)testMethod {
    [self.loadingView TestMethod];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.loadingView) {
        [self.loadingView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self);
            make.size.mas_equalTo(CGSizeMake(30, 30));
            make.right.mas_equalTo(self.contentView).offset(-12);
        }];
    }
}

- (void)updateProgress:(CGFloat)progress {
    
}

- (void)startLoadingAnimation {
    
}

- (void)removeAnimation {
}

#pragma mark - lazy

- (EG_PieView *)loadingView {
    if (!_loadingView) {
        _loadingView = [[EG_PieView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)
                                        withStrokeWidth:15
                                               andColor:[UIColor whiteColor]
                                             andPercent:.3
                                           andAnimation:YES];

    }
    return _loadingView;
}

@end
