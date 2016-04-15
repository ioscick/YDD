//
//  DeleteOrderVcManager.h
//  YDD
//
//  Created by shenliping on 16/1/6.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeleteOrderVcManager : NSObject

+ (void)postJSONWithUrl:(NSString *)aUrl Userid:(NSString *)userid Token:(NSString *)token OrderId:(NSString *)orderid success:(void (^)(id json))success fail:(void (^)())fail;

@end
