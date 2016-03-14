//
//  MyUnion_AboutTableViewCell.m
//  Union
//
//  Created by 李响 on 15/7/20.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import "MyUnion_AboutTableViewCell.h"

#import "PCH.h"

@interface MyUnion_AboutTableViewCell ()

@property (nonatomic , retain ) UIImageView *picImageView;//图标

@property (nonatomic , retain ) UILabel *titleLabel;//标题

@end

@implementation MyUnion_AboutTableViewCell

-(void)dealloc{
    
    [_picImageView release];
    
    [_titleLabel release];
    
    [super dealloc];
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


//初始化

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.frame = CGRectMake(0, 0, CGRectGetWidth([[UIScreen mainScreen] bounds]), 100);
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        //初始化图标
        
        _picImageView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 10, 40, 40)];
        
        _picImageView.tintColor = MAINCOLOER;
        
        _picImageView.image = [[UIImage imageNamed:@"iconfont-ts-icon-about"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        
        [self addSubview:_picImageView];
        
        //初始化标题
        
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(70 , 20, CGRectGetWidth(self.frame) - 100, 20)];
        
        _titleLabel.font = [UIFont systemFontOfSize:16];
        
        _titleLabel.text = @"关于";
        
        [self addSubview:_titleLabel];
        
    }
    
    return self;
    
}




@end
