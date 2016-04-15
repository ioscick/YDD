//
//  UserInfoViewController.m
//  YDD
//
//  Created by shenliping on 16/1/3.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import "UserInfoViewController.h"
#import "ChangePasswordViewController.h"
#import "ChangeNameViewController.h"
#import "UserInfoModel.h"
#import "UserInfoVcManager.h"

@interface UserInfoViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation UserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     [self getUserInfo];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [[UIView alloc] init];
    
    [self.view addSubview:_tableView];
    // Do any additional setup after loading the view.
}

- (void)getUserInfo
{
    [UserInfoVcManager postJSONWithUrl:@"http://115.236.19.70:16180/user/me" Userid:@"1" Token:@"5EUkLlCJDDhdAbCZoml7Lg%3D%3D" success:^(id json) {
        
        
    } fail:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1.0f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 6;
    }
    else if (section == 1)
    {
        return 1;
    }
    else
    {
        return 2;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"CELL"];
    }
    cell.textLabel.font = [UIFont systemFontOfSize:15.0f];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:15.0f];
    if (indexPath.section == 0)
    {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        if (indexPath.row == 0)
        {
            cell.textLabel.text = @"姓名";
            cell.detailTextLabel.text = @"啦啦啦";
        }
        else if (indexPath.row == 1)
        {
            cell.textLabel.text = @"手机号码";
            cell.detailTextLabel.text = @"1xxxxxxxx";
        }
        else if (indexPath.row == 2)
        {
            cell.textLabel.text = @"电话号码";
            cell.detailTextLabel.text = @"1xxxxxxxx";
        }
        else if (indexPath.row == 3)
        {
            cell.textLabel.text = @"公司名称";
            cell.detailTextLabel.text = @"1xxxxxxxx";
        }
        else if (indexPath.row == 4)
        {
            cell.textLabel.text = @"公司地址";
            cell.detailTextLabel.text = @"1xxxxxxxx";
        }
        else if (indexPath.row == 5)
        {
            cell.textLabel.text = @"电话号码";
            cell.detailTextLabel.text = @"1xxxxxxxx";
        }
        else if (indexPath.row == 6)
        {
            cell.textLabel.text = @"备注";
            cell.detailTextLabel.text = @"未填写";
        }
    }
    else if (indexPath.section == 1)
    {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        if (indexPath.row == 0)
        {
            cell.textLabel.text = @"修改密码";
//            cell.detailTextLabel.text = @"啦啦啦";
        }

    }
    else
    {
        if (indexPath.row == 0)
        {
            cell.textLabel.text = @"注册时间";
            cell.detailTextLabel.text = @"啦啦啦";
        }
        else if (indexPath.row == 1)
        {
            cell.textLabel.text = @"过期时间";
            cell.detailTextLabel.text = @"1xxxxxxxx";
        }

    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1)
    {
        ChangePasswordViewController *changeVc = [[ChangePasswordViewController alloc] init];
        changeVc.view.backgroundColor = [UIColor whiteColor];
        changeVc.title = @"修改密码";
        [self.navigationController pushViewController:changeVc animated:YES];
    }
    else if (indexPath.section == 0)
    {
        if (indexPath.row == 1)
        {
            return;
        }
        
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        NSString *title = [NSString stringWithFormat:@"修改%@", cell.textLabel.text];
        
        ChangeNameViewController *changeNameVc = [[ChangeNameViewController alloc] init];
        changeNameVc.title = title;
        changeNameVc.view.backgroundColor = [UIColor whiteColor];
        [changeNameVc changeName:cell.detailTextLabel.text];
        
        [self.navigationController pushViewController:changeNameVc animated:YES];        
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
