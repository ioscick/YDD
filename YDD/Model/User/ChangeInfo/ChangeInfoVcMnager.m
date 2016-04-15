//
//  ChangeInfoVcMnager.m
//  YDD
//
//  Created by shenliping on 16/1/6.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import "ChangeInfoVcMnager.h"
#import "AFNetworking.h"

@implementation ChangeInfoVcMnager

+ (void)postJSONWithUrl:(NSString *)aUrl Name:(NSString *)name Telephone:(NSString *)telephone Company:(NSString *)company Address:(NSString *)address Comment:(NSString *)comment Token:(NSString *)token Userid:(NSString *)userid success:(void (^)(id))success fail:(void (^)())fail
{
    //组织data
    NSArray *dataArry1 = [NSArray arrayWithObjects:@"id", @"token", @"name", @"telephone", @"company", @"address", @"comment", nil];
    NSArray *dataArry2 = [NSArray arrayWithObjects:userid, token, name, telephone, company, address, comment, nil];
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
