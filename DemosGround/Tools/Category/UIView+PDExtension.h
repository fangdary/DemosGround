//
//  UIView+PDExtension.h
//  GDUMini
//
//  Created by ProFlight on 16/5/18.
//  Copyright © 2016年 ProFlight. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (PDExtension)

@property (nonatomic, assign) CGFloat pd_x;

@property (nonatomic, assign) CGFloat pd_y;

@property (nonatomic, assign) CGFloat pd_width;

@property (nonatomic, assign) CGFloat pd_height;

@property (nonatomic, assign) CGFloat pd_centerX;

@property (nonatomic, assign) CGFloat pd_centerY;

@property (nonatomic, assign) CGSize size;

@property (nonatomic, assign) CGPoint origin;

@end

@interface UIView (PDAlert)

- (void)showWithCompletionHandler:(void (^)(NSInteger buttonIndex))completionHandler;

@end


