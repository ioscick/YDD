//
//  GoodsDetailViewController.m
//  YDD
//
//  Created by shenliping on 16/1/7.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import "GoodsDetailViewController.h"

@interface GoodsDetailViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    CGFloat price;
    int count;
    CGFloat volume;
    int num;
    CGFloat totalPrice;
    CGFloat totalVolume;
}
@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) UILabel *priceLabel;

@property (strong, nonatomic) UILabel *volumeLabel;

@property (copy, nonatomic) NSString *imgLocalUrl;

@property (strong, nonatomic) UIImage *image;

@end

@implementation GoodsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    price = 0.0f;
    volume = 0.0f;
    count = 0;
    num = 0;
    totalPrice = 0.0f;
    totalVolume = 0.0f;

    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0f, 44.0f, self.view.frame.size.width, self.view.frame.size.height - 44.0f - 49.0f) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [[UIView alloc] init];
    _tableView.backgroundColor = RGBCOLOR(230, 230, 230);
    
    [self.view addSubview:_tableView];
    
    _priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH / 2 - 110.0f, 246.0f, 100.0f, 20.0f)];
    _priceLabel.text = @"总价：0.0￥";
    _priceLabel.font = [UIFont systemFontOfSize:12.0f];
    _priceLabel.textAlignment = NSTextAlignmentRight;
    [self.tableView addSubview:_priceLabel];
    
    _volumeLabel = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH / 2 + 10.0f, 246.0f, 100.0f, 20.0f)];
    _volumeLabel.text = @"总体积：0.0";
    _volumeLabel.font = [UIFont systemFontOfSize:12.0f];
    [self.tableView addSubview:_volumeLabel];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapFinishEditor)];
    [self.view addGestureRecognizer:tap];
    
    
    // Do any additional setup after loading the view.
}

- (void)headerView
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
}

- (void)tapFinishEditor
{
    [self.view endEditing:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 4)
    {
        return 60.0f;
    }
    else
    {
        return 44.0f;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.row == 0)
    {
        UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 12.0f, 60.0f, 20.0f)];
        label1.font = [UIFont systemFontOfSize:14.0f];
        label1.text = @"型号";
        [cell addSubview:label1];
        
        UITextField *textField1 = [[UITextField alloc] initWithFrame:CGRectMake(70.0f, 12.0f, WIDTH - 80.0f, 20.0f)];
        textField1.delegate = self;
        textField1.returnKeyType = UIReturnKeyDone;
        textField1.placeholder = @"请输入商品型号";
        textField1.font = [UIFont systemFontOfSize:14.0f];
        [cell addSubview:textField1];
    }
    else if (indexPath.row == 1)
    {
        UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 12.0f, 60.0f, 20.0f)];
        label1.font = [UIFont systemFontOfSize:14.0f];
        label1.text = @"商品名称";
        [cell addSubview:label1];
        
        UITextField *textField1 = [[UITextField alloc] initWithFrame:CGRectMake(70.0f, 12.0f, WIDTH - 80.0f, 20.0f)];
        textField1.delegate = self;
        textField1.returnKeyType = UIReturnKeyDone;
        textField1.placeholder = @"请输入商品名称";
        textField1.font = [UIFont systemFontOfSize:14.0f];
        [cell addSubview:textField1];
    }
    else if (indexPath.row == 2)
    {
        UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 12.0f, 60.0f, 20.0f)];
        label1.font = [UIFont systemFontOfSize:14.0f];
        label1.text = @"单价";
        [cell addSubview:label1];
        
        UITextField *textField1 = [[UITextField alloc] initWithFrame:CGRectMake(70.0f, 12.0f, WIDTH / 2 - 70.0f, 20.0f)];
        textField1.delegate = self;
        textField1.returnKeyType = UIReturnKeyDone;
        textField1.placeholder = @"请输入价格";
        textField1.tag = 1;
        textField1.keyboardType = UIKeyboardTypeDecimalPad;
        textField1.font = [UIFont systemFontOfSize:14.0f];
        [cell addSubview:textField1];
        
        
        UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH / 2 + 10.0f, 12.0f, 600.0f, 20.0f)];
        label2.font = [UIFont systemFontOfSize:14.0f];
        label2.text = @"数量";
        [cell addSubview:label2];
        
        UITextField *textField2 = [[UITextField alloc] initWithFrame:CGRectMake(WIDTH / 2 + 70.0f, 12.0f, WIDTH / 2 - 70.0f, 20.0f)];
        textField2.delegate = self;
        textField2.returnKeyType = UIReturnKeyDone;
        textField2.placeholder = @"请输入数量";
        textField2.tag = 2;
        textField2.keyboardType = UIKeyboardTypeDecimalPad;
        textField2.font = [UIFont systemFontOfSize:14.0f];
        [cell addSubview:textField2];
    }
    else if (indexPath.row == 3)
    {
        UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 12.0f, 60.0f, 20.0f)];
        label1.font = [UIFont systemFontOfSize:14.0f];
        label1.text = @"单件体积";
        [cell addSubview:label1];
        
        UITextField *textField1 = [[UITextField alloc] initWithFrame:CGRectMake(70.0f, 12.0f, WIDTH / 2 - 70.0f, 20.0f)];
        textField1.delegate = self;
        textField1.returnKeyType = UIReturnKeyDone;
        textField1.placeholder = @"请输入体积";
        textField1.tag = 101;
        textField1.keyboardType = UIKeyboardTypeDecimalPad;
        textField1.font = [UIFont systemFontOfSize:14.0f];
        [cell addSubview:textField1];
        
        
        UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH / 2 + 10.0f, 12.0f, 600.0f, 20.0f)];
        label2.font = [UIFont systemFontOfSize:14.0f];
        label2.text = @"装箱数";
        [cell addSubview:label2];
        
        UITextField *textField2 = [[UITextField alloc] initWithFrame:CGRectMake(WIDTH / 2 + 70.0f, 12.0f, WIDTH / 2 - 70.0f, 20.0f)];
        textField2.delegate = self;
        textField2.returnKeyType = UIReturnKeyDone;
        textField2.placeholder = @"请输入装箱数";
        textField2.tag = 102;
        textField2.keyboardType = UIKeyboardTypeDecimalPad;
        textField2.font = [UIFont systemFontOfSize:14.0f];
        [cell addSubview:textField2];
    }
    else
    {
        UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 20.0f, 60.0f, 20.0f)];
        label1.font = [UIFont systemFontOfSize:14.0f];
        label1.text = @"备注";
        [cell addSubview:label1];
        
        UITextField *textField1 = [[UITextField alloc] initWithFrame:CGRectMake(70.0f, 10.0f, WIDTH - 80.0f, 40.0f)];
        textField1.delegate = self;
        textField1.returnKeyType = UIReturnKeyDone;
        textField1.placeholder = @"请输入订单备注";
        textField1.font = [UIFont systemFontOfSize:14.0f];
        [cell addSubview:textField1];

    }


    return cell;
}

