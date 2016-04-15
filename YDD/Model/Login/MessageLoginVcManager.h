//
//  MessageLoginVcManager.h
//  YDD
//
//  Created by shenliping on 16/1/6.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageLoginVcManager : NSObject

+ (void)postJSONWithUrl:(NSString *)aUrl Phone:(NSString *)phone Code:(NSString *)code success:(void (^)(id json))success fail:(void (^)())fail;

@end
