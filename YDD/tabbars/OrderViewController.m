//
//  OrderViewController.m
//  YDD
//
//  Created by shenliping on 15/12/28.
//  Copyright © 2015年 shenliping. All rights reserved.
//

#import "OrderViewController.h"
#import "GoodsDetailViewController.h"

@interface OrderViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation OrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 70.0f, 60.0f, 44.0f)];
//    [label setFont:[UIFont systemFontOfSize:14.0f]];
//    label.backgroundColor = [UIColor grayColor];
//    
//    [self.view addSubview:label];
//    
//    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(label.frame.size.width +10, 0.0f, self.view.frame.size.width - label.frame.size.width, 44.0f)];
//    textField.borderStyle = UITextBorderStyleNone;
//    textField.returnKeyType = UIReturnKeyDone;
//    textField.delegate = self;
//    [self.view addSubview:textField];

    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [[UIView alloc] init];
    
    [self.view addSubview:_tableView];
    
    [self set_bootemButton];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)set_bootemButton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(30.0f, self.view.frame.size.height - 50.0f, self.view.frame.size.width - 60.0f, 40);
    [button setTitle:@"提交订单" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.backgroundColor = RGBCOLOR(31.0f, 193.0f, 143.0f);
    [self.view addSubview:button];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 0.0f, 60.0f, 44.0f)];
    [label setFont:[UIFont systemFontOfSize:14.0f]];
//    label.backgroundColor = [UIColor grayColor];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(label.frame.size.width +10, 0.0f, self.view.frame.size.width - label.frame.size.width, 44.0f)];
    textField.borderStyle = UITextBorderStyleNone;
    textField.returnKeyType = UIReturnKeyDone;
    textField.delegate = self;
    
    if (indexPath.row == 0)
    {
        label.text = @"客户名称";
        [cell addSubview:label];
        
        textField.placeholder = @"请输入客户名称";
        [cell addSubview:textField];
    }
    else if (indexPath.row == 1)
    {
        label.text = @"联系方式";
        [cell addSubview:label];
        
        textField.placeholder = @"请输入客户联系方式";
        [cell addSubview:textField];
    }
    else if (indexPath.row == 2)
    {
        label.text = @"备注";
        [cell addSubview:label];
        
        textField.placeholder = @"请输入订单备注";
        [cell addSubview:textField];
    }
    else
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame =  CGRectMake(30.0f, 7.0f, self.view.frame.size.width - 60.0f, 30.0f);
        [button setTitle:@"添加商品Add" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(addGoodsItem) forControlEvents:UIControlEventTouchUpInside];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor orangeColor];
        [cell addSubview:button];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark - textfiled delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
}

- (void)addGoodsItem
{
    GoodsDetailViewController *goodsDetailVc = [[GoodsDetailViewController alloc] init];
    goodsDetailVc.view.backgroundColor = [UIColor whiteColor];
    goodsDetailVc.title = @"添加商品";
    
    [self.navigationController pushViewController:goodsDetailVc animated:YES];
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
