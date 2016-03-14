//
//  DownloadView.m
//  Union
//
//  Created by lanou3g on 15-7-22.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import "DownloadView.h"

#define kDownLoadWidth 50

@interface DownloadView ()


@property (nonatomic , retain ) UIImageView *imageView;//图片

@end

@implementation DownloadView

- (void)dealloc{
    
    [_imageView release];
    
    [super dealloc];
    
}

//初始化

-(instancetype)initWithFrame:(CGRect)frame{

    frame.size.width = kDownLoadWidth;
    
    frame.size.height = kDownLoadWidth;
    
    if (self = [super initWithFrame:frame]) {
        
        //初始化图片
        
        _imageView = [[UIImageView alloc]initWithImage:[[UIImage imageNamed:@"iconfont-xiazai"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
        
        _imageView.tintColor = [UIColor whiteColor];
        
        _imageView.frame = CGRectMake(0, 0, 30, 30);
        
        _imageView.center = CGPointMake(kDownLoadWidth / 2 , kDownLoadWidth / 2);
        
        [self addSubview:_imageView];
        
        
        //将正方形的view变成圆形
        
        self.layer.cornerRadius = kDownLoadWidth / 2;
    
    }
    
    return self;

}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    //得到触摸点
    
    UITouch *startTouch = [touches anyObject];
    
    //返回触摸点坐标
    
    self.startPoint = [startTouch locationInView:self.superview];
    
}

//触摸移动

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
   
    //得到触摸点

    UITouch *startTouch = [touches anyObject];
    
    //将触摸点赋值给touchView的中心点 也就是根据触摸的位置实时修改view的位置

    self.center = [startTouch locationInView:self.superview];

}

//结束触摸

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    //得到触摸结束点
   
    UITouch *endTouch = [touches anyObject];

    //返回触摸结束点
    
    self.endPoint = [endTouch locationInView:self.superview];
    
    
    //判断是否移动了视图 (误差范围5)
    
    CGFloat errorRange = 5;
    
    if (( self.endPoint.x - self.startPoint.x >= -errorRange && self.endPoint.x - self.startPoint.x <= errorRange ) && ( self.endPoint.y - self.startPoint.y >= -errorRange && self.endPoint.y - self.startPoint.y <= errorRange )) {
        
        //未移动
        
        //调用下载Block 跳转下载管理页面
        
        self.downLoadBlock();
        
    } else {
        
        //移动
        
        //判断是否超出范围
        
        if (self.endPoint.x <= kDownLoadWidth / 2) {
            
            self.frame = CGRectMake(0, (self.endPoint.y - (kDownLoadWidth / 2)) , kDownLoadWidth, kDownLoadWidth);
            
        }
        
        if(self.endPoint.y <= 64 + kDownLoadWidth / 2 ){
            
            self.frame = CGRectMake(self.endPoint.x - kDownLoadWidth / 2, 0, kDownLoadWidth, kDownLoadWidth);
            
        }
        
        if (self.endPoint.x >= self.superview.frame.size.width - kDownLoadWidth / 2){
            
            self.frame = CGRectMake(self.superview.frame.size.width - kDownLoadWidth, self.endPoint.y - kDownLoadWidth / 2, kDownLoadWidth, kDownLoadWidth);
            
        }
        
        if (self.endPoint.y >= self.superview.frame.size.height  - kDownLoadWidth / 2) {
            
            self.frame = CGRectMake(self.endPoint.x - kDownLoadWidth / 2, self.superview.frame.size.height - kDownLoadWidth, kDownLoadWidth, kDownLoadWidth);
            
        }

        
    }
    

}













@end
