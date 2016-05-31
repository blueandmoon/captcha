//
//  ViewController.m
//  captcha
//
//  Created by 李根 on 16/5/31.
//  Copyright © 2016年 ligen. All rights reserved.
//

#import "ViewController.h"
#import "LGCaptchaView.h"

@interface ViewController ()<UITextFieldDelegate, UIAlertViewDelegate>
{
    LGCaptchaView *_captchaView;
    UITextField *_inputField;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor redColor];
    
    _captchaView = [[LGCaptchaView alloc] initWithFrame:CGRectMake(20, 40, 150, 40)];
    [self.view addSubview:_captchaView];
    
    //提示文字
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(190, 40, 100, 40)];
    label.text = @"点击图片换验证码";
    label.font = [UIFont systemFontOfSize:12];
    label.textColor = [UIColor grayColor];
    [self.view addSubview:label];
    
    //添加输入框
    _inputField = [[UITextField alloc] initWithFrame:CGRectMake(20, 100, 150, 40)];
    _inputField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _inputField.layer.borderWidth = 2.0;
    _inputField.layer.cornerRadius = 5.0;
    _inputField.font = [UIFont systemFontOfSize:21];
    _inputField.placeholder = @"请输入验证码!";
    _inputField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _inputField.backgroundColor = [UIColor clearColor];
    _inputField.textAlignment = NSTextAlignmentCenter;
    _inputField.returnKeyType = UIReturnKeyDone;
    _inputField.delegate = self;
    [self.view addSubview:_inputField];
    
    
    
}

#pragma mark 输入框协议中方法,点击return按钮
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //判断输入的是否为验证图片显示的验证码
    if ([_inputField.text isEqualToString:_captchaView.targetStr]) {
        //正确弹出警告款提示正确
        UIAlertView *alview = [[UIAlertView alloc] initWithTitle:@"恭喜您 ^o^" message:@"验证成功" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alview show];
    }
    else
    {
        //验证不匹配，验证码和输入框晃动
        CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
        anim.repeatCount = 1;
        anim.values = @[@-20, @20, @-20];
        [_captchaView.layer addAnimation:anim forKey:nil];
        [_inputField.layer addAnimation:anim forKey:nil];
    }
    return YES;
}

#pragma mark 警告框中方法
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //清空输入框内容，收回键盘
    if (buttonIndex==0) {
        _inputField.text = @"";
        [_inputField resignFirstResponder];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