- (void)chooseImage
{
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照", @"选取照片", nil];
    [sheet showInView:self.view];
}

#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //    NSInteger sourceType = 0;
    if (buttonIndex == 0)
    {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        {
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.delegate = self;
            picker.allowsEditing = YES;
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            [self presentViewController:picker animated:YES completion:^{
                
            }];
        }
    }
    else if (buttonIndex == 1)
    {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        picker.delegate = self;
        //设置选择后的图片可被编辑
        picker.allowsEditing = YES;
        [self presentViewController:picker animated:YES completion:^{
            
        }];
    }
}

#pragma mark - image picker delegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera)
    {
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    }
    
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    
    if ([type isEqualToString:@"public.image"])
    {
        UIImage *img = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        NSData *data;

        data = UIImageJPEGRepresentation(img, 0.5);

        NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString* documentsDirectory = [paths objectAtIndex:0];
        
        NSString *file = [NSString stringWithFormat:@"%@image.jpg",documentsDirectory];
        
        NSString* fullPathToFile = [documentsDirectory stringByAppendingPathComponent:file];
        
        [data writeToFile:fullPathToFile atomically:NO];
        
        self.imgLocalUrl = fullPathToFile;
        NSLog(@"%@",self.imgLocalUrl);
        
        [picker dismissViewControllerAnimated:YES completion:^{
            
        }];
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField.tag == 1)
    {
        price = [textField.text floatValue];
        totalPrice = price * count;
        _priceLabel.text = [NSString stringWithFormat:@"总价：%.2f",totalPrice];
    }
    else if (textField.tag == 2)
    {
        count = [textField.text intValue];
        totalPrice = price * count;
        _priceLabel.text = [NSString stringWithFormat:@"总价：%.2f",totalPrice];
    }
    else if (textField.tag == 101)
    {
        volume = [textField.text floatValue];
        totalVolume = volume * num;
        _volumeLabel.text = [NSString stringWithFormat:@"总体积：%.2f",totalVolume];
    }
    else if (textField.tag == 102)
    {
        num = [textField.text intValue];
        totalVolume = volume * num;
        _volumeLabel.text = [NSString stringWithFormat:@"总体积：%.2f",totalVolume];
        [self chooseImage];
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
