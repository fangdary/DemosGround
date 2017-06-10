//
//  NSDate+XMRealmStore.h
//  dataDemo
//
//  Created by 郭建斌 on 15/11/30.
//  Copyright © 2015年 郭建斌. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (XMRealmStore)
+ (NSDate *)xm_realmDefaultDate;

- (BOOL)xm_isRealmDefaultDate;
@end
