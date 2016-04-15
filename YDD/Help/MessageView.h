//
//  MessageView.h
//  YDD
//
//  Created by shenliping on 16/1/6.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageView : UIView

@property (strong, nonatomic) UILabel *messageLabel;

- (instancetype)initWithFrame:(CGRect)frame Title:(NSString *)title;

@end
