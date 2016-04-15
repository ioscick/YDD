//
//  ChangeNameViewController.m
//  YDD
//
//  Created by shenliping on 16/1/4.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import "ChangeNameViewController.h"
#import "ChangeInfoVcMnager.h"

@interface ChangeNameViewController ()<UITextFieldDelegate>

@property (strong, nonatomic) UITextField *changeTextfield;


@end

@implementation ChangeNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _changeTextfield = [[UITextField alloc] initWithFrame:CGRectMake(20.0f, 80.0f, WIDTH- 40.0f, 30.0f)];
    _changeTextfield.delegate = self;
//    _changeTextfield.placeholder = @"原密码";
    _changeTextfield.returnKeyType = UIReturnKeyDone;
    _changeTextfield.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_changeTextfield];

    UIButton *searchButton1 = [UIButton buttonWithType:UIButtonTypeSystem];
    searchButton1.frame = CGRectMake(0.0f, 0.0f, 30.0f, 30.0f);
    [searchButton1 setTitle:@"保存" forState:UIControlStateNormal];
    [searchButton1 addTarget:self action:@selector(saveItem) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *searchButton = [[UIBarButtonItem alloc] initWithCustomView:searchButton1];
    self.navigationItem.rightBarButtonItem = searchButton;
    // Do any additional setup after loading the view.
}

- (void)saveItem
{
    NSString *change;
    
    if (_changeTextfield.text.length)
    {
        change = _changeTextfield.text;
    }
    
    if ([self.title isEqualToString:@"修改姓名"])
    {
        [ChangeInfoVcMnager postJSONWithUrl:@"http://115.236.19.70:16180/user/update" Name:change Telephone:@"" Company:@"" Address:@"" Comment:@"" Token:@"" Userid:@"" success:^(id json) {
            
        } fail:^{
            
        }];
    }
    else if ([self.title isEqualToString:@"修改电话号码"])
    {
        [ChangeInfoVcMnager postJSONWithUrl:@"http://115.236.19.70:16180/user/update" Name:@"" Telephone:change Company:@"" Address:@"" Comment:@"" Token:@"" Userid:@"" success:^(id json) {
            
        } fail:^{
            
        }];
    }
    else if ([self.title isEqualToString:@"修改公司名称"])
    {
        [ChangeInfoVcMnager postJSONWithUrl:@"http://115.236.19.70:16180/user/update" Name:@"" Telephone:@"" Company:change Address:@"" Comment:@"" Token:@"5EUkLlCJDDje0cL%2Bd43%2Fsw%3D%3D" Userid:@"1" success:^(id json) {
            
        } fail:^{
            
        }];
    }
    else if ([self.title isEqualToString:@"修改公司地址"])
    {
        [ChangeInfoVcMnager postJSONWithUrl:@"http://115.236.19.70:16180/user/update" Name:@"" Telephone:@"" Company:@"" Address:change Comment:@"" Token:@"" Userid:@"" success:^(id json) {
            
        } fail:^{
            
        }];
    }
    else if ([self.title isEqualToString:@"备注"])
    {
        [ChangeInfoVcMnager postJSONWithUrl:@"http://115.236.19.70:16180/user/update" Name:change Telephone:@"" Company:@"" Address:@"" Comment:change Token:@"" Userid:@"" success:^(id json) {
            
        } fail:^{
            
        }];
    }
}

- (void)changeName:(NSString *)name
{
    _changeTextfield.text = name;
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
