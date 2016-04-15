//
//  ViewController.m
//  YDD
//
//  Created by shenliping on 15/12/28.
//  Copyright © 2015年 shenliping. All rights reserved.
//

#import "ViewController.h"
#import "LoadViewController.h"
#import "SearchViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UISearchResultsUpdating>

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *dataArray;

@property (strong, nonatomic) UISearchController *searchController;

@property (strong, nonatomic) SearchViewController *searchVc;

@property (strong, nonatomic) UIButton *timeButton;

@property (strong, nonatomic) UIButton *moneyButton;

@property (strong, nonatomic) UILabel *noOrderLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0f, 44.0f, self.view.frame.size.width, self.view.frame.size.height - 44.0f - 49.0f) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [[UIView alloc] init];
    _tableView.backgroundColor = RGBCOLOR(230, 230, 230);
    
    [self.view addSubview:_tableView];

    [self headerView];
    
    UIButton *searchButton1 = [UIButton buttonWithType:UIButtonTypeSystem];
    searchButton1.frame = CGRectMake(0.0f, 0.0f, 30.0f, 30.0f);
    [searchButton1 setTitle:@"搜索" forState:UIControlStateNormal];
    [searchButton1 addTarget:self action:@selector(searchTime) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem *searchButton = [[UIBarButtonItem alloc] initWithCustomView:searchButton1];
    self.navigationItem.rightBarButtonItem = searchButton;
    
    [self noOrde];
    
//    _searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
//    _searchController.searchResultsUpdater = self;
//    _searchController.dimsBackgroundDuringPresentation = NO;
//    _searchController.searchBar.placeholder = @"关键字搜索";
//    [_searchController.searchBar sizeToFit];
//    _searchController.hidesNavigationBarDuringPresentation = YES;
//    self.tableView.tableHeaderView = _searchController.searchBar;
//    
//    self.definesPresentationContext = YES;

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)searchTime
{
    if (_searchVc == nil)
    {
        _searchVc = [[SearchViewController alloc] init];
        _searchVc.title = @"搜索";
    }
    _searchVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:_searchVc animated:YES];
}


- (void)headerView
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 64.0f, self.view.frame.size.width, 44.0f)];
    headerView.backgroundColor = [UIColor whiteColor];
//    _tableView.tableHeaderView = headerView;
    [self.view addSubview:headerView];
    
    _timeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _timeButton.backgroundColor = [UIColor whiteColor];
    _timeButton.selected = YES;
    _timeButton.frame = CGRectMake(WIDTH / 4 - 50.0f, 12.0f, 100.0f, 20.0f);
    [_timeButton setTitle:@"时间排序" forState:UIControlStateNormal];
    _timeButton.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [_timeButton setTitleColor:RGBCOLOR(31.0f, 193.0f, 143.0f) forState:UIControlStateSelected];
    [_timeButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_timeButton addTarget:self action:@selector(timeSort) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:_timeButton];
    
    
    _moneyButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _moneyButton.frame = CGRectMake(WIDTH / 4 + WIDTH / 2 - 50.0f, 12.0f, 120.0f, 20.0f);
    _moneyButton.backgroundColor = [UIColor whiteColor];
    [_moneyButton setTitle:@"金额排序" forState:UIControlStateNormal];
    _moneyButton.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [_moneyButton setTitleColor:RGBCOLOR(31.0f, 193.0f, 143.0f) forState:UIControlStateSelected];
    [_moneyButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_moneyButton addTarget:self action:@selector(moneySort) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:_moneyButton];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(WIDTH / 2 - 1, 12.0f, 1, 20.0f)];
    view.backgroundColor = RGBCOLOR(230.0f, 230.0f, 230.0f);
    [headerView addSubview:view];
}

- (void)timeSort
{
//    LoadViewController *loadVc = [LoadViewController new];
//    loadVc.view.backgroundColor = [UIColor whiteColor];
//    loadVc.hidesBottomBarWhenPushed = YES;
//    
//    [self.navigationController pushViewController:loadVc animated:YES];
    
    _moneyButton.selected = NO;
    _timeButton.selected = YES;
}

- (void)noOrde
{
    _noOrderLabel = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH / 2 - 100.0f, HIGHT / 2 , 200.0f, 20.0f)];
    _noOrderLabel.text = @"当前没有订单信息哦";
    _noOrderLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_noOrderLabel];
}

- (void)moneySort
{
    _timeButton.selected = NO;
    _moneyButton.selected = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    return cell;
}


#pragma make - searchdelegate
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    NSString *searchString = [self.searchController.searchBar text];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[cd] %@", searchString];

    
    [_tableView reloadData];
}


@end
