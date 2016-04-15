//
//  AddGoodsInfoVcManager.m
//  YDD
//
//  Created by shenliping on 16/1/6.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import "AddGoodsInfoVcManager.h"
#import "AFNetworking.h"

@implementation AddGoodsInfoVcManager

+ (void)postJSONWithUrl:(NSString *)aUrl Userid:(NSString *)userid Token:(NSString *)token GoodsName:(NSString *)name orderclient:(NSString *)client ordercontacts:(NSString *)contacts OrderId:(NSString *)orderId unitPrice:(NSString *)price MemberId:(NSString *)memberId success:(void (^)(id))success fail:(void (^)())fail
{
    //组织data
    NSArray *dataArry1 = [NSArray arrayWithObjects:@"orderId", @"token", @"orderclient", @"ordercontacts", @"unitPrice", @"memberId", @"name", nil];
    NSArray *dataArry2 = [NSArray arrayWithObjects:orderId, token, client, contacts, price, memberId, name, nil];
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
