//
//  Union_NewsViewController.m
//  Union
//
//  Created by 李响 on 15/6/30.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import "Union_NewsViewController.h"

#import "TabView.h"

#import "Union_News_PrettyPictures_View.h"

#import "Union_News_Pictures_Scroll_ViewController.h"

#import "Union_News_TableView_View.h"

#import "Union_News_Details_ViewController.h"

#import "Union_News_Topic_ViewController.h"


#import "PCH.h"

@interface Union_NewsViewController ()<UIScrollViewDelegate>

@property (nonatomic, retain) TabView *tabView; //标签导航栏视图

@property (nonatomic, retain) UIScrollView *scrollView; //滑动视图控制器

@property (nonatomic, retain) Union_News_TableView_View *newsTableView;

@property (nonatomic, retain) Union_News_PrettyPictures_View *prettyPicturesView;


@end

@implementation Union_NewsViewController

-(void)dealloc{
    
    [_tabView release];
    
    [_scrollView release];
    
    [_newsTableView release];
    
    [_prettyPicturesView release];
    
    [super dealloc];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //加载所有视图
    
    [self loadAllView];
    
    //添加标签导航栏视图
    
    [self.view addSubview:self.tabView];
    
    //标签导航栏视图回调block实现
    
    __block Union_NewsViewController *Self = self;
    
    _tabView.returnIndex = ^(NSInteger selectIndex){
        
        //根据标签导航下标切换不同视图显示
    
        [Self switchViewBySelectIndex:selectIndex];
        
    };

    //设置默认标签页
    
    _tabView.selectIndex = 0;
    
    
  
    
 }

#pragma mark ---懒加载标签导航栏视图

-(TabView *)tabView{
    
    if (_tabView == nil) {
        
        NSArray * tabArray = @[@"头条",@"视频",@"赛事",@"靓照",@"囧图",@"壁纸"];
        
        _tabView = [[TabView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
        
        _tabView.dataArray = tabArray;
    }
    
    return _tabView;
    
}

#pragma mark ---根据标签导航下标切换不同视图显示

- (void)switchViewBySelectIndex:(NSInteger)selectIndex{
    
    //判断选中的标签下标
    
    switch (selectIndex) {
            
        case 0:
            
            self.newsTableView.urlstring = [NSString stringWithFormat:kNews_ListURL,@"headlineNews",@"%ld"];
            
            [self.view bringSubviewToFront:self.newsTableView];
            
            break;
            
        case 1:
            
            self.newsTableView.urlstring = [NSString stringWithFormat:kNews_ListURL, @"newsVideo" ,@"%ld"];
            
            [self.view bringSubviewToFront:self.newsTableView];
            
            break;
        case 2:
            
             self.newsTableView.urlstring = [NSString stringWithFormat:kNews_ListURL, @"upgradenews" ,@"%ld"];
            
            [self.view bringSubviewToFront:self.newsTableView];
            
            break;
        case 3:
            
            self.prettyPicturesView.urlString = [NSString stringWithFormat:News_PrettyPicturesURL,@"%ld"];
            
            [self.view bringSubviewToFront:self.prettyPicturesView];
            
            break;
        case 4:
            
            self.prettyPicturesView.urlString = [NSString stringWithFormat:News_SorryFigureURL,@"%ld"];
            
            [self.view bringSubviewToFront:self.prettyPicturesView];
            
            break;
            
        case 5: 

            self.prettyPicturesView.urlString = [NSString stringWithFormat:News_WallpaperURL,@"%ld"];
            
            [self.view bringSubviewToFront:self.prettyPicturesView];
            
            break;
            
        default:
            break;
    }
    
    
}


#pragma mark ----加载所有视图

- (void)loadAllView{
    
    __block typeof (self) Self = self;
    
    
   //视频视图
    
    _newsTableView = [[Union_News_TableView_View alloc]initWithFrame:CGRectMake(0 ,40, self.view.frame.size.width, CGRectGetHeight(self.view.frame) - 153)];
   
    //跳转详情页面
    
    __block Union_News_Details_ViewController *details = [[Union_News_Details_ViewController alloc]init];
    
    //block方法
    
     self.newsTableView.detailsBlock = ^(NSString *string , NSString *type){
        
         details.urlString = [NSString stringWithFormat:@"%@%@",News_WebViewURl,string];
        
         details.type = type;
         
         [Self.navigationController pushViewController:details animated:YES];
         
    };
    
    [self.view addSubview: self.newsTableView];
    
    
    //跳转专题视图
    
    Union_News_Topic_ViewController *topic = [[Union_News_Topic_ViewController alloc]init];
    
    //block方法
    
    self.newsTableView.topicBlock = ^(NSString *string , NSString *type){
        
        topic.urlString = [NSString stringWithFormat:@"%@",string];
        
        
        [Self.navigationController pushViewController:topic animated:YES];
        
    };
    
    
    //创建靓照视图
    
    _prettyPicturesView = [[Union_News_PrettyPictures_View alloc]initWithFrame:CGRectMake(0 ,40, self.view.frame.size.width, self.view.frame.size.height - 113 - 40)];
    
    __block Union_News_Pictures_Scroll_ViewController *pictures = [[Union_News_Pictures_Scroll_ViewController alloc]init];
    

    self.prettyPicturesView.prettyPicturesBlock = ^(NSString *string){
        
        pictures.pictruesString = [NSString stringWithFormat:@"%@%@",News_PicturesURL,string];
        
   
        [Self presentViewController:pictures animated:YES completion:^{
            
        }];
        
        };
    
   [self.view addSubview:self.prettyPicturesView];
    
    //将新闻表视图设为最顶层

   [self.view bringSubviewToFront:self.newsTableView];
    
    //隐藏tabBar
    
    details.hidesBottomBarWhenPushed = YES;
    
    topic.hidesBottomBarWhenPushed = YES;
    
    pictures.hidesBottomBarWhenPushed = YES;
    
    
    
   
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
