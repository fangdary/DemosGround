//
//  RLMArray+XMRealmStore.h
//  dataDemo
//
//  Created by 郭建斌 on 15/11/30.
//  Copyright © 2015年 郭建斌. All rights reserved.
//


#import <Realm/RLMArray.h>

@interface RLMArray (XMRealmStore)
- (BOOL)xm_containsObject:(RLMObject*)object;
- (void)xm_uniqueAddObject:(RLMObject*)object;
- (void)xm_removeObject:(RLMObject*)object;

@end
