//
//  Union_Hero_Details_ViewController.m
//  Union
//
//  Created by 李响 on 15/7/13.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import "Union_Hero_Details_ViewController.h"

@interface Union_Hero_Details_ViewController ()

@end

@implementation Union_Hero_Details_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ---设置电池条前景部分样式类型 (白色)

-(UIStatusBarStyle)preferredStatusBarStyle{
    
    return UIStatusBarStyleLightContent;
    
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
