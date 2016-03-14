//
//  NewTableViewCell.m
//  Union
//
//  Created by lanou3g on 15-7-20.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import "VideoListTableViewCell.h"

#import "PCH.h"

#import "NSString+GetWidthHeight.h"

#import <UIImageView+WebCache.h>

@implementation VideoListTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    //初始化控件
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _cover_url = [[UIImageView alloc]init];
        
        [self addSubview:_cover_url];
        
        
        _titleLable = [[UILabel alloc]initWithFrame:CGRectMake(120, 10, self.frame.size.width - 140, self.frame.size.height - 40)];
        
        _titleLable.numberOfLines = 0;
        
        _titleLable.font = [UIFont systemFontOfSize:16];
        
        _titleLable.textColor = [UIColor blackColor];
        
        [self addSubview:_titleLable];
        
        
        _video_length = [[UILabel alloc]init];
        
        _video_length.textAlignment = NSTextAlignmentRight;
        
        _video_length.textColor = [UIColor grayColor];
        
        _video_length.font = [UIFont systemFontOfSize:12];
        
        [self addSubview:_video_length];
        
        
        _upload_time = [[UILabel alloc]init];
        
        _upload_time.textAlignment = NSTextAlignmentCenter;
        
        _upload_time.textColor = [UIColor grayColor];
        
        _upload_time.font = [UIFont systemFontOfSize:12];
        
        [self addSubview:_upload_time];
        
        _download = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _download.tintColor = MAINCOLOER;
        
        _download.imageView.image = [[UIImage imageNamed:@"iconfont-download"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        
        [_download setImage:_download.imageView.image forState:UIControlStateNormal];
        
        [self addSubview:_download];
        
        
    }

    return self;

}

//设置布局

-(void)layoutSubviews{

    [super layoutSubviews];

    _cover_url.frame = CGRectMake(10, 10, 100, 70);

    _video_length.frame = CGRectMake(self.frame.size.width - 125, self.frame.size.height - 25, 50 , 15);

    _upload_time.frame = CGRectMake(120, self.frame.size.height - 25, 35, 15);
    
    _download.frame = CGRectMake(self.frame.size.width - 55, self.frame.size.height - 37, 32, 32);

}

//重写set方法

-(void)setModel:(VideoListModel *)Model{
    
    if (_Model != Model) {
        
        [_Model release];
        
        [Model retain];
        
        _Model = Model;
    }
    
    //赋值
    
    NSURL *picUrl = [NSURL URLWithString:Model.cover_url];
    
    [_cover_url sd_setImageWithURL:picUrl];
    
    _titleLable.text = Model.title;
    
    _video_length.text = Model.video_length;
    
    _upload_time.text = Model.upload_time;
    
    //计算titleLable内容所需高度
    
    CGFloat titleLableWidth = [NSString getHeightWithstring:Model.title Width:self.frame.size.width - 140 FontSize:16];
    
    //设置高度
    
    _titleLable.frame = CGRectMake(_titleLable.frame.origin.x , _titleLable.frame.origin.y , self.frame.size.width - 140 , titleLableWidth > CGRectGetHeight(self.frame) - 40 ? CGRectGetHeight(self.frame) - 50 : titleLableWidth );
     

}

-(void)dealloc{
    
    [_upload_time release];
    
    [_video_length release];
    
    [_cover_url release];
    
    [_titleLable release];
    
    [_Model release];
    
    [_download release];
    
    [super dealloc];

}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
