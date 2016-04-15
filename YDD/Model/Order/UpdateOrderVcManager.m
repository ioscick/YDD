//
//  UpdateOrderVcManager.m
//  YDD
//
//  Created by shenliping on 16/1/6.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import "UpdateOrderVcManager.h"
#import "AFNetworking.h"

@implementation UpdateOrderVcManager

+ (void)postJSONWithUrl:(NSString *)aUrl Orderid:(NSString *)orderid OrderName:(NSString *)name Client:(NSString *)client Contacts:(NSString *)contacts Editor:(NSString *)userid Status:(NSString *)status Comment:(NSString *)comment Token:(NSString *)token success:(void (^)(id))success fail:(void (^)())fail
{
    //组织data
    NSArray *dataArry1 = [NSArray arrayWithObjects:@"id", @"token", @"name", @"client", @"contacts", @"editor", @"status", @"comment", nil];
    NSArray *dataArry2 = [NSArray arrayWithObjects:orderid, token, name, client, contacts, userid, status, comment, nil];
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
