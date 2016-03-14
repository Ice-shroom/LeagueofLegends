//
//  SecondViewController.m
//  Union
//
//  Created by lanou3g on 15-7-21.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import "VideoListViewController.h"

#import "VideoListTableViewCell.h"

#import "Networking.h"

#import "PCH.h"

#import "VideoListModel.h"

#import "GearPowered.h"

#import "UIImageView+WebCache.h"

#import "Union_Video_VideoListTableView.h"

#import "VideoPlayerViewController.h"

@interface VideoListViewController ()

@property (nonatomic ,retain) Union_Video_VideoListTableView *tableView;

@property (nonatomic ,retain) NSMutableArray *secondArray;//数据原数组

@property (nonatomic ,retain) VideoPlayerViewController *videoPlayerVC;//视频播放视图控制器

@end

@implementation VideoListViewController

-(void)dealloc{
    
    [_tableView release];

    [_secondArray release];
    
    [_string release];
    
    [_name release];
    
    [_searchName release];
    
    [super dealloc];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加导航栏左按钮
    
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"iconfont-fanhui"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] style:UIBarButtonItemStyleDone target:self action:@selector(leftBarButtonAction:)];
    
    leftBarButton.tintColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = leftBarButton;

    //导航控制器标头
    
    self.title = self.name;
    
    //视图背景色
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    

}




//加载数据

-(void)loadData{
    
    //判断是搜索请求还是正常请求
    
    NSString *URL =  nil;
    
    if (_string != nil) {
        
        URL = [NSString stringWithFormat:kUnion_Video_URL , @"%ld" , self.string ];
        
    } else {
        
        URL = [NSString stringWithFormat:kUnion_Video_SearchURL , self.searchName , @"%ld" ];
        
    }
    
    //导航控制器标头
    
    self.title = self.name;
    
    //设置URL
    
    self.tableView.urlStr = URL;
    

}






#pragma mark ---leftBarButtonAction

- (void)leftBarButtonAction:(UIBarButtonItem *)sender{
    
    
    //清空请求参数
    
    _string = nil;
    
    _searchName = nil;
    
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

#pragma mark ---LazyLoading

-(Union_Video_VideoListTableView *)tableView{
    
    if (_tableView == nil) {
        
        _tableView = [[Union_Video_VideoListTableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 64 ) style:UITableViewStylePlain];
        
        __block VideoListViewController *Self = self;
        
        _tableView.selectedVideoBlock = ^(NSMutableArray *videoArray , NSString *videoTitle){
            
            Self.videoPlayerVC.videoArray = videoArray;
            
            Self.videoPlayerVC.videoTitle = videoTitle;
            
            //跳转视频播放视图控制器
            
            [Self presentViewController:Self.videoPlayerVC animated:YES completion:^{
                
            }];
            
        };
        
        //添加视频列表视图
        
        [self.view addSubview:self.tableView];
        
    }
    
    return _tableView;
}


-(NSMutableArray *)secondArray{
    
    if (_secondArray == nil) {
        
        _secondArray = [[NSMutableArray alloc]init];
    }
    
    return _secondArray;
    
}

-(VideoPlayerViewController *)videoPlayerVC{
    
    if (_videoPlayerVC == nil) {
        
        _videoPlayerVC = [[VideoPlayerViewController alloc]init];
        
    }
    
    return _videoPlayerVC;
    
}

@end
