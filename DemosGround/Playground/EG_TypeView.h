//
//  EG_TypeView.h
//  DemosGround
//
//  Created by EG on 2017/5/9.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import <UIKit/UIKit.h>

 @interface EG_TypeView : UIImageView

- (instancetype)initWithFrame:(CGRect)frame backgroundImage:(UIImage *)bgImage;

@property (nonatomic, readonly) NSInteger selectedIndex;    /* 获取默认选中的图片 */
@property (nonatomic, copy) NSArray *footTitles;            /* 脚标题文本 */
@property (nonatomic) BOOL  remove;                         /* 是否移除 */

- (void)imageSelectedIndex:(NSInteger)index;                /* 设置默认选中的图片 */
- (void)removeAllSubViews;                                  /* 移除当前视图的所有子视图，包括本身 */

@end
