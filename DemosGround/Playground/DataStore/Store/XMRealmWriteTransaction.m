//
//  XMRealmWriteTransaction.m
//  dataDemo
//
//  Created by 郭建斌 on 15/11/30.
//  Copyright © 2015年 郭建斌. All rights reserved.
//

#import "XMRealmWriteTransaction.h"

@interface XMRealmWriteTransaction ()

@property (nonatomic) RLMRealmConfiguration *configuration;

@property (nonatomic, readwrite, getter=isInterrupted) BOOL interrupted;
@property (nonatomic, readwrite, getter=isCancelled) BOOL cancelled;

@end

@implementation XMRealmWriteTransaction
#pragma mark - Life cycle

- (instancetype)initWithConfiguration:(RLMRealmConfiguration *)configuration
{
    if (self = [super init]) {
        NSParameterAssert(configuration);
        self.configuration = configuration;
    }
    return self;
}

- (void)dealloc
{
#ifdef DDLogInfo
    DDLogInfo(@"%s", __func__);
#endif
}

#pragma mark - Realm

- (RLMRealm *)realm
{
    return [RLMRealm realmWithConfiguration:self.configuration error:nil];
}

#pragma mark - Transaction
/**
 *  同步事务存储
 *
 *  @param configuration 数据库配置
 *  @param writeBlock    存储操作
 */
+ (void)writeTransactionWithConfiguration:(RLMRealmConfiguration *)configuration
                               writeBlock:(XMRealmWriteTransactionWriteBlock)writeBlock
{
    XMRealmWriteTransaction *trans = [[self alloc] initWithConfiguration:configuration];
    [trans writeTransactionWithWriteBlock:writeBlock];
}
/**
 *  数据写入事务 （可同步 可异步）
 *
 *  @param configuration 数据库配置
 *  @param queue         操作队列
 *  @param writeBlock    存储操作
 *  @param completion    完成回调
 *
 *  @return 操作事务对象
 */
+ (instancetype)writeTransactionWithConfiguration:(RLMRealmConfiguration *)configuration
                                            queue:(dispatch_queue_t)queue
                                       writeBlock:(XMRealmWriteTransactionWriteBlock)writeBlock
                                       completion:(XMRealmWriteTransactionCompletion)completion
{
    XMRealmWriteTransaction *trans = [[self alloc] initWithConfiguration:configuration];
    [trans writeTransactionWithQueue:queue writeBlock:writeBlock completion:completion];
    return trans;
}

#pragma mark - Transaction Private
/**
 *  数据写入事务
 *
 *  @param writeBlock 写入操作
 */
- (void)writeTransactionWithWriteBlock:(XMRealmWriteTransactionWriteBlock)writeBlock
{
    RLMRealm *realm = [self realm];
    [realm beginWriteTransaction];
    
    if (writeBlock) writeBlock(self, realm);
    
    if (self.isCancelled) {
        [realm cancelWriteTransaction];
    } else {
        [realm commitWriteTransaction];
    }
}
/**
 *  数据写入事务
 *
 *  @param queue      操作队列
 *  @param writeBlock 写入操作
 *  @param completion 完成回调
 */
- (void)writeTransactionWithQueue:(dispatch_queue_t)queue
                       writeBlock:(XMRealmWriteTransactionWriteBlock)writeBlock
                       completion:(XMRealmWriteTransactionCompletion)completion
{
    dispatch_async(queue, ^{
        [self writeTransactionWithWriteBlock:writeBlock];
        
        dispatch_async(dispatch_get_main_queue(), ^{

            [[self realm] refresh]; 
            if (completion) completion(self);
        });
    });
}

#pragma mark - State
//中断
- (void)interrupt
{
    self.interrupted = YES;
}

- (void)cancel
{
    self.cancelled = YES;
}
@end
