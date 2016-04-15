//
//  RegisterVcManager.h
//  YDD
//
//  Created by shenliping on 16/1/7.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegisterVcManager : NSObject

+ (void)postJSONWithUrl:(NSString *)aUrl Userid:(NSString *)userid telephone:(NSString *)tel Name:(NSString *)name Password:(NSString *)password Company:(NSString *)company address:(NSString *)add comment:(NSString *)com success:(void (^)(id json))success fail:(void (^)())fail;

@end
