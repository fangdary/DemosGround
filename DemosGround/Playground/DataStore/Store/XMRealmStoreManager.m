//
//  XMRealmStore.m
//  dataDemo
//
//  Created by 郭建斌 on 15/11/30.
//  Copyright © 2015年 郭建斌. All rights reserved.
//

#import "XMRealmStoreManager.h"

@interface XMRealmStoreManager ()
@property (nonatomic, readwrite) RLMRealmConfiguration *configuration;
@property (nonatomic) RLMRealm *realmInMemory;
@end

@implementation XMRealmStoreManager
#pragma mark - 初始化
+(instancetype)shareManager
{
    static XMRealmStoreManager * m ;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        m = [[self alloc]init];
    });
    return m;
}

- (instancetype)initWithConfiguration:(RLMRealmConfiguration *)configuration
{
    if (self = [super init]) {
        self.configuration = configuration;
        
        if ([self inMemory]) {
            [self realm]; // Init realm in memory
        }
    }
    return self;
}

#pragma mark -

- (RLMRealmConfiguration *)configuration
{
    @synchronized(_configuration) {
        return [_configuration copy];
    }
}

- (RLMRealm *)realm
{
    if ([self inMemory]) {
        if (!self.realmInMemory) {
            // Hold onto a strong reference
            self.realmInMemory = [RLMRealm realmWithConfiguration:self.configuration error:nil];
        }
        return self.realmInMemory;
    } else {
        return [RLMRealm realmWithConfiguration:self.configuration error:nil];
    }
}

- (BOOL)inMemory
{
    NSParameterAssert(self.configuration);
    return self.configuration.inMemoryIdentifier != nil;
}

- (BOOL)encrypted
{
    NSParameterAssert(self.configuration);
    return self.configuration.encryptionKey != nil;
}

+ (dispatch_queue_t)queue
{
    static dispatch_queue_t __queue;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __queue = dispatch_queue_create("com.coverstory.XMRealmStore.queue", NULL);
    });
    return __queue;
}

#pragma mark - Transaction 事务
/**
 *  同步事务写入
 *
 *  @param writeBlock 写入操作
 */
- (void)writeTransactionWithWriteBlock:(XMRealmWriteTransactionWriteBlock)writeBlock
{
    [XMRealmWriteTransaction writeTransactionWithConfiguration:self.configuration
                                                    writeBlock:writeBlock];
}
/**
 *  数据写入 （可同步  可异步 默认异步）
 *
 *  @param writeBlock 写入操作
 *  @param completion 完成回调
 *
 *  @return 数据写入事务
 */
- (XMRealmWriteTransaction *)writeTransactionWithWriteBlock:(XMRealmWriteTransactionWriteBlock)writeBlock
                                                 completion:(XMRealmStoreWriteTransactionCompletion)completion
{
    return [XMRealmWriteTransaction writeTransactionWithConfiguration:self.configuration
                                                                queue:[[self class] queue]
                                                           writeBlock:writeBlock
                                                           completion:^(XMRealmWriteTransaction *transaction)
            {
                if (completion) completion(self, transaction, self.realm);
            }];
}

#pragma mark - Operation
#pragma mark Write
/**
 *  存储操作（同步）
 *
 *  @param objectsBlock 数据操作
 */
- (void)writeObjectsWithObjectsBlock:(XMRealmOperationObjectsBlock)objectsBlock
{
    [XMRealmOperation writeOperationWithConfiguration:self.configuration
                                         objectsBlock:objectsBlock];
}
/**
 *  存储操作 （可同步可异步 默认异步）
 *
 *  @param objectsBlock 数据操作
 *  @param completion   完成回调
 *
 *  @return 操作对象
 */
- (XMRealmOperation*)writeObjectsWithObjectsBlock:(XMRealmOperationObjectsBlock)objectsBlock
                                       completion:(XMRealmStoreOperationCompletion)completion
{
    return [XMRealmOperation writeOperationWithConfiguration:self.configuration
                                                       queue:[[self class] queue]
                                                objectsBlock:objectsBlock
                                                  completion:^(XMRealmOperation *operation)
            {
                if (completion) completion(self, operation, self.realm);
            }];
}

#pragma mark Delete
/**
 *  删除操作
 *
 *  @param objectsBlock 数据操作
 */
- (void)deleteObjectsWithObjectsBlock:(XMRealmOperationObjectsBlock)objectsBlock
{
    [XMRealmOperation deleteOperationWithConfiguration:self.configuration
                                          objectsBlock:objectsBlock];
}
/**
 *  删除操作 （可同步可异步 默认异步）
 *
 *  @param objectsBlock 数据操作
 *  @param completion   完成回调
 *
 *  @return 返回数据操作对象
 */
- (XMRealmOperation*)deleteObjectsWithObjectsBlock:(XMRealmOperationObjectsBlock)objectsBlock
                                        completion:(XMRealmStoreOperationCompletion)completion
{
    return [XMRealmOperation deleteOperationWithConfiguration:self.configuration
                                                        queue:[[self class] queue]
                                                 objectsBlock:objectsBlock
                                                   completion:^(XMRealmOperation *operation)
            {
                if (completion) completion(self, operation, self.realm);
            }];
}
/**
 *  删除所有 （同步）
 */
