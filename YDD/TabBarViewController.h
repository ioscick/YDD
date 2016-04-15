//
//  TabBarViewController.h
//  YDD
//
//  Created by shenliping on 15/12/28.
//  Copyright © 2015年 shenliping. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "OrderViewController.h"
#import "UserViewController.h"

@interface TabBarViewController : UITabBarController

@property (strong, nonatomic) ViewController *viewController;
@property (strong, nonatomic) OrderViewController *orderVc;
@property (strong, nonatomic) UserViewController *userViewController;

@property (strong, nonatomic) UITabBar *tab;

+ (TabBarViewController *)shareTabbar;

@end
