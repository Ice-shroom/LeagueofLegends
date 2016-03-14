//
//  DownloadViewController.m
//  Union
//
//  Created by lanou3g on 15-7-21.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import "DownloadViewController.h"

#import "TabView.h"

@interface DownloadViewController ()

@property (nonatomic ,retain) TabView *tabView;

@end

@implementation DownloadViewController

-(void)dealloc{
    
    [_tabView release];
    
    [super dealloc];
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"下载";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //添加导航栏左按钮
    
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"iconfont-fanhui"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] style:UIBarButtonItemStyleDone target:self action:@selector(leftBarButtonAction:)];
    
    leftBarButton.tintColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = leftBarButton;
    
    
    //添加标签导航栏视图
    
    [self.view addSubview:self.tabView];
    
    //标签导航栏视图回调block实现
    
    __block DownloadViewController *Self = self;
    
    self.tabView.returnIndex = ^(NSInteger selectIndex){
        
        //根据标签导航下标切换不同视图显示
        
        [Self switchViewBySelectIndex:selectIndex];
        
    };

    
    [self tabView];
    
    
    
}

#pragma mark ---懒加载标签导航栏视图

-(TabView *)tabView{
    
    if (_tabView == nil) {
        
        NSArray * tabArray = @[@"下载中",@"已完成"];
        
        _tabView = [[TabView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
        
        _tabView.dataArray = tabArray;
    }
    
    return _tabView;
    
}

#pragma mark ---根据标签导航下标切换不同视图显示

- (void)switchViewBySelectIndex:(NSInteger)selectIndex{
    
    //判断选中的标签下标 执行相应的切换
    
    switch (selectIndex) {
        case 0:
            
            //            分类视图
            
            
            break;
            
        case 1:
            
            //            最新视图
            
            
            break;
            
        default:
            break;
    }
    
    
    
}




#pragma mark ---leftBarButtonAction

- (void)leftBarButtonAction:(UIBarButtonItem *)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
    
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
