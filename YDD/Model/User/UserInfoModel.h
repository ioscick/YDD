//
//  UserInfoModel.h
//  YDD
//
//  Created by shenliping on 16/1/6.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfoModel : NSObject

@property (strong, nonatomic) NSString *no;

@property (strong, nonatomic) NSString *name;

@property (strong, nonatomic) NSString *phone;

@property (strong, nonatomic) NSString *telePhone;

@property (strong, nonatomic) NSString *company;

@property (strong, nonatomic) NSString *address;

@property (strong, nonatomic) NSString *joinData;

@property (strong, nonatomic) NSString *experyData;

@property (strong, nonatomic) NSString *status;

@property (strong, nonatomic) NSString *comment;

@property (strong, nonatomic) NSString *token;

- (void)pickUp:(NSDictionary *)dict;

@end
