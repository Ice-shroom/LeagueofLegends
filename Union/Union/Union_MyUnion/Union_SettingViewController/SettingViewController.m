//
//  SettingViewController.m
//  Union
//
//  Created by 李响 on 15/7/21.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"设置";
    
    self.view.backgroundColor = [UIColor whiteColor];

    //添加导航栏左按钮
    
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"iconfont-fanhui"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] style:UIBarButtonItemStyleDone target:self action:@selector(leftBarButtonAction:)];
    
    leftBarButton.tintColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = leftBarButton;
    
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



#pragma mark ---leftBarButtonAction

- (void)leftBarButtonAction:(UIBarButtonItem *)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

#pragma mark ---禁止横屏

-(NSUInteger)supportedInterfaceOrientations{
    
    return UIInterfaceOrientationMaskPortrait;
    
}
@end
