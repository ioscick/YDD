//
//  GoodsIdSearchVcManager.h
//  YDD
//
//  Created by shenliping on 16/1/7.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodsIdSearchVcManager : NSObject

+ (void)postJSONWithUrl:(NSString *)aUrl Userid:(NSString *)userid Token:(NSString *)token GoodsId:(NSString *)goodsId success:(void (^)(id json))success fail:(void (^)())fail;

@end
