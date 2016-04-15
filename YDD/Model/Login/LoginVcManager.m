//
//  LoginVcManager.m
//  YDD
//
//  Created by shenliping on 16/1/6.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import "LoginVcManager.h"
#import "AFNetworking.h"

@implementation LoginVcManager

+ (void)postJSONWithUrl:(NSString *)aUrl Userid:(NSString *)userid UserPassword:(NSString *)password success:(void (^)(id))success fail:(void (^)())fail
{
    //组织data
//    NSArray *dataArry1 = [NSArray arrayWithObjects:@"userno", @"userpassword", nil];
//    NSArray *dataArry2 = [NSArray arrayWithObjects:userid, password, nil];
//    NSDictionary *dataDict = [[NSDictionary alloc] initWithObjects:dataArry2 forKeys:dataArry1];
    NSArray *dataArry1 = [NSArray arrayWithObjects:@"tel", nil];
    NSArray *dataArry2 = [NSArray arrayWithObjects:@"13758263997", nil];
    NSDictionary *dataDict = [[NSDictionary alloc] initWithObjects:dataArry2 forKeys:dataArry1];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    [manager.requestSerializer setTimeoutInterval:10];
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
//    manager.requestSerializer = [AFURLRequestSerialization serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/x-javascript",nil];
    
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dataDict options:NSJSONWritingPrettyPrinted error:nil];
//    
//    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//    
//    NSDictionary *parameters =@{@"content":jsonString};
   

    [manager POST:aUrl parameters:dataDict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@",responseObject);
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        fail();
    }];
}
@end
