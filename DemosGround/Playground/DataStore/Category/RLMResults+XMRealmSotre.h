//
//  RLMResults+XMRealmSotre.h
//  dataDemo
//
//  Created by 郭建斌 on 15/11/30.
//  Copyright © 2015年 郭建斌. All rights reserved.
//

#import <Realm/Realm.h>

@interface RLMResults (XMRealmSotre)
- (BOOL)xm_containsObject:(RLMObject*)object;
@end
