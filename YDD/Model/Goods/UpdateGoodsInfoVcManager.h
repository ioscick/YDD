//
//  UpdateGoodsInfoVcManager.h
//  YDD
//
//  Created by shenliping on 16/1/7.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UpdateGoodsInfoVcManager : NSObject

+ (void)postJSONWithUrl:(NSString *)aUrl Token:(NSString *)token OrderId:(NSString *)orderId unitPrice:(NSString *)price MemberId:(NSString *)memberId Model:(NSString *)model picUrl:(NSString *)url thumbnail:(NSString *)thumb Qantity:(NSString *)quantity packingQuantity:(NSString *)paking containerQuantity:(NSString *)container Volume:(NSString *)volume totalVolume:(NSString *)totalV Name:(NSString *)name Comment:(NSString *)comment success:(void (^)(id json))success fail:(void (^)())fail;

@end
