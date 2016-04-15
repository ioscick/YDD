//
//  UserInfoModel.m
//  YDD
//
//  Created by shenliping on 16/1/6.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import "UserInfoModel.h"

@implementation UserInfoModel

- (void)pickUp:(NSDictionary *)dict
{
    _no = [dict objectForKey:@"no"];
    
    _address = [dict objectForKey:@"address"];
    
    _telePhone = [dict objectForKey:@"telePhone"];
    
    _experyData = [dict objectForKey:@"experyData"];
    
    NSString *password = [dict objectForKey:@"password"];
    
    _joinData = [dict objectForKey:@"joinDate"];
    
    _phone = [dict objectForKey:@"phone"];
    
    _name = [dict objectForKey:@"name"];
    
    _company = [dict objectForKey:@"company"];
    
    _comment = [dict objectForKey:@"comment"];
    
    _status = [dict objectForKey:@"status"];
}

@end
