//
//  ChangeInfoVcMnager.h
//  YDD
//
//  Created by shenliping on 16/1/6.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChangeInfoVcMnager : NSObject

+ (void)postJSONWithUrl:(NSString *)aUrl Name:(NSString *)name Telephone:(NSString *)telephone Company:(NSString *)company Address:(NSString *)address Comment:(NSString *)comment Token:(NSString *)token Userid:(NSString *)userid success:(void (^)(id json))success fail:(void (^)())fail;

@end
