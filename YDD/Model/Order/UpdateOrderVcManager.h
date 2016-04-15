//
//  UpdateOrderVcManager.h
//  YDD
//
//  Created by shenliping on 16/1/6.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UpdateOrderVcManager : NSObject

+ (void)postJSONWithUrl:(NSString *)aUrl Orderid:(NSString *)orderid OrderName:(NSString *)name Client:(NSString *)client Contacts:(NSString *)contacts Editor:(NSString *)editor Status:(NSString *)status Comment:(NSString *)comment Token:(NSString *)token success:(void (^)(id json))success fail:(void (^)())fail;

@end
