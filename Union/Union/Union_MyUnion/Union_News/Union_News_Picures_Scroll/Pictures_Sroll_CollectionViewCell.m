//
//  Pictures_Sroll_CollectionViewCell.m
//  Union
//
//  Created by lanou3g on 15/7/22.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import "Pictures_Sroll_CollectionViewCell.h"

#import <UIImageView+WebCache.h>

@implementation Pictures_Sroll_CollectionViewCell

- (void)dealloc{
    
    [_imageView release];
    
    [_titleLable release];
    
    [_scrollView release];
    
    [_model release];
    
    
    [super dealloc];
}





- (instancetype)initWithFrame:(CGRect)frame{
    
    if ( self = [super initWithFrame:frame]) {
        
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
        
        _scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
        
        _scrollView.maximumZoomScale = 3;
        
        _scrollView.minimumZoomScale = 1;
        
        _scrollView.zoomScale = 1;
        
        _scrollView.delegate = self;
        
        [self.contentView addSubview:_scrollView];
        
        _imageView = [[UIImageView alloc]init];
        
        [_scrollView addSubview:_imageView];
        
        
        [_scrollView release];
        
        [_imageView release];
                     
    }
    
    return self;
    
    
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    
    
}


- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    
    return self.imageView;
    
}

//当scrollView正在缩放的时候会频繁响应的方法

-(void)scrollViewDidZoom:(UIScrollView *)scrollView{

    //x和y轴的增量:
    
    //当scrollView自身的宽度或者高度大于其contentSize的时候, 增量为:自身宽度或者高度减去contentSize宽度或者高度除以2,或者为0
    
    //条件运算符
    
    CGFloat delta_x= scrollView.bounds.size.width > scrollView.contentSize.width ? (scrollView.bounds.size.width-scrollView.contentSize.width)/2 : 0;
  
    CGFloat delta_y= scrollView.bounds.size.height > scrollView.contentSize.height ? (scrollView.bounds.size.height - scrollView.contentSize.height)/2 : 0;
    
    //让imageView一直居中
    
    //实时修改imageView的center属性 保持其居中

    self.imageView.center=CGPointMake(scrollView.contentSize.width/2 + delta_x, scrollView.contentSize.height/2 + delta_y);

}


- (void)setModel:(Pictures_Sreoll_Model *)model{
    
    if ( _model != model) {
        
        [_model release];
        
        _model = [model retain];
        
        
    }
    
    _scrollView.zoomScale = 1;
    
    _titleLable.text = _model.title;
    
    //加载图片
    
    NSURL *url = [NSURL URLWithString:model.url];
    
    [_imageView sd_setImageWithURL:url];

    
    
    CGFloat width =  [_model.fileWidth floatValue];
    
    CGFloat height = [_model.fileHeight floatValue];
    
    NSLog(@"%.2f",self.scrollView.frame.size.width);
    
    self.imageView.frame = CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.width/(width/height));
    
    self.imageView.center = self.scrollView.center;

    
}





@end
