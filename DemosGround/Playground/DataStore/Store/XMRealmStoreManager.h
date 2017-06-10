//
//  XMRealmStore.h
//  dataDemo
//
//  Created by 郭建斌 on 15/11/30.
//  Copyright © 2015年 郭建斌. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMRealmOperation.h"
#import "XMRealmWriteTransaction.h"

@class XMRealmStoreManager;

typedef void(^XMRealmStoreOperationCompletion)(XMRealmStoreManager *store, XMRealmOperation *operation, RLMRealm *realm);

typedef void(^XMRealmStoreFetchOperationCompletion)(XMRealmStoreManager *store, XMRealmOperation *operation, RLMRealm *realm, RLMResults *results,NSString * primaryKey,NSMutableArray * models);

typedef void(^XMRealmStoreWriteTransactionCompletion)(XMRealmStoreManager *store, XMRealmWriteTransaction *transaction, RLMRealm *realm);

@interface XMRealmStoreManager : NSObject

///-----------------
/// @name Initialize
///-----------------

- (instancetype)initWithConfiguration:(RLMRealmConfiguration *)configuration;
@property (nonatomic, readonly) RLMRealmConfiguration *configuration;

- (RLMRealm *)realm;

- (BOOL)inMemory;

- (BOOL)encrypted;

+ (instancetype)shareManager;

+ (dispatch_queue_t)queue;

///------------------
/// @name Transaction
///------------------

- (void)writeTransactionWithWriteBlock:(XMRealmWriteTransactionWriteBlock)writeBlock;

- (XMRealmWriteTransaction*)writeTransactionWithWriteBlock:(XMRealmWriteTransactionWriteBlock)writeBlock
                                                completion:(XMRealmStoreWriteTransactionCompletion)completion;

///----------------------
/// @name Operation Write
///----------------------

- (void)writeObjectsWithObjectsBlock:(XMRealmOperationObjectsBlock)objectsBlock;

- (XMRealmOperation*)writeObjectsWithObjectsBlock:(XMRealmOperationObjectsBlock)objectsBlock
                                       completion:(XMRealmStoreOperationCompletion)completion;

///-----------------------
/// @name Operation Delete
///-----------------------

- (void)deleteObjectsWithObjectsBlock:(XMRealmOperationObjectsBlock)objectsBlock;

- (XMRealmOperation*)deleteObjectsWithObjectsBlock:(XMRealmOperationObjectsBlock)objectsBlock
                                        completion:(XMRealmStoreOperationCompletion)completion;

- (void)deleteAllObjects;

- (void)deleteAllObjectsWithCompletion:(XMRealmStoreWriteTransactionCompletion)completion;

///----------------------
/// @name Operation Fetch
///----------------------

- (id)fetchObjectsWithObjectsBlock:(XMRealmOperationObjectsBlock)objectsBlock;

- (XMRealmOperation*)fetchObjectsWithObjectsBlock:(XMRealmOperationObjectsBlock)objectsBlock
                                       completion:(XMRealmStoreFetchOperationCompletion)completion;

///--------------
/// @name Utility
///--------------

+ (NSString*)realmPathWithFileName:(NSString *)fileName;

+ (NSData *)defaultEncryptionKey;

+ (NSData *)encryptionKeyForKeychainIdentifier:(NSString *)identifier;

@end
