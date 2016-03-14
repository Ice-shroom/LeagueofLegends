//
//  TabView.m
// 
//
//  Created by 李响 on 15/6/30.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import "TabView.h"

#import "PCH.h"


#define SCROLL_WIDTH CGRectGetWidth(self.scrollView.frame)

#define SCROLL_HEIGHT CGRectGetHeight(self.scrollView.frame)

#define BUTTONTAG 520

@implementation TabView

//初始化View

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        

        
        //初始化滑动视图
        
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        
        _scrollView.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
        
        _scrollView.contentSize = CGSizeMake(frame.size.width, frame.size.height);

        
        //设置横向滑动的指示器是否显示 ,默认为YES显示
        
        _scrollView.showsHorizontalScrollIndicator=NO;
        
        //通过设置pagingEnabled这个属性 可以控制scrollView的子视图按整屏翻页 默认为NO
        
        _scrollView.pagingEnabled=NO;
        
        //将滑动视图添加到View上
        
        [self addSubview:_scrollView];
        
        
        
        //初始化选中下标
        
        _selectIndex = 0 ;
        
    }
    return self;
}

//获取数据 并计算

-(void)setDataArray:(NSArray *)dataArray{
    
    if (_dataArray != dataArray) {
        
        //MRC
        
        [_dataArray release];
        
        _dataArray = [dataArray retain];
        
        //ARC
        
//        _dataArray = dataArray;
        
    }
    
    //判断指定的选中下标是否大于数组元素个数
    
    if (self.selectIndex > dataArray.count) {
        
        //如果大于
        
        self.selectIndex = dataArray.count - 1;
        
    }
    //清除所有视图
    
    [self removeAllViews];
    
    //计算数据 加载button
    
    [self loadButton];
    
}

//计算数据 加载BUTTON

-(void)loadButton{
    
    //获取数组元素个数
    
    NSInteger count = self.dataArray.count;
    
    //根据视图大小 和 标签个数 计算其占用宽度 (标签个数大于6个 平均宽度按6个计算)
    
    CGFloat button_width = SCROLL_WIDTH / (count <=6 ? count : 6);
    
    //循环初始化button
    
    for (int i = 0; i< count; i++) {
        
        //初始化BUTTON
        
        [self initButton:CGRectMake(button_width * i, self.scrollView.frame.origin.y, button_width, SCROLL_HEIGHT) title:self.dataArray[i] tag: BUTTONTAG + i ];
        
    }
    
    //设置滑动视图内容大小
    
    self.scrollView.contentSize = CGSizeMake(button_width * count , SCROLL_HEIGHT);
    
    //设置下划线视图frame
    
    self.lineView.frame = CGRectMake(button_width * self.selectIndex , SCROLL_HEIGHT - 3 , button_width, 3);
    
    //设置下划线视图层级关系 位于最上层
    
//    [self.scrollView bringSubviewToFront:self.lineView];
    
}


//初始化BUTTON

- (void)initButton:(CGRect)frame title:(NSString *)title tag:(NSInteger)tag{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.frame = frame;
    
    button.tag = tag;
    
    button.autoresizesSubviews = YES;
    
    [button setTitle:title forState:UIControlStateNormal];
    
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    
    //判断是否为指定选中下标
    
    if (tag- BUTTONTAG == self.selectIndex) {
        
        [self buttonClickStyle:button];
        
    }else{
        
        [self buttonDefaultStyle:button];
        
    }
    
    button.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
    
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.scrollView insertSubview:button belowSubview:self.lineView];
    
}
//BUTTON默认样式

- (void)buttonDefaultStyle:(UIButton *)button{
    
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];

}

//BUTTON点击样式

- (void)buttonClickStyle:(UIButton *)button{
    
    [button setTitleColor:MAINCOLOER forState:UIControlStateNormal];
    
}

//BUTTON点击事件

- (void)buttonAction:(UIButton *)sender{
    
    //添加点击样式
    
    [self buttonClickStyle:sender];
    
    //下划线移动
    
    [self lineViewMobile:sender.frame.origin.x];
    
    //除点击的button外 其他button全部恢复默认样式
    
    for (int i= 0; i < self.dataArray.count; i++) {
        
        NSInteger tag = BUTTONTAG + i;
        
        UIButton *button = (UIButton *)[self viewWithTag:tag];
        
        if (button != sender) {
            
            [self buttonDefaultStyle:button];
            
        }else{
            
            //调用Block 传入选中的下标
            
            self.returnIndex(i);
            
        }
        
    }
    
}

//下划线视图移动

- (void)lineViewMobile:(CGFloat)x{
    
    //添加动画
    
    [UIView beginAnimations:@"lineViewMobile" context:nil];
    
    //设置动画时长
    
    [UIView setAnimationDuration:0.3];
    
    //设置下划线视图frame
    
    self.lineView.frame = CGRectMake(x , SCROLL_HEIGHT - 3 , CGRectGetWidth(self.lineView.frame) , CGRectGetHeight(self.lineView.frame));
    
    //提交动画
    
    [UIView commitAnimations];
    
}

//跳转到指定下标的位置

-(void)setSelectIndex:(NSInteger)selectIndex{
    
    if (_selectIndex != selectIndex) {
        
        _selectIndex = selectIndex;
        
    }
    
    //获取对应tag值得button
    
    UIButton *button = (UIButton *)[ self viewWithTag:BUTTONTAG + selectIndex ];
    
    //调用点击button事件方法实现对应的效果
    
    [self buttonAction:button];
    
    
}

//删除所有视图

- (void)removeAllViews{
    
    NSArray *subViews = [self.scrollView subviews];

    for (UIButton *item in subViews) {
        
        [item removeFromSuperview];
        
    }
    
}

#pragma mark ---LazyLoading

-(UIView *)lineView{
    
    if (_lineView == nil) {
        
        //初始化下划线View
        
        _lineView = [[UIView alloc]init];
        
        _lineView.backgroundColor = MAINCOLOER;
        
        [_scrollView addSubview:_lineView];
        
    }
    
    return _lineView;
    
}



-(void)dealloc {
    
    [_scrollView release];
    
    [_lineView  release];
    
    [_dataArray release];
    
    [super dealloc];
    
}


@end














