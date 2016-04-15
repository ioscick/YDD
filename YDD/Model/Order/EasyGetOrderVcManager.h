//
//  EasyGetOrderVcManager.h
//  YDD
//
//  Created by shenliping on 16/1/6.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EasyGetOrderVcManager : NSObject

+ (void)postJSONWithUrl:(NSString *)aUrl Userid:(NSString *)userid Token:(NSString *)token Page_size:(NSString *)size Page_number:(NSString *)number Sort:(NSString *)sort success:(void (^)(id json))success fail:(void (^)())fail;

@end
