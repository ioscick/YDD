//
//  OrderModel.m
//  YDD
//
//  Created by shenliping on 16/1/6.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import "OrderModel.h"

@implementation OrderModel

- (void)pickUp:(NSDictionary *)dict
{
    _client = [dict objectForKey:@"client"];
    
    _contacts = [dict objectForKey:@"contacts"];
    
    _detailcnt = [dict objectForKey:@"detailcnt"];
    
    _editTime = [dict objectForKey:@"editTime"];
    
    _editor = [dict objectForKey:@"editorNo"];
    
    _editorNo = [dict objectForKey:@""];
    
    _orderId = [dict objectForKey:@"id"];
    
    _orderNo = [dict objectForKey:@"no"];
    
    _orderDetail = [dict objectForKey:@"orderDetail"];
}

@end
