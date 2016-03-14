//
//  Union_News_PrettyPictures_CollectionViewCell.m
//  Union
//
//  Created by lanou3g on 15/7/18.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import "Union_News_PrettyPictures_CollectionViewCell.h"

#import <UIImageView+WebCache.h>

@implementation Union_News_PrettyPictures_CollectionViewCell

-(void)dealloc{
    
    [_coverImageView release];
    
    [_picsumLable release];
    
    [_titleLable release];
    
    [_model release];
    
    [super dealloc];
}





//初始化方法

- (id)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        

        _coverImageView = [[UIImageView alloc]init];
        
        [self.contentView addSubview:_coverImageView];
        
        _titleLable = [[UILabel alloc]init];
        
        _titleLable.font = [UIFont systemFontOfSize:14];
        
        _titleLable.textColor = [UIColor blackColor];
        
        _titleLable.backgroundColor = [UIColor whiteColor];
        
        _titleLable.textAlignment = NSTextAlignmentLeft;
        
        _titleLable.numberOfLines = 0;
        
        [self.contentView addSubview:_titleLable];
        
        _picsumLable = [[UILabel alloc]init];
        
        _picsumLable.backgroundColor = [UIColor blackColor];
        
        _picsumLable.alpha = 0.7;
        
        _picsumLable.textAlignment = NSTextAlignmentRight;
        
        _picsumLable.textColor = [UIColor whiteColor];
        
        _picsumLable.font = [UIFont systemFontOfSize:14];
        
        [self.contentView addSubview:_picsumLable];
        
    }
    
    return self;
}


//设置frame

- (void)layoutSubviews{
    
    //图片的frame
    self.coverImageView.frame = CGRectMake(0, 0, self.frame.size.width , self.frame.size.height - 50);
    
    //标题的frame
    self.titleLable.frame = CGRectMake(0, self.frame.size.height - 50, self.coverImageView.frame.size.width ,50);
    
    //页数的frame
    
    self.picsumLable.frame = CGRectMake(0, self.frame.size.height - 50 - 18, self.coverImageView.frame.size.width, 18);
    
}


- (void)setModel:(Union_News_PrettyPictures_Model *)model{
    
    if ( _model != model) {
        
        [_model release];
        
        _model = [model retain];
    }
    
    _picsumLable.text = [NSString stringWithFormat:@"共%@张",_model.picsum];
    
    _titleLable.text = _model.title;
    
    //图片解析
    
    NSURL *url = [NSURL URLWithString:_model.coverUrl];
    
    [self.coverImageView sd_setImageWithURL:url];

    
}




@end
