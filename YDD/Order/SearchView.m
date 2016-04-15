//
//  SearchView.m
//  YDD
//
//  Created by shenliping on 16/1/4.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import "SearchView.h"

#define ORC_RADIUS 0

@interface SearchView()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    CGPoint origin;
    CGPoint point;
    CGSize size;
    UIFont *font;
    UILabel *label;
    NSString *title;
    UIButton *button;
    UIBezierPath *path;
}

@property (strong, nonatomic) UITableView *tableView;

@property (nonatomic, retain) NSString *title;

@property (strong, nonatomic) NSMutableArray *imgArray;

@property (strong, nonatomic) NSMutableArray *titleArray;

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event;

@end

@implementation SearchView


- (void)viewBuild
{
    [self setBackgroundColor: [UIColor clearColor]];
    [self setAlpha:1];
    
    path = [[UIBezierPath alloc] init];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapItem)];
    [self addGestureRecognizer:tap];
    
    [self set_path];
    
}

- (void)tapItem
{
    
}

- (void)drawRect:(CGRect)rect {
    [[UIColor whiteColor] setFill];
    [path fill];
}

- (BOOL)pointInside:(CGPoint)p withEvent:(UIEvent *)event
{
    return [path containsPoint:p];
}
-(void)set_path
{
    CGPoint p = CGPointMake(0.0f, 10);
    [path moveToPoint:p];
    
    p.x = p.x + self.frame.size.width - 30.0f;
    [path addLineToPoint:p];
    
    p.x = p.x + 10;
    p.y = p.y - 10;
    [path addLineToPoint:p];
    
    p.x = p.x + 10;
    p.y = p.y + 10;
    [path addLineToPoint:p];
    
    p.x = self.frame.size.width;
    [path addLineToPoint:p];
    
    p.y = self.frame.size.height;
    [path addLineToPoint:p];
    
    p.x = 0.0f;
    [path addLineToPoint:p];
    
    p.y = 10.0f;
    [path addLineToPoint:p];
    
    
    [path closePath];
    
//    [self tableviewAppear];
}

- (void)tableviewAppear
{
//    _imgArray = [NSMutableArray arrayWithObjects:@"老师通知", @"作业通知", @"考试通知", nil];
//    _titleArray  = [NSMutableArray arrayWithObjects:@"老师通知", @"作业通知", @"考试通知", nil];
    
    
//    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0f, 10.0f, self.frame.size.width, self.frame.size.height - 100.0f) style:UITableViewStylePlain];
//    _tableView.delegate = self;
//    _tableView.dataSource = self;
//    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    _tableView.backgroundColor = [UIColor clearColor];
//    
//    [self addSubview:_tableView];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10.0f, 20.0f, self.frame.size.width - 20.0f, 24.0f)];
    textField.delegate = self;
    textField.tag = 0;
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"客户名称";
    textField.returnKeyType = UIReturnKeyDone;
    
    [self addSubview:textField];
    
    UITextField *textField1 = [[UITextField alloc] initWithFrame:CGRectMake(10.0f, 54.0f, self.frame.size.width - 20.0f, 24.0f)];
    textField1.delegate = self;
    textField1.tag = 1;
    textField1.placeholder = @"联系方式";
    textField1.borderStyle = UITextBorderStyleRoundedRect;
    textField1.returnKeyType = UIReturnKeyDone;
    [self addSubview:textField1];
    
    UITextField *textField2 = [[UITextField alloc] initWithFrame:CGRectMake(10.0f, 98.0f, self.frame.size.width - 20.0f, 24.0f)];
    textField2.delegate = self;
    textField2.tag = 2;
    textField2.placeholder = @"订单编号";
    textField2.borderStyle = UITextBorderStyleRoundedRect;
    textField2.returnKeyType = UIReturnKeyDone;
    [self addSubview:textField2];


    
    UILabel *labels = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, textField2.frame.size.height + textField2.frame.origin.y + 10.0f, self.frame.size.width - 20.0f, 20.0f)];
    labels.text = @"至少输入一个进行搜索";
    labels.font = [UIFont systemFontOfSize:13.0f];
    labels.textColor = RGBCOLOR(220, 220, 220);
    [self addSubview:labels];
    
    UIButton *buttons = [UIButton buttonWithType:UIButtonTypeSystem];
    buttons.frame = CGRectMake(10.0f, labels.frame.origin.y + labels.frame.size.height + 10.0f, self.frame.size.width - 20.0f, 40.0f);
    [buttons setTitle:@"搜索" forState:UIControlStateNormal];
    [buttons addTarget:self action:@selector(searchItem) forControlEvents:UIControlEventTouchUpInside];
    [buttons setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    buttons.backgroundColor = RGBCOLOR(31.0f, 193.0f, 143.0f);
    [self addSubview:buttons];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)searchItem
{
    
}

- (void)layoutSubviews{
    [self viewBuild];
}

#pragma mark - tableView dataSource

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return 3;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewCell *cell = [[UITableViewCell alloc] init];
//    if (indexPath.row == 0)
//    {
//        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10.0f, 10.0f, self.frame.size.width - 20.0f, 24.0f)];
//        textField.delegate = self;
//        textField.tag = 0;
//        textField.placeholder = @"客户名称";
//        textField.returnKeyType = UIReturnKeyDone;
//        [cell addSubview:textField];
//    }
//    else if (indexPath.row == 1)
//    {
//        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10.0f, 10.0f, self.frame.size.width - 20.0f, 24.0f)];
//        textField.delegate = self;
//        textField.tag = 0;
//        textField.placeholder = @"联系方式";
//        textField.returnKeyType = UIReturnKeyDone;
//        [cell addSubview:textField];
//    }
//    else
//    {
//        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10.0f, 10.0f, self.frame.size.width - 20.0f, 24.0f)];
//        textField.delegate = self;
//        textField.tag = 0;
//        textField.placeholder = @"订单编号";
//        textField.returnKeyType = UIReturnKeyDone;
//        [cell addSubview:textField];
//    }
//    return cell;
//}
//
//#pragma mark - tableView delegate
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
