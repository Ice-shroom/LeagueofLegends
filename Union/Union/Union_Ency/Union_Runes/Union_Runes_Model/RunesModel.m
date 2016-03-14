//
//  RunesModel.m
//  Union
//
//  Created by 张展 on 15/8/14.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import "RunesModel.h"

@implementation RunesModel

-(void)dealloc{
    
    [_Name release];
    
    [_Alias release];
    
    [_lev1 release];
    
    [_lev2 release];
    
    [_lev3 release];
    
    [_iplev1 release];
    
    [_iplev2 release];
    
    [_iplev3 release];
    
    [_Prop release];
    
    [_Img release];
    
    [_Units release];
    
    [super dealloc];
    
}

@end
