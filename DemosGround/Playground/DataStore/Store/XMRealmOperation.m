//
//  XMRealmOperation.m
//  dataDemo
//
//  Created by 郭建斌 on 15/11/30.
//  Copyright © 2015年 郭建斌. All rights reserved.
//

#import "XMRealmOperation.h"
typedef NS_ENUM(NSUInteger, XMRealmOperationType) {
    XMRealmOperationTypeAddOrUpdate,
    XMRealmOperationTypeDelete,
};

@interface XMRealmOperation ()

@property (nonatomic) RLMRealmConfiguration *configuration;

@property (nonatomic, readwrite, getter=isCancelled) BOOL cancelled;

@end
@implementation XMRealmOperation
#pragma mark - 初始化配置

- (instancetype)initWithConfiguration:(RLMRealmConfiguration *)configuration
{
    if (self = [super init]) {
        NSParameterAssert(configuration);
        self.configuration = configuration;
    }
    return self;
}
/**
 *  根据给定配置实例化realm单例
 *
 *  @param configuration 配置
 *
 *  @return 数据操作对象
 */
- (instancetype)initRealmWithConfiration:(RLMRealmConfiguration *)configuration
{
    if (self = [super init]) {
        NSParameterAssert(configuration);
        self.configuration = configuration;
        [self realm];
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
/**
 *   用给定配置初始化realm数据单例
 *
 *  @return 数据库Realm
 */
- (RLMRealm *)realm
{
    return [RLMRealm realmWithConfiguration:self.configuration error:nil];
}

#pragma mark - Operation
#pragma mark Write
/**
 *  写入数据 （同步）
 *
 *  @param configuration 数据库配置
 *  @param objectsBlock  数据操作
 */
+ (void)writeOperationWithConfiguration:(RLMRealmConfiguration *)configuration
                           objectsBlock:(XMRealmOperationObjectsBlock)objectsBlock
{
    NSParameterAssert(objectsBlock);
    
    XMRealmOperation *ope = [[self alloc] initWithConfiguration:configuration];
    [ope writeObjectsWithObjectsBlock:objectsBlock];
}
/**
 *  写入数据操作 （可同步 可异步）
 *
 *  @param configuration 数据库配置
 *  @param queue         队列
 *  @param objectsBlock  数据操作
 *  @param completion    完成回调
 *
 *  @return 数据任务对象
 */
+ (instancetype)writeOperationWithConfiguration:(RLMRealmConfiguration *)configuration
                                          queue:(dispatch_queue_t)queue
                                   objectsBlock:(XMRealmOperationObjectsBlock)objectsBlock
                                     completion:(XMRealmOperationCompletion)completion
{
    NSParameterAssert(objectsBlock);
    
    XMRealmOperation *ope = [[self alloc] initWithConfiguration:configuration];
    [ope writeObjectsWithQueue:queue objectsBlock:objectsBlock completion:completion];
    return ope;
}

#pragma mark Delete
/**
 *  删除数据操作
 *
 *  @param configuration 数据库配置
 *  @param objectsBlock  数据操作
 */
+ (void)deleteOperationWithConfiguration:(RLMRealmConfiguration *)configuration
                            objectsBlock:(XMRealmOperationObjectsBlock)objectsBlock
{
    NSParameterAssert(objectsBlock);
    
    XMRealmOperation *ope = [[self alloc] initWithConfiguration:configuration];
    [ope deleteObjectsWithObjectsBlock:objectsBlock];
}
/**
 *  删除数据操作（可同步可异步）
 *
 *  @param configuration 数据库配置
 *  @param queue         操作队列
 *  @param objectsBlock  数据操作
 *  @param completion    完成回调
 *
 *  @return 数据任务对象
 */
+ (instancetype)deleteOperationWithConfiguration:(RLMRealmConfiguration *)configuration
                                           queue:(dispatch_queue_t)queue
                                    objectsBlock:(XMRealmOperationObjectsBlock)objectsBlock
                                      completion:(XMRealmOperationCompletion)completion
{
    NSParameterAssert(objectsBlock);
    
    XMRealmOperation *ope = [[self alloc] initWithConfiguration:configuration];
    [ope deleteObjectsWithQueue:queue objectsBlock:objectsBlock completion:completion];
    return ope;
}

#pragma mark Fetch
/**
 *  获取数据
 *
 *  @param configuration 数据库配置
 *  @param objectsBlock  数据操作
 *
 *  @return 返回获取到的数据
 */
+ (id)fetchOperationWithConfiguration:(RLMRealmConfiguration *)configuration
                         objectsBlock:(XMRealmOperationObjectsBlock)objectsBlock
{
    NSParameterAssert(objectsBlock);
    
    XMRealmOperation *ope = [[self alloc] initWithConfiguration:configuration];
    return [ope fetchOperationWithObjectsBlock:objectsBlock];
}
/**
 *  获取数据
 *
 *  @param configuration 数据库配置
 *  @param queue         操作队列
 *  @param objectsBlock  数据操作
 *  @param completion    完成回调
 *
 *  @return 获取到的数据
 */
+ (instancetype)fetchOperationWithConfiguration:(RLMRealmConfiguration *)configuration
                                          queue:(dispatch_queue_t)queue
                                   objectsBlock:(XMRealmOperationObjectsBlock)objectsBlock
                                     completion:(XMRealmOperationFetchCompletion)completion
{
    XMRealmOperation *ope = [[self alloc] initWithConfiguration:configuration];
    [ope fetchOperationWithQueue:queue objectsBlock:objectsBlock completion:completion];
    return ope;
}

#pragma mark - Operation 私有方法
#pragma mark Write
/**
 *  写入 或者更新 数据
 *
 *  @param objectsBlock 数据操作
 */
- (void)writeObjectsWithObjectsBlock:(XMRealmOperationObjectsBlock)objectsBlock
{
    [self writeObjectsWithObjectsBlock:objectsBlock
                                  type:XMRealmOperationTypeAddOrUpdate];
}
/**
 *  写入 数据 （可同步 可异步）
 *
 *  @param queue        队列
 *  @param objectsBlock 数据操作
 *  @param completion   完成回调
 */
- (void)writeObjectsWithQueue:(dispatch_queue_t)queue
                 objectsBlock:(XMRealmOperationObjectsBlock)objectsBlock
                   completion:(XMRealmOperationCompletion)completion
{
    dispatch_async(queue, ^{
        [self writeObjectsWithObjectsBlock:objectsBlock];
        dispatch_async(dispatch_get_main_queue(), ^{
            [[self realm] refresh];
            if (completion) completion(self);
        });
    });
}

#pragma mark Delete
/**
 *  同步删除数据
 *
 *  @param objectsBlock 数据操作
 */
- (void)deleteObjectsWithObjectsBlock:(XMRealmOperationObjectsBlock)objectsBlock
{
    [self writeObjectsWithObjectsBlock:objectsBlock
                                  type:XMRealmOperationTypeDelete];
}
/**
 *  删除数据操作
 *
 *  @param queue        操作队列
 *  @param objectsBlock 数据操作
 *  @param completion   完成回调
 */
- (void)deleteObjectsWithQueue:(dispatch_queue_t)queue
                  objectsBlock:(XMRealmOperationObjectsBlock)objectsBlock
                    completion:(XMRealmOperationCompletion)completion
{
    dispatch_async(queue, ^{
        [self deleteObjectsWithObjectsBlock:objectsBlock];
        dispatch_async(dispatch_get_main_queue(), ^{
            [[self realm] refresh];
            if (completion) completion(self);
        });
    });
}

#pragma mark Fetch
/**
 *  同步获取数据
 *
 *  @param objectsBlock 数据操作
 *
 *  @return 获得数据
 */
- (id)fetchOperationWithObjectsBlock:(XMRealmOperationObjectsBlock)objectsBlock
{
    return objectsBlock ? objectsBlock(self, [self realm]) : nil;
}
/**
 *  获取数据
 *
 *  @param queue        操作队列
 *  @param objectsBlock 数据操作
 *  @param completion   完成回调  
 */
- (void)fetchOperationWithQueue:(dispatch_queue_t)queue
                   objectsBlock:(XMRealmOperationObjectsBlock)objectsBlock
                     completion:(XMRealmOperationFetchCompletion)completion
{
    dispatch_async(queue, ^{
       
        NSMutableArray *values;
        NSMutableArray * models;
        
        Class resultClass;
        
        NSString *primaryKey;
        
        id results = objectsBlock ? objectsBlock(self, [self realm]) : nil;
//        如果数据中途不被取消 并且有查询数据
        if (!self.isCancelled && results) {
//            
            if (![results conformsToProtocol:@protocol(NSFastEnumeration)]) {
                results = @[results];
            }
            NSParameterAssert([results isKindOfClass:[NSArray class]]
                              || [results isKindOfClass:[RLMArray class]]
                              || [results isKindOfClass:[RLMResults class]]);
            
            values = [NSMutableArray arrayWithCapacity:[results count]];
            models = [NSMutableArray arrayWithCapacity:[results count]];
            RLMObject *result = [results firstObject];
            resultClass = [result class];
            
            primaryKey = [resultClass primaryKey];
            
            if (result) {
                if (resultClass && primaryKey) {
                    for (RLMObject *obj in results) {
                        NSParameterAssert([obj isKindOfClass:[RLMObject class]]);
                        [values addObject:[obj valueForKey:primaryKey]];
                        [models addObject:obj];
                        
                    }
                } else {
#ifdef DDLogWarn
                    DDLogWarn(@"%s; Primary key is required; class = %@, primaryKey = %@", __func__, NSStringFromClass(resultClass), primaryKey);
#endif
                }
            }
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            RLMResults *results;
            if (!self.isCancelled && [values count] > 0 && resultClass && primaryKey) {
                results = [resultClass objectsInRealm:[self realm]
                                                where:@"%K IN %@", primaryKey, values];
            }
            
            if (completion) completion(self, results,primaryKey,models);
        });
    });
}

#pragma mark 私有方法
/**
 *  数据库写入
 *
 *  @param objectsBlock 数据操作
 *  @param type         类型 （添加和更新 OR 删除）
 */
- (void)writeObjectsWithObjectsBlock:(XMRealmOperationObjectsBlock)objectsBlock
                                type:(XMRealmOperationType)type
{
    RLMRealm *realm = [self realm];
//    开始写入事务
    [realm beginWriteTransaction];
//    获取的数据
    id object = objectsBlock ? objectsBlock(self, realm) : nil;
//    如果想让写入事务被取消 那么就取消
    if (self.isCancelled) {
        [realm cancelWriteTransaction];
        return;
    }
    
    if (object) {
//        如果不符合快速枚举协议
        if (![object conformsToProtocol:@protocol(NSFastEnumeration)]) {
            object = @[object];
        }
        switch (type) {
            case XMRealmOperationTypeAddOrUpdate:
                [realm addOrUpdateObjectsFromArray:object];
                break;
            case XMRealmOperationTypeDelete:
                [realm deleteObjects:object];
                break;
            default:
                NSAssert1(false, @"不支持的操作类型 操作类型是 %zd;", type);
                break;
        }
    }
//    如果这个时候想取消写入操作 那么就不提交事务 取消事务 反之提交事务
    if (self.isCancelled) {
        [realm cancelWriteTransaction];
    } else {
        [realm commitWriteTransaction];
    }
}

#pragma mark - State

- (void)cancel
{
    self.cancelled = YES;
}

@end
