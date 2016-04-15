//
//  AddGoodsInfoVcManager.h
//  YDD
//
//  Created by shenliping on 16/1/6.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddGoodsInfoVcManager : NSObject

+ (void)postJSONWithUrl:(NSString *)aUrl Userid:(NSString *)userid Token:(NSString *)token GoodsName:(NSString *)name orderclient:(NSString *)client ordercontacts:(NSString *)contacts OrderId:(NSString *)orderId unitPrice:(NSString *)price MemberId:(NSString *)memberId success:(void (^)(id json))success fail:(void (^)())fail;

@end
