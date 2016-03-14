//
//  Union_EncyViewController.m
//  Union
//
//  Created by 李响 on 15/6/30.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import "Union_EncyViewController.h"

#import "EncyModel.h"

#import "EncyItemView.h"

#import "PictureCycleModel.h"

#import "PictureCycleView.h"


#import "Union_Hero_ViewController.h"

#import "Union_Equip_Type_List_ViewController.h"



#define kLightGrayColor [UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:1]


@interface Union_EncyViewController ()

@property (nonatomic , retain)NSMutableArray *dataArray;//数据源数组

@property (nonatomic , retain)NSMutableArray *itemViewArray;//Item视图数组

@property (nonatomic , retain)UIScrollView *scrollView;//滑动视图

@property (nonatomic , retain) NSMutableArray *pictureArray;//图片数据数组

@property (nonatomic , retain) PictureCycleView *pictureCycleView;//图片轮播视图

@property (nonatomic , retain) AFHTTPRequestOperationManager *manager;//AFNetWorking



@property (nonatomic , retain)Union_Hero_ViewController *heroVC;//英雄视图控制器

@property (nonatomic , retain)Union_Equip_Type_List_ViewController *equipTypeListVC;//装备类型列表视图控制器



@end

@implementation Union_EncyViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    //加载轮播视图
    
    [self loadPictureCycleView];
    
    //加载菜单数据
    
    [self loadMenuData];

}

//加载轮播视图

- (void)loadPictureCycleView{
    
    //初始化图片轮播视图
    
    _pictureCycleView = [[PictureCycleView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.scrollView.frame), CGRectGetWidth(self.scrollView.frame) / 7 * 4)];
    
    _pictureCycleView.timeInterval = 3.0f;
    
    _pictureCycleView.isPicturePlay = YES;
    
    _pictureCycleView.selectedPictureBlock = ^(PictureCycleModel *model){
        
        //跳转相应的详情页面

    };

    [self.scrollView addSubview:_pictureCycleView];
    
}

//加载菜单数据

- (void)loadMenuData{
    
    
    NSArray *nameArray = @[@"英雄",@"装备",@"天赋",@"符文",@"最佳阵容",@"召唤师技能"];
    
    NSArray *iconArray = @[@"Ency_Orlanna",@"Ency_Riven",@"Ency_Ashe",@"Ency_Akali",@"Ency_Janna",@"Ency_Sona"];
    
    for (int i = 0 ; i < nameArray.count ; i++) {
        
        EncyModel *encyModel = [[EncyModel alloc]initWithName:nameArray[i] IconName:iconArray[i]];
        
        [self.dataArray addObject:encyModel];
        
    }

    //加载Item视图
    
    [self loadItemView];
    
}

//加载Item视图

- (void)loadItemView{
    
    NSInteger index = 0;
    
    CGFloat itemWidth = (CGRectGetWidth(self.scrollView.frame)) / 3;
    
    CGFloat x = 0;
    
    CGFloat y = CGRectGetHeight(self.pictureCycleView.frame);
    
    for (EncyModel *model in self.dataArray) {
        
        //创建点击手势
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(EncyItemAction:)];
        
        //创建Item视图
        
        EncyItemView *itemView = [[EncyItemView alloc]init];
        
        itemView.model = model;
        
        [itemView addGestureRecognizer:tap];
        
        [self.scrollView addSubview:itemView];
        
        [self.itemViewArray addObject:itemView];
        
        itemView.frame = CGRectMake(x, y, itemWidth, itemWidth);
        
        if (index %2 != 0 ) {
            
            itemView.backgroundColor = kLightGrayColor;
        }
        
        //计算设置位置
        
        if (index == 0) {
            
            itemView.frame = CGRectMake(x, y, itemWidth * 2 , itemWidth * 2);
            
            x += itemWidth * 2;
            
        } else if(index == 1){
            
            y +=itemWidth;
            
        } else {
            
            if (index % 3 == 2) {
                
                x = 0;
                
                y += itemWidth;
                
            } else {
                
                x += itemWidth;
                
            }
            
        }
        
        [itemView release];
        
        index ++;
        
        
    }
    
    //设置滑动视图contentSize
    
    self.scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.scrollView.frame), y );
    
}


#pragma mark ---Item视图点击响应事件

- (void)EncyItemAction:(UITapGestureRecognizer *)tap{
    
    switch ([self.itemViewArray indexOfObject:tap.view]) {
            
        case 0:
            //英雄
            
            self.heroVC.hidesBottomBarWhenPushed = YES;//隐藏tabbar
            
            [self.navigationController pushViewController:self.heroVC animated:YES];
            
            break;
        case 1:
            //装备
            
            self.equipTypeListVC.hidesBottomBarWhenPushed = YES;
            
            [self.navigationController pushViewController:self.equipTypeListVC animated:YES];
            
            break;
        case 2:
            //天赋
            break;
        case 3:
            //符文
            break;
        case 4:
            //最佳阵容
            break;
        case 5:
            //召唤师技能
            break;
            
        default:
            break;
    }

    
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

-(UIScrollView *)scrollView{
    
    if (_scrollView == nil) {
        
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - 113)];
        
        [self.view addSubview:_scrollView];
        
    }
    
    return _scrollView;
    
}

-(NSMutableArray *)itemViewArray{
    
    if (_itemViewArray == nil) {
        
        _itemViewArray = [[NSMutableArray alloc]init];
        
    }
    
    return _itemViewArray;
}

- (NSMutableArray *)dataArray{
    
    if (_dataArray == nil) {
        
        _dataArray = [[NSMutableArray alloc]init];
        
    }
    
    return _dataArray;
    
}

-(NSMutableArray *)pictureArray{
    
    if (_pictureArray == nil) {
        
        _pictureArray = [[NSMutableArray alloc]init];
        
    }
    
    return _pictureArray;
    
}

-(AFHTTPRequestOperationManager *)manager{
    
    if (_manager == nil) {
        
        _manager = [[AFHTTPRequestOperationManager manager] retain];
        
        // 设置超时时间
        
        [_manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
        
        _manager.requestSerializer.timeoutInterval = 15.0f;
        
        [_manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
        
    }
    
    return _manager;
    
}

-(Union_Hero_ViewController *)heroVC{
    
    if (_heroVC == nil) {
        
        _heroVC = [[Union_Hero_ViewController alloc]init];
        
    }
    
    return _heroVC;
}

-(Union_Equip_Type_List_ViewController *)equipTypeListVC{
    
    if (_equipTypeListVC == nil) {
        
        _equipTypeListVC = [[Union_Equip_Type_List_ViewController alloc]init];
        
    }
    
    return _equipTypeListVC;
    
}

@end
