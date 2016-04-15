//
//  TabBarViewController.m
//  YDD
//
//  Created by shenliping on 15/12/28.
//  Copyright © 2015年 shenliping. All rights reserved.
//

#import "TabBarViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _viewController = [[ViewController alloc] init];
    _viewController.title = @"订单记录";
    _viewController.view.backgroundColor = RGBCOLOR(230, 230, 230);
    
    UINavigationController *orderNav = [[UINavigationController alloc] initWithRootViewController:_viewController];
    orderNav.navigationBar.tintColor = [UIColor whiteColor];
    orderNav.navigationBar.translucent = YES;
    orderNav.navigationBar.barTintColor = RGBCOLOR(31.0f, 193.0f, 143.0f);
    [orderNav.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
//    _orderVc = [[OrderViewController alloc] init];
//    _orderVc.title = @"新订单";
//    _orderVc.view.backgroundColor = [UIColor whiteColor];
//    
//    UINavigationController *newOrderNav = [[UINavigationController alloc] initWithRootViewController:_orderVc];
//    newOrderNav.navigationBar.tintColor = [UIColor whiteColor];
//    newOrderNav.navigationBar.translucent = YES;
//    newOrderNav.navigationBar.barTintColor = RGBCOLOR(31.0f, 193.0f, 143.0f);
//    [newOrderNav.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];

    
    _userViewController = [[UserViewController alloc] init];
    _userViewController.view.backgroundColor = [UIColor whiteColor];
    _userViewController.title = @"我的";
    
    UINavigationController *userNav = [[UINavigationController alloc] initWithRootViewController:_userViewController];
    userNav.navigationBar.tintColor = [UIColor whiteColor];
    userNav.navigationBar.translucent = YES;
    userNav.navigationBar.barTintColor = RGBCOLOR(31.0f, 193.0f, 143.0f);
    [userNav.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];

    
    NSArray *array = @[orderNav, userNav];
    
    self.viewControllers = array;
    
    _tab = self.tabBar;
    _tab.tintColor = [UIColor colorWithRed:0.0f/255.0f green:157.0f/255.0f blue:133.0f/255.0f alpha:1];
    
    UIImage *unselectedindexImg = [UIImage imageNamed:@"tab_order_normal"];
    UIImage *selectedIndexImg = [UIImage imageNamed:@"tab_order_select"];
    UITabBarItem *item1 = [_tab.items objectAtIndex:0];
    item1.tag = 0;
    item1.selectedImage = [selectedIndexImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [item1 setImage:[unselectedindexImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
//    UIImage *unselectedSortImg = [UIImage imageNamed:@"2"];
//    UIImage *selectedSortImg =[UIImage imageNamed:@"2-2"];
//    UITabBarItem *item2 = [_tab.items objectAtIndex:1];
//    item2.tag = 1;
//    item2.selectedImage = [selectedSortImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    [item2 setImage:[unselectedSortImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    
    UIImage *unselectedGoodsImg = [UIImage imageNamed:@"tab_person_normal"];
    UIImage *selectedGoodsImg = [UIImage imageNamed:@"tab_person_select"];
    UITabBarItem *item3 = [_tab.items objectAtIndex:1];
    item3.tag = 1;
    item3.selectedImage = [selectedGoodsImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [item3 setImage:[unselectedGoodsImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];


    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    addButton.frame = CGRectMake(WIDTH / 2 - 25.0f,0, 50.0f, 50.0f);
    addButton.backgroundColor = [UIColor clearColor];
    [addButton setImage:[UIImage imageNamed:@"未标题-1"] forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(addGoodsVc) forControlEvents:UIControlEventTouchUpInside];
    [self.tab addSubview:addButton];
}

- (void)addGoodsVc
{
    OrderViewController *orderVcs = [[OrderViewController alloc] init];
    orderVcs.title = @"创建订单";
    orderVcs.view.backgroundColor = [UIColor whiteColor];
    orderVcs.hidesBottomBarWhenPushed = YES;
    
    [self.selectedViewController pushViewController:orderVcs animated:YES];
}

+ (TabBarViewController *)shareTabbar
{
    static TabBarViewController *tabbarVc = nil;
    if (tabbarVc == nil)
    {
        tabbarVc = [[TabBarViewController alloc] init];
    }
    
    return tabbarVc;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
