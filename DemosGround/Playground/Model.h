//
//  Model.h
//  realmDemo
//
//  Created by apple on 16/3/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "BasicModel.h"
RLM_ARRAY_TYPE(ImageRealm) // 定义一个 RLMArray<Dog> 类型
@interface DataRealm : BasicRealm

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) RLMArray <ImageRealm> * image_url;

@end

@interface ImageRealm : BasicRealm

@property (nonatomic, copy) NSString *image;

@end

@class ImageModel;
@interface DataModel : BasicModel
/**
 *  图片的链接集合
 */
@property (nonatomic, strong) NSArray<ImageModel *> * image_url;

@property (nonatomic, copy) NSString * title;
@end

@interface ImageModel : NSObject

@property (nonatomic, copy) NSString *image;


@end