- (void)deleteAllObjects
{
    [XMRealmWriteTransaction writeTransactionWithConfiguration:self.configuration
                                                    writeBlock:^(XMRealmWriteTransaction *transaction, RLMRealm *realm)
     {
         [realm deleteAllObjects];
     }];
}
/**
 *  删除所欲 (可同步 可异步 默认异步)
 *
 *  @param completion 完成回调
 */
- (void)deleteAllObjectsWithCompletion:(XMRealmStoreWriteTransactionCompletion)completion
{
    [XMRealmWriteTransaction writeTransactionWithConfiguration:self.configuration
                                                         queue:[[self class] queue]
                                                    writeBlock:^(XMRealmWriteTransaction *transaction, RLMRealm *realm)
     {
         [realm deleteAllObjects];
     } completion:^(XMRealmWriteTransaction *transaction) {
         if (completion) completion(self, transaction, self.realm);
     }];
}

#pragma mark Fetch
/**
 *  获取数据
 *
 *  @param objectsBlock 数据操作
 *
 *  @return 返回数据
 */
- (id)fetchObjectsWithObjectsBlock:(XMRealmOperationObjectsBlock)objectsBlock
{
    return [XMRealmOperation fetchOperationWithConfiguration:self.configuration
                                                objectsBlock:objectsBlock];
}
/**
 *  获取数据 （可同步 可异步 默认异步）
 *
 *  @param objectsBlock 数据操作
 *  @param completion   完成回调
 *
 *  @return 返回数据
 */
- (XMRealmOperation*)fetchObjectsWithObjectsBlock:(XMRealmOperationObjectsBlock)objectsBlock
                                       completion:(XMRealmStoreFetchOperationCompletion)completion
{
    return [XMRealmOperation fetchOperationWithConfiguration:self.configuration
                                                       queue:[[self class] queue]
                                                objectsBlock:objectsBlock
                                                  completion:^(XMRealmOperation *operation, RLMResults *results ,NSString * primaryKey,NSMutableArray * models)
            {
                if (completion) completion(self, operation, self.realm, results,primaryKey,models);
            }];
}

#pragma mark - Utility
/**
 *  数据库存储地址
 *
 *  @param fileName 文件名
 *
 *  @return 数据库地址
 */
+ (NSString*)realmPathWithFileName:(NSString*)fileName
{
    NSParameterAssert(fileName);
    
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                         NSUserDomainMask,
                                                         YES)[0];
    path = [path stringByAppendingPathComponent:fileName];
    
    if ([path pathExtension].length == 0) {
        path = [path stringByAppendingPathExtension:@"realm"];
    }
    return path;
}
/**
 *  默认编码
 *
 *  @return
 */
+ (NSData *)defaultEncryptionKey
{
    return [self encryptionKeyForKeychainIdentifier:[NSBundle mainBundle].bundleIdentifier];
}

/**
 *  realm-cocoa - examples - Encryption - getKey
 *  https://github.com/realm/realm-cocoa/blob/master/examples/ios/objc/Encryption/LabelViewController.m
 */
+ (NSData *)encryptionKeyForKeychainIdentifier:(NSString *)identifier
{
    // Identifier for our keychain entry - should be unique for your application
    NSData *tag = [[NSData alloc] initWithBytesNoCopy:(void *)identifier.UTF8String
                                               length:strlen(identifier.UTF8String) + 1
                                         freeWhenDone:NO];
    
    // First check in the keychain for an existing key
    NSDictionary *query = @{(__bridge id)kSecClass: (__bridge id)kSecClassKey,
                            (__bridge id)kSecAttrApplicationTag: tag,
                            (__bridge id)kSecAttrKeySizeInBits: @512,
                            (__bridge id)kSecReturnData: @YES};
    
    CFTypeRef dataRef = NULL;
    OSStatus status = SecItemCopyMatching((__bridge CFDictionaryRef)query, &dataRef);
    if (status == errSecSuccess) {
        return (__bridge NSData *)dataRef;
    }
    
    // No pre-existing key from this application, so generate a new one
    uint8_t buffer[64];
    SecRandomCopyBytes(kSecRandomDefault, 64, buffer);
    NSData *keyData = [[NSData alloc] initWithBytes:buffer length:sizeof(buffer)];
    
    // Store the key in the keychain
    query = @{(__bridge id)kSecClass: (__bridge id)kSecClassKey,
              (__bridge id)kSecAttrApplicationTag: tag,
              (__bridge id)kSecAttrKeySizeInBits: @512,
              (__bridge id)kSecValueData: keyData};
    
    status = SecItemAdd((__bridge CFDictionaryRef)query, NULL);
    NSAssert(status == errSecSuccess, @"Failed to insert new key in the keychain");
    
    return keyData;
}
@end
