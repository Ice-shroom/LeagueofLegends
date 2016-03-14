//
//  EncyItemView.m
//  Union
//
//  Created by 李响 on 15/8/4.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import "EncyItemView.h"

@implementation EncyItemView

-(void)dealloc{
    
    [_imageView release];
    
    [_label release];
    
    [_model release];
    
    [super dealloc];
    
}

//初始化

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor] ;
        
        _imageView = [[UIImageView alloc]init];
        
        [self addSubview:_imageView];
        
        _label = [[UILabel alloc]init];
        
        _label.textColor = [UIColor lightGrayColor];
        
        _label.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:_label];
        
    }
    
    return self;
    
}

//设置frame

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    self.imageView.frame = CGRectMake(30, 10, CGRectGetWidth(self.frame) - 60, CGRectGetWidth(self.frame) - 60);
    
    self.label.frame = CGRectMake(0, CGRectGetWidth(self.frame) - 50 , CGRectGetWidth(self.frame) , 40);
    
}

-(void)setModel:(EncyModel *)model{
    
    if (_model != model) {
        
        [_model release];
        
        _model = [model retain];
        
    }

    //赋值数据
    
    self.imageView.image = [UIImage imageNamed:model.iconName];
    
    self.label.text = model.name;
    
}



@end
