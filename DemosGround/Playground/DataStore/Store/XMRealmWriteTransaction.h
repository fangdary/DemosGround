//
//  XMRealmWriteTransaction.h
//  dataDemo
//
//  Created by 郭建斌 on 15/11/30.
//  Copyright © 2015年 郭建斌. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>
@class XMRealmWriteTransaction;

typedef void(^XMRealmWriteTransactionWriteBlock)(XMRealmWriteTransaction *transaction, RLMRealm *realm);
typedef void(^XMRealmWriteTransactionCompletion)(XMRealmWriteTransaction *transaction);

@interface XMRealmWriteTransaction : NSObject

///------------
/// Transaction
///------------

+ (void)writeTransactionWithConfiguration:(RLMRealmConfiguration *)configuration
                               writeBlock:(XMRealmWriteTransactionWriteBlock)writeBlock;

+ (instancetype)writeTransactionWithConfiguration:(RLMRealmConfiguration *)configuration
                                            queue:(dispatch_queue_t)queue
                                       writeBlock:(XMRealmWriteTransactionWriteBlock)writeBlock
                                       completion:(XMRealmWriteTransactionCompletion)completion;

///------
/// State
///------

- (void)interrupt;
@property (nonatomic, readonly, getter=isInterrupted) BOOL interrupted;

- (void)cancel;
@property (nonatomic, readonly, getter=isCancelled) BOOL cancelled;

@end
