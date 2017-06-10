//
//  ViewController.m
//  realmDemo
//
//  Created by apple on 16/3/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    数据解析 可以用MJ等字典转模型框架
    DataModel * model = [[DataModel alloc]init];
    model.title = @"好好学习天天向上";
    
    NSMutableArray * image_urls = [NSMutableArray array];
    
    for (int i = 0; i < 3; i++) {
        NSString * imageURL = @"http://gkalgggngngn";
        ImageModel * imageModel = [[ImageModel alloc]init];
        imageModel.image = imageURL;
        [image_urls addObject:imageModel];
    }
    model.image_url = image_urls;
    
//    数据库写入
    
    [self add];
    
}

//增 or 改
-(void)add
{
    [[DataRealm realmManager] writeObjectsWithObjectsBlock:^id(XMRealmOperation *operation, RLMRealm *realm) {
//        在这返回一个id对象 可以是一个包含多个数据库模型的数组，也可以是单个数据库模型对象 可以调用Real自己的解析字典方法，也可以用封装好的方法（根据服务器返回的数据类型）
        
        NSLog(@"%@", realm);
        
        return [DataRealm createOrUpdateInRealm:realm withJSONDictionary:@{@"hostID":@"1",@"title":@"好好学习天天向上",@"image_url":@[@{@"hostID":@"1",@"image":@"http://image1"},@{@"hostID":@"2",@"image":@"http://image2"},@{@"hostID":@"3",@"image":@"http://image3"}]}];
//        return [DataRealm createOrUpdateInRealm:realm withJSONArray:@[]];
    } completion:^(XMRealmStoreManager *store, XMRealmOperation *operation, RLMRealm *realm) {
//        事务完成后回调
    }];
}

//删
-(void)delete{
    
    [[DataRealm realmManager]deleteObjectsWithObjectsBlock:^id(XMRealmOperation *operation, RLMRealm *realm) {
//        可以根据sql 语句查找删除
        return [DataRealm objectsWhere:@""];
//        也可以根据主键获得
        return [DataRealm objectForPrimaryKey:@"1"];
    } completion:^(XMRealmStoreManager *store, XMRealmOperation *operation, RLMRealm *realm) {
//        事务完成回调
    }];
}

//查
-(void)search
{
    [[DataRealm realmManager] fetchObjectsWithObjectsBlock:^id(XMRealmOperation *operation, RLMRealm *realm) {
        //        可以根据sql 语句查找删除
        return [DataRealm objectsWhere:@""];
        //        也可以根据主键获得
        return [DataRealm objectForPrimaryKey:@"1"];
        
    } completion:^(XMRealmStoreManager *store, XMRealmOperation *operation, RLMRealm *realm, RLMResults *results, NSString *primaryKey, NSMutableArray *models) {
//        事务完成回调 获得查询内容更新UI
    }];
}

@end
