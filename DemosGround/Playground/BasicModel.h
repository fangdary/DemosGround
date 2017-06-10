//
//  BasicModel.h
//  realmDemo
//
//  Created by apple on 16/3/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Realm/Realm.h>
#import "RLMObject+JSON.h"
#import "XMRealmStoreManager.h"
@interface BasicRealm : RLMObject
/**
 *  本地数据库入库的主键 ID
 */
@property (nonatomic, copy) NSString *hostID;

/**
 *  realm数据管理
 *
 *  @return realm数据管理
 */
+(XMRealmStoreManager *)realmManager;

-(XMRealmStoreManager *)realmManager;
@end
// This protocol enables typed collections. i.e.:
// RLMArray<XMBasicModel>
RLM_ARRAY_TYPE(BasicRealm)

@interface BasicModel : NSObject

@property (nonatomic, copy) NSString *hostID;


@end