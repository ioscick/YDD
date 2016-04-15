//
//  SearchViewController.m
//  YDD
//
//  Created by shenliping on 16/1/3.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchView.h"

@interface SearchViewController ()
{
    BOOL isAppeared;
}
@property (strong, nonatomic) SearchView *menuView;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *searchButton1 = [UIButton buttonWithType:UIButtonTypeSystem];
    searchButton1.frame = CGRectMake(0.0f, 0.0f, 30.0f, 30.0f);
    [searchButton1 setTitle:@"搜索" forState:UIControlStateNormal];
    [searchButton1 addTarget:self action:@selector(searchTime) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *searchButton = [[UIBarButtonItem alloc] initWithCustomView:searchButton1];
    self.navigationItem.rightBarButtonItem = searchButton;
    
    [self searchTime];
    // Do any additional setup after loading the view.
}

- (void)searchTime
{
    UIView *view = [[UIView alloc] initWithFrame:self.view.bounds];
    view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
//    view.alpha = 0.5;
    [self.navigationController.view addSubview:view];
    
    if (_menuView == nil)
    {
        _menuView = [[SearchView alloc] initWithFrame:CGRectMake(WIDTH - 20, 56,0, 0)];
//        [_menuView viewBuild];
//        _menuView.userInteractionEnabled = NO;
        [view addSubview:_menuView];
    }
    
    [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0 options:UIViewAnimationOptionTransitionCurlUp animations:^{
        _menuView.frame = CGRectMake(20.0f, 56.0f,WIDTH - 40, 240.0f);
        
    } completion:^(BOOL finished) {
        [_menuView tableviewAppear];
    }];
//    [UIView animateWithDuration:0.5 animations:^{
//        
//        _menuView.frame = CGRectMake(20.0f, 56.0f,WIDTH - 40, 240.0f);
//        
//    } completion:^(BOOL finished) {
//        
//    }];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewDissappeared:)];
    [view addGestureRecognizer:tap];

}

- (void)viewDissappeared:(UITapGestureRecognizer *)tap
{
    UIView *view =(UIView *)tap.view;
    [view removeFromSuperview];
    _menuView = nil;
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
