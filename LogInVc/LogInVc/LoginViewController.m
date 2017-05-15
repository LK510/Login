//
//  LoginViewController.m
//  LogInVc
//
//  Created by 路飞 on 2017/5/15.
//  Copyright © 2017年 路飞. All rights reserved.
//

#import "LoginViewController.h"
#import "NavBarView.h"

@interface LoginViewController ()<NavBarViewDelegate>

@property (nonatomic,strong) NavBarView *headView;

@property (nonatomic,strong) UITextField *phoneTf;
@property (nonatomic,strong) UITextField *pwdTf;
@property (nonatomic,strong) UILabel *line1;
@property (nonatomic,strong) UILabel *line2;
@property (nonatomic,strong) UIButton *btn1;
@property (nonatomic,strong) UIButton *btn2;

@property (nonatomic,strong) UIButton *getPwdBtn;
@property (nonatomic,strong) UIButton *logBtn;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.headView = [[NavBarView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 64) LeftImageName:@"btn_back_normal" vcName:self.logTitle andRightImageName:@""];
    self.headView.delagate = self;
    [self.view addSubview:self.headView];
    
    [self setUp];
}

- (UITextField *)phoneTf{
    
    if (_phoneTf == nil) {
        _phoneTf = [[UITextField alloc] initWithFrame:CGRectMake(15, 104, screenWidth-30, 44)];
        _phoneTf.placeholder = @"手机号";
        _phoneTf.font = [UIFont systemFontOfSize:15];
    }
    return _phoneTf;
}
- (UITextField *)pwdTf{
    
    if (_pwdTf == nil) {
        
        _pwdTf = [[UITextField alloc] initWithFrame:CGRectMake(15, 150, screenWidth-30, 44)];
        _pwdTf.placeholder = @"验证码";
        _pwdTf.font = [UIFont systemFontOfSize:15];

    }
    return _pwdTf;
}

- (UIButton *)logBtn{
    
    if (_logBtn== nil) {
        
        _logBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 230, screenWidth-30, 44)];
        [_logBtn setTitle:@"注册" forState:UIControlStateNormal];
//        _logBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_logBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_logBtn setBackgroundColor:UIColorFromRGB(0x80bff5)];
//        _logBtn.layer.borderWidth = 1;
//        _logBtn.layer.borderColor = UIColorFromRGB(0xd8d8d8).CGColor;
        _logBtn.layer.cornerRadius = 5;
        
        [_logBtn addTarget:self action:@selector(logDidClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _logBtn;
}

- (void) logDidClick{
    
    //注册、、、
}

- (UIButton *)getPwdBtn{
    
    if (_getPwdBtn == nil) {
        
        _getPwdBtn = [[UIButton alloc] initWithFrame:CGRectMake(screenWidth-115, 5, 85, 34)];
        [_getPwdBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        _getPwdBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_getPwdBtn setTitleColor:UIColorFromRGB(0x80bff5) forState:UIControlStateNormal];
        _getPwdBtn.layer.borderWidth = 1;
        _getPwdBtn.layer.borderColor = UIColorFromRGB(0xd8d8d8).CGColor;
        _getPwdBtn.layer.cornerRadius = 5;
        
        [_getPwdBtn addTarget:self action:@selector(getPwdBtnDidClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _getPwdBtn;
}

- (void) getPwdBtnDidClick{
 
    if ([self isPhoneNum]) {
        
        [self.getPwdBtn startWithTime:60 title:@"获取验证码" countDownTitle:@"s" mainColor:COLORRGB(89,172,243) countColor:COLORRGB(89,172,243)];
        
    }else{
//        self.tipLab.text = @"手机号格式错误";
    }

}

- (void) setUp{
    
    self.line1 = [[UILabel alloc] initWithFrame:CGRectMake(15, 148, screenWidth-30, 1)];
    self.line1.backgroundColor = UIColorFromRGB(0xd8d8d8);
    self.line2 = [[UILabel alloc] initWithFrame:CGRectMake(15, 194, screenWidth-30, 1)];
    self.line2.backgroundColor = UIColorFromRGB(0xd8d8d8);
    
    self.btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 15, 44)];
    [self.btn1 setImage:[UIImage imageNamed:@"手机"] forState:UIControlStateNormal];
    
    self.btn2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 15, 44)];
    [self.btn2 setImage:[UIImage imageNamed:@"验证码"] forState:UIControlStateNormal];

    [self.phoneTf addSubview:self.btn1];
    [self.pwdTf addSubview:self.btn2];
    [self.pwdTf addSubview:self.getPwdBtn];
    
    UIView *blankView = [[UIView alloc] initWithFrame:CGRectMake(20,104,25, 44)];
    UIView *blankView1 = [[UIView alloc] initWithFrame:CGRectMake(20,150,25, 44)];
    self.phoneTf.leftView = blankView;
    self.pwdTf.leftView = blankView1;
    self.phoneTf.leftViewMode =UITextFieldViewModeAlways;
    self.pwdTf.leftViewMode =UITextFieldViewModeAlways;
    
    [self.view addSubview:self.line1];
    [self.view addSubview:self.line2];
    [self.view addSubview:self.phoneTf];
    [self.view addSubview:self.pwdTf];
    
    [self.view addSubview:self.logBtn];
}

- (void) navBarView:(NavBarView *)navBarView{
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) saveWithNavBarView:(NavBarView *)navBarView{
    
    //save
}

// 判断手机号是否正确
- (BOOL)isPhoneNum {
    /**
     * 移动号段正则表达式
     */
    NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
    /**
     * 联通号段正则表达式
     */
    NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
    /**
     * 电信号段正则表达式
     */
    NSString *CT_NUM = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
    NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
    BOOL isMatch1 = [pred1 evaluateWithObject:self.phoneTf.text];
    NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
    BOOL isMatch2 = [pred2 evaluateWithObject:self.phoneTf.text];
    NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
    BOOL isMatch3 = [pred3 evaluateWithObject:self.phoneTf.text];
    if (isMatch1 || isMatch2 || isMatch3) {
        return YES;
    }else{
        return NO;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
