//
//  ViewController.m
//  LogInVc
//
//  Created by 路飞 on 2017/5/15.
//  Copyright © 2017年 路飞. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    LoginViewController *logVc = [[LoginViewController alloc] init];
    logVc.logTitle = @"设置";
    
    [self presentViewController:logVc animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
