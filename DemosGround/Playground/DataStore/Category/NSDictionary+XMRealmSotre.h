//
//  NSDictionary+XMRealmSotre.h
//  dataDemo
//
//  Created by 郭建斌 on 15/11/30.
//  Copyright © 2015年 郭建斌. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (XMRealmSotre)
- (id)xm_objectOrNilForKey:(NSString *)key;
- (NSString *)xm_stringOrDefaultStringForKey:(NSString *)key;
@end
