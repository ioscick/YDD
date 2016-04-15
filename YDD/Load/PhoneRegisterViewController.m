//
//  PhoneRegisterViewController.m
//  YDD
//
//  Created by shenliping on 16/1/6.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import "PhoneRegisterViewController.h"
#import <SMS_SDK/SMSSDK.h>
#import "MessageView.h"

@interface PhoneRegisterViewController ()<UITextFieldDelegate>

@property (strong, nonatomic) UITextField *loginTextfield;
@property (strong, nonatomic) UITextField *passwordTextfield;

@property (strong, nonatomic) UIButton *getYzmButton;

@end

@implementation PhoneRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = RGBCOLOR(240, 240, 240);
    
    self.loginTextfield = [[UITextField alloc] initWithFrame:CGRectMake(20.0f, 100.0f, WIDTH - 40.0f, 40.0f)];
    self.loginTextfield.returnKeyType = UIReturnKeyDone;
    self.loginTextfield.placeholder = @"点击输入";
    self.loginTextfield.delegate = self;
    self.loginTextfield.backgroundColor = [UIColor whiteColor];
    self.loginTextfield.leftViewMode = UITextFieldViewModeAlways;
    self.loginTextfield.rightViewMode = UITextFieldViewModeAlways;
    
    
    UILabel *lable1 = [[UILabel alloc] initWithFrame:CGRectMake(20.0f, 10.0f, 80.0f, 20.0f)];
    lable1.text = @"手机号码";
    lable1.font = [UIFont systemFontOfSize:16.0f];
    lable1.textAlignment = NSTextAlignmentRight;
    self.loginTextfield.leftView = lable1;
    
    _getYzmButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _getYzmButton.frame = CGRectMake(0.0f, 10.0f, 120.0f, 20.0f);
    [_getYzmButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_getYzmButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    [_getYzmButton.titleLabel setFont:[UIFont systemFontOfSize:14.0f]];
    _getYzmButton.titleLabel.textAlignment = NSTextAlignmentRight;
    [_getYzmButton addTarget:self action:@selector(daojishi) forControlEvents:UIControlEventTouchUpInside];
    self.loginTextfield.rightView = _getYzmButton;
    
    [self.view addSubview:self.loginTextfield];
    
    
    self.passwordTextfield = [[UITextField alloc] initWithFrame:CGRectMake(20.0f, self.loginTextfield.frame.origin.y + _loginTextfield.frame.size.height +5.0f, WIDTH - 40.0f, 40.0f)];
    self.passwordTextfield.returnKeyType = UIReturnKeyDone;
    self.passwordTextfield.placeholder = @"点击输入";
    self.passwordTextfield.delegate = self;
    //    self.passwordTextfield.secureTextEntry = YES;
    self.passwordTextfield.backgroundColor = [UIColor whiteColor];
    self.passwordTextfield.leftViewMode = UITextFieldViewModeAlways;
    
    
    UILabel *lable2 = [[UILabel alloc] initWithFrame:CGRectMake(20.0f, 10.0f, 80.0f, 20.0f)];
    lable2.text = @"验证码";
    lable2.font = [UIFont systemFontOfSize:16.0f];
    lable2.textAlignment = NSTextAlignmentRight;
    self.passwordTextfield.leftView = lable2;
    
    [self.view addSubview:self.passwordTextfield];
    
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeSystem];
    loginButton.frame = CGRectMake(40.0f, _passwordTextfield.frame.size.height + _passwordTextfield.frame.origin.y +50.0f, WIDTH - 80.0f, 40.0f);
    loginButton.backgroundColor = RGBCOLOR(31.0f, 193.0f, 143.0f);
    [loginButton setTitle:@"验证注册" forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(loginItem) forControlEvents:UIControlEventTouchUpInside];
    [loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [self.view addSubview:loginButton];
    // Do any additional setup after loading the view.
}

- (void)loginItem
{
    
}

- (void)daojishi
{
    NSString *phone;
    
    if (_loginTextfield.text.length)
    {
        phone = _loginTextfield.text;
    }
    else
    {
        MessageView *messageView = [[MessageView alloc] initWithFrame:CGRectMake(WIDTH / 2 - 100, HIGHT / 2 - 30, 200, 60) Title:@"账号不能为空"];
        [self.view addSubview:messageView];
    }

    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:@"13758263997" zone:@"86" customIdentifier:@"" result:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
    __block int timeout = 60; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timer, ^{
        if (timeout <= 0)
        {
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                [_getYzmButton setTitle:@"获取验证码" forState:UIControlStateNormal];
                _getYzmButton.enabled = YES;
            });
        }
        else
        {
            int seconds = timeout;
            NSString *strTime = [NSString stringWithFormat:@"%.2d秒后重新获取", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                [_getYzmButton setTitle:strTime forState:UIControlStateNormal];
                _getYzmButton.enabled = NO;
            });
            
            timeout--;
        }
    });
    dispatch_resume(_timer);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
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
