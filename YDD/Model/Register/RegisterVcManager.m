//
//  RegisterVcManager.m
//  YDD
//
//  Created by shenliping on 16/1/7.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import "RegisterVcManager.h"
#import "AFNetworking.h"

@implementation RegisterVcManager

+ (void)postJSONWithUrl:(NSString *)aUrl Userid:(NSString *)userid telephone:(NSString *)tel Name:(NSString *)name Password:(NSString *)password Company:(NSString *)company address:(NSString *)add comment:(NSString *)com success:(void (^)(id))success fail:(void (^)())fail
{
    //组织data
    NSArray *dataArry1 = [NSArray arrayWithObjects:@"no", @"telephone", @"name", @"password", @"company", @"address", @"comment", nil];
    NSArray *dataArry2 = [NSArray arrayWithObjects:userid, tel, name, password, company, add, com, nil];
    NSDictionary *dataDict = [[NSDictionary alloc] initWithObjects:dataArry2 forKeys:dataArry1];
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    [manager.requestSerializer setTimeoutInterval:10];
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    [manager POST:aUrl parameters:dataDict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@",responseObject);
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        fail();
    }];
}
@end
