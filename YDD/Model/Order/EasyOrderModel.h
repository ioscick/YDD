//
//  EasyOrderModel.h
//  YDD
//
//  Created by shenliping on 16/1/6.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EasyOrderModel : NSObject

@property (strong, nonatomic) NSString *client;

@property (strong, nonatomic) NSString *contacts;

@property (strong, nonatomic) NSString *detailcnt;

@property (strong, nonatomic) NSString *editTime;

@property (strong, nonatomic) NSString *editor;

@property (strong, nonatomic) NSString *editorNo;

@property (strong, nonatomic) NSString *orderId;

@property (strong, nonatomic) NSString *orderNo;

@property (strong, nonatomic) NSString *statusId;

@property (strong, nonatomic) NSString *totalCtq;

@property (strong, nonatomic) NSString *totalPrice;

@property (strong, nonatomic) NSString *totalVolume;

- (void)pickUp:(NSDictionary *)dict;

@end
