//
//  LoadViewController.m
//  YDD
//
//  Created by shenliping on 15/12/29.
//  Copyright © 2015年 shenliping. All rights reserved.
//

#import "LoadViewController.h"
#import "PhoneLoadViewController.h"
#import "FindPasswordViewController.h"
#import "LoginVcManager.h"
#import "MessageView.h"
#import "PhoneRegisterViewController.h"

@interface LoadViewController ()<UITextFieldDelegate>

@property (strong, nonatomic) UITextField *loginTextfield;
@property (strong, nonatomic) UITextField *passwordTextfield;


@end

@implementation LoadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBCOLOR(31.0f, 193.0f, 143.0f);
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 64.0f, WIDTH, HIGHT / 3 - 100.0f)];
    imgView.image = [UIImage imageNamed:@"1@2x"];
    [self.view addSubview:imgView];
    
    self.loginTextfield = [[UITextField alloc] initWithFrame:CGRectMake(20.0f, HIGHT / 3, WIDTH - 40.0f, 40.0f)];
    self.loginTextfield.returnKeyType = UIReturnKeyDone;
    self.loginTextfield.placeholder = @"点击输入";
    self.loginTextfield.delegate = self;
    self.loginTextfield.backgroundColor = [UIColor whiteColor];
    self.loginTextfield.leftViewMode = UITextFieldViewModeAlways;
    
    
    UILabel *lable1 = [[UILabel alloc] initWithFrame:CGRectMake(20.0f, 10.0f, 60.0f, 20.0f)];
    lable1.text = @"用户名";
    lable1.textAlignment = NSTextAlignmentRight;
    self.loginTextfield.leftView = lable1;
    
    [self.view addSubview:self.loginTextfield];
    
    
    self.passwordTextfield = [[UITextField alloc] initWithFrame:CGRectMake(20.0f, self.loginTextfield.frame.origin.y + _loginTextfield.frame.size.height +5.0f, WIDTH - 40.0f, 40.0f)];
    self.passwordTextfield.returnKeyType = UIReturnKeyDone;
    self.passwordTextfield.placeholder = @"点击输入";
    self.passwordTextfield.delegate = self;
    self.passwordTextfield.secureTextEntry = YES;
    self.passwordTextfield.backgroundColor = [UIColor whiteColor];
    self.passwordTextfield.leftViewMode = UITextFieldViewModeAlways;
    
    
    UILabel *lable2 = [[UILabel alloc] initWithFrame:CGRectMake(20.0f, 10.0f, 60.0f, 20.0f)];
    lable2.text = @"密 码";
    lable2.textAlignment = NSTextAlignmentRight;
    self.passwordTextfield.leftView = lable2;
    
    [self.view addSubview:self.passwordTextfield];
    
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeSystem];
    loginButton.frame = CGRectMake(40.0f, _passwordTextfield.frame.size.height + _passwordTextfield.frame.origin.y +50.0f, WIDTH - 80.0f, 40.0f);
    loginButton.backgroundColor = [UIColor orangeColor];
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(loginItem) forControlEvents:UIControlEventTouchUpInside];
    [loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [self.view addSubview:loginButton];
    
    
    UIButton *zuceButton = [UIButton buttonWithType:UIButtonTypeSystem];
    zuceButton.frame = CGRectMake(WIDTH / 2 - 50.0f, loginButton.frame.origin.y + loginButton.frame.size.height + 20.0f, 100.0f, 20.0f);
    [zuceButton setTitle:@"快速注册" forState:UIControlStateNormal];
    [zuceButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [zuceButton.titleLabel setFont:[UIFont systemFontOfSize:14.0f]];
    [zuceButton addTarget:self action:@selector(registerItems) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:zuceButton];
    
    UIButton *findButton = [UIButton buttonWithType:UIButtonTypeSystem];
    findButton.frame = CGRectMake(20.0f, HIGHT - 40.0f, 60.0f, 20.0f);
    [findButton setTitle:@"找回密码" forState:UIControlStateNormal];
    [findButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [findButton.titleLabel setFont:[UIFont systemFontOfSize:14.0f]];
    [findButton addTarget:self action:@selector(findMessage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:findButton];

    UIButton *phoneLogin = [UIButton buttonWithType:UIButtonTypeSystem];
    phoneLogin.frame = CGRectMake(WIDTH - 120.0f, HIGHT - 40.0f, 100.0f, 20.0f);
    [phoneLogin setTitle:@"手机登陆验证" forState:UIControlStateNormal];
    [phoneLogin setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [phoneLogin.titleLabel setFont:[UIFont systemFontOfSize:14.0f]];
    [phoneLogin addTarget:self action:@selector(phoneLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:phoneLogin];
    // Do any additional setup after loading the view.
}

- (void)registerItems
{
    PhoneRegisterViewController *registerVc = [[PhoneRegisterViewController alloc] init];
    registerVc.title = @"手机注册";
    
    [self.navigationController pushViewController:registerVc animated:YES];
}

- (void)loginItem
{
    if (_loginTextfield.text.length == 0)
    {
        MessageView *messageView = [[MessageView alloc] initWithFrame:CGRectMake(WIDTH / 2 - 100, HIGHT / 2 - 30, 200, 60) Title:@"账号不能为空"];
        [self.view addSubview:messageView];
    }
    
    if (_passwordTextfield.text.length == 0)
    {
        MessageView *messageView = [[MessageView alloc] initWithFrame:CGRectMake(WIDTH / 2 - 100, HIGHT / 2 - 30, 200, 60) Title:@"密码不能为空"];
        [self.view addSubview:messageView];
    }
    
    
    [LoginVcManager postJSONWithUrl:@"http://www.txlinbang.com/index.php?act=members&op=getSecCode" Userid:_loginTextfield.text UserPassword:_passwordTextfield.text success:^(id json) {
        int resultCode = [[json objectForKey:@"resultCode"] intValue];
        
        if (resultCode == 1)
        {
            MessageView *messageView = [[MessageView alloc] initWithFrame:CGRectMake(WIDTH / 2 - 100, HIGHT / 2 - 30, 200, 60) Title:@"登录成功"];
            [self.view addSubview:messageView];
            
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
        else if (resultCode == 2)
        {
            MessageView *messageView = [[MessageView alloc] initWithFrame:CGRectMake(WIDTH / 2 - 100, HIGHT / 2 - 30, 200, 60) Title:@"登录失败"];
            [self.view addSubview:messageView];
        }
        else if (resultCode == 3)
        {
            MessageView *messageView = [[MessageView alloc] initWithFrame:CGRectMake(WIDTH / 2 - 100, HIGHT / 2 - 30, 200, 60) Title:@"用户不存在"];
            [self.view addSubview:messageView];
        }
        else if (resultCode == 4)
        {
            MessageView *messageView = [[MessageView alloc] initWithFrame:CGRectMake(WIDTH / 2 - 100, HIGHT / 2 - 30, 200, 60) Title:@"用户需要续费"];
            [self.view addSubview:messageView];
        }
        else if (resultCode == 5)
        {
            MessageView *messageView = [[MessageView alloc] initWithFrame:CGRectMake(WIDTH / 2 - 100, HIGHT / 2 - 30, 200, 60) Title:@"用户被锁定"];
            [self.view addSubview:messageView];
        }
        
        
    } fail:^{
        MessageView *messageView = [[MessageView alloc] initWithFrame:CGRectMake(WIDTH / 2 - 100, HIGHT / 2 - 30, 200, 60) Title:@"服务器连接失败"];
        [self.view addSubview:messageView];
    }];
}

- (void)findMessage
{
    FindPasswordViewController *findVc = [FindPasswordViewController new];
    findVc.title = @"找回密码";
    [self.navigationController pushViewController:findVc animated:YES];
}

- (void)phoneLogin
{
    PhoneLoadViewController *phoneLoadViewC = [[PhoneLoadViewController alloc] init];
    phoneLoadViewC.title = @"短信验证登陆";
    
    [self.navigationController pushViewController:phoneLoadViewC animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
//    self.navigationController.navigationBarHidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
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
