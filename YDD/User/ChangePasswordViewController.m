//
//  ChangePasswordViewController.m
//  YDD
//
//  Created by shenliping on 16/1/4.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import "ChangePasswordViewController.h"

@interface ChangePasswordViewController ()<UITextFieldDelegate>

@property (strong, nonatomic) UITextField *oldTextfield;

@property (strong, nonatomic) UITextField *anewTextfield;

@property (strong, nonatomic) UITextField *sureTextfield;

@end

@implementation ChangePasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _oldTextfield = [[UITextField alloc] initWithFrame:CGRectMake(20.0f, 80.0f, WIDTH- 40.0f, 30.0f)];
    _oldTextfield.delegate = self;
    _oldTextfield.placeholder = @"原密码";
    _oldTextfield.returnKeyType = UIReturnKeyDone;
    _oldTextfield.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_oldTextfield];
    
    _anewTextfield = [[UITextField alloc] initWithFrame:CGRectMake(20.0f, _oldTextfield.frame.origin.y + _oldTextfield.frame.size.height + 5, WIDTH - 40.0f, 30.0f)];
    _anewTextfield.delegate = self;
    _anewTextfield.placeholder = @"新密码";
    _anewTextfield.returnKeyType = UIReturnKeyDone;
    _anewTextfield.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_anewTextfield];
    
    _sureTextfield = [[UITextField alloc] initWithFrame:CGRectMake(20.0f, _anewTextfield.frame.origin.y + _anewTextfield.frame.size.height + 5, WIDTH - 40.0f, 30.0f)];
    _sureTextfield.delegate = self;
    _sureTextfield.placeholder = @"确认新密码";
    _sureTextfield.returnKeyType = UIReturnKeyDone;
    _sureTextfield.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_sureTextfield];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20.0f, _sureTextfield.frame.origin.y + _sureTextfield.frame.size.height + 10.0f, WIDTH - 40.0f, 30.0f)];
    label.text = @"密码由6-20位英文字母，数字组成";
    label.font = [UIFont systemFontOfSize:13.0f];
    label.textColor = [UIColor grayColor];
    [self.view addSubview:label];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(20.0f, label.frame.origin.y + label.frame.size.height + 30.0f, WIDTH - 40.0f, 40.0f);
    [button setTitle:@"确认修改" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.backgroundColor = RGBCOLOR(31.0f, 193.0f, 143.0f);
    [self.view addSubview:button];
    
    // Do any additional setup after loading the view.
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
