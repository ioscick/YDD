//
//  LoginVcManager.h
//  YDD
//
//  Created by shenliping on 16/1/6.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginVcManager : NSObject

+ (void)postJSONWithUrl:(NSString *)aUrl Userid:(NSString *)userid UserPassword:(NSString *)password success:(void (^)(id json))success fail:(void (^)())fail;

@end
