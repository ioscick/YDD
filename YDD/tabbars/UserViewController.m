//
//  UserViewController.m
//  YDD
//
//  Created by shenliping on 15/12/28.
//  Copyright © 2015年 shenliping. All rights reserved.
//

#import "UserViewController.h"
#import "UserInfoViewController.h"
#import "LoadViewController.h"


@interface UserViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) UserInfoViewController *userInfoVc;

@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [[UIView alloc] init];
    
    [self.view addSubview:_tableView];
    
    UIButton *searchButton1 = [UIButton buttonWithType:UIButtonTypeSystem];
    searchButton1.frame = CGRectMake(0.0f, 0.0f, 80.0f, 20.0f);
    [searchButton1 setTitle:@"切换账号" forState:UIControlStateNormal];
    searchButton1.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    [searchButton1 addTarget:self action:@selector(searchTime) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *searchButton = [[UIBarButtonItem alloc] initWithCustomView:searchButton1];
    self.navigationItem.rightBarButtonItem = searchButton;
    // Do any additional setup after loading the view.
}

- (void)searchTime
{
    LoadViewController *loadViewController = [[LoadViewController alloc] init];
    loadViewController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:loadViewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return 60.0f;
    }
    else
    {
        return 44.0f;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 1;
    }
    else if (section == 1)
    {
        return 2;
    }
    else if (section == 2)
    {
        return 2;
    }
    else
    {
        return 1;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"CELL"];
    }
    cell.textLabel.font = [UIFont systemFontOfSize:13.0f];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:12.0f];
    cell.imageView.frame = CGRectMake(10.0f, 12.0f, 20.0f, 20.0f);
    
    
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 130.0f, 12.0f, 120.0f, 20.0f)];
    [button setTitle:@"400-123-123-12" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:15.0f]];
    
    
    if (indexPath.section == 0)
    {
        cell.textLabel.text = @"1375826xxxxx";
        cell.detailTextLabel.text = @"啦啦啦";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//        switch (indexPath.row)
//        {
//            case 0:
//                cell.textLabel.text = @"我的账号";
//                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//                break;
//            case 1:
//                cell.textLabel.text = @"续费充值";
//                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//                break;
//            case 2:
//                cell.textLabel.text = @"热线服务";
//                [cell addSubview:button];
//                break;
//             case 3:
//                cell.textLabel.text = @"更新监测";
//                break;
//            case 4:
//                cell.textLabel.text = @"意见于建议";
//                break;
//            case 5:
//                cell.textLabel.text = @"推荐给好友";
//                break;
//            default:
//                break;
//        }
    }
    else if (indexPath.section == 1)
    {
        if (indexPath.row == 0)
        {
            cell.textLabel.text = @"我的账单";
            cell.detailTextLabel.text = @"查看";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        else
        {
            cell.textLabel.text = @"续费充值";
            cell.detailTextLabel.text = @"前往充值";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }
    else if (indexPath.section == 2)
    {
        if (indexPath.row == 0)
        {
            cell.textLabel.text = @"客服电话";
            cell.detailTextLabel.text = @"40012312312";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        else
        {
            cell.textLabel.text = @"推介分享";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }

    }
    else
    {
        cell.textLabel.text = @"关于易订购";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    if (indexPath.section == 0)
    {
        if (indexPath.row == 0)
        {
            if (_userInfoVc == nil)
            {
                _userInfoVc = [[UserInfoViewController alloc] init];
                _userInfoVc.title = @"个人信息";
            }
            _userInfoVc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:_userInfoVc animated:YES];
        }
    }
    else if (indexPath.section == 2)
    {
        if (indexPath.row == 0)
        {
            NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:40012312312"];
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];

        }
    }
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
