//
//  XMRealmOperation.h
//  dataDemo
//
//  Created by 郭建斌 on 15/11/30.
//  Copyright © 2015年 郭建斌. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

@class XMRealmOperation;

typedef id(^XMRealmOperationObjectsBlock)(XMRealmOperation *operation, RLMRealm *realm);

typedef void(^XMRealmOperationCompletion)(XMRealmOperation *operation);

typedef void(^XMRealmOperationFetchCompletion)(XMRealmOperation *operation, RLMResults *results,NSString * primaryKey,NSMutableArray * models);

@interface XMRealmOperation : NSObject

@property (nonatomic, readonly, getter=isCancelled) BOOL cancelled;


///------
/// Write
///------

+ (void)writeOperationWithConfiguration:(RLMRealmConfiguration *)configuration
                           objectsBlock:(XMRealmOperationObjectsBlock)objectsBlock;

+ (instancetype)writeOperationWithConfiguration:(RLMRealmConfiguration *)configuration
                                          queue:(dispatch_queue_t)queue
                                   objectsBlock:(XMRealmOperationObjectsBlock)objectsBlock
                                     completion:(XMRealmOperationCompletion)completion;

///-------
/// Delete
///-------

+ (void)deleteOperationWithConfiguration:(RLMRealmConfiguration *)configuration
                            objectsBlock:(XMRealmOperationObjectsBlock)objectsBlock;

+ (instancetype)deleteOperationWithConfiguration:(RLMRealmConfiguration *)configuration
                                           queue:(dispatch_queue_t)queue
                                    objectsBlock:(XMRealmOperationObjectsBlock)objectsBlock
                                      completion:(XMRealmOperationCompletion)completion;

///------
/// Fetch
///------

+ (id)fetchOperationWithConfiguration:(RLMRealmConfiguration *)configuration
                         objectsBlock:(XMRealmOperationObjectsBlock)objectsBlock;

+ (instancetype)fetchOperationWithConfiguration:(RLMRealmConfiguration *)configuration
                                          queue:(dispatch_queue_t)queue
                                   objectsBlock:(XMRealmOperationObjectsBlock)objectsBlock
                                     completion:(XMRealmOperationFetchCompletion)completion;

///------
/// State
///------

- (void)cancel;

@end
