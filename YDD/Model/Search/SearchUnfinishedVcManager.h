//
//  SearchUnfinishedVcManager.h
//  YDD
//
//  Created by shenliping on 16/1/7.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchUnfinishedVcManager : NSObject

+ (void)postJSONWithUrl:(NSString *)aUrl ModelId:(NSString *)modelid success:(void (^)(id json))success fail:(void (^)())fail;

@end
