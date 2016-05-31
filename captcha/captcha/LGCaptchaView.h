//
//  LGCaptchaView.h
//  captcha
//
//  Created by 李根 on 16/5/31.
//  Copyright © 2016年 ligen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LGCaptchaView : UIView
@property(nonatomic, strong)NSArray *characterArray;    //  字符数组
@property(nonatomic, strong)NSMutableString *targetStr;  //  验证码的字符串

@end
