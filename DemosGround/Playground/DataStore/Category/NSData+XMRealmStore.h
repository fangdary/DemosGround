//
//  NSData+XMRealmStore.h
//  dataDemo
//
//  Created by 郭建斌 on 15/11/30.
//  Copyright © 2015年 郭建斌. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (XMRealmStore)

+ (NSData *)xm_realmDefaultData;
- (BOOL)xm_isRealmDefaultData;

@end
