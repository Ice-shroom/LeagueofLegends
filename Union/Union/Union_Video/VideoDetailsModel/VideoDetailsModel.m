//
//  VideoDetailsModel.m
//  Union
//
//  Created by HarrisHan on 15/7/23.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import "VideoDetailsModel.h"


@implementation VideoDetailsModel


-(void)dealloc{
    
    [_vid release];
    
    [_definition release];
    
    [_transcode_id release];
    
    [_video_name release];
    
    [_size release];
    
    [_width release];
    
    [_height release];
    
    [_duration release];
    
    [_urls release];
    
    [_cover release];
    
    [super dealloc];
}


@end
