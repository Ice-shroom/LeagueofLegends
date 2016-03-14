//
//  Union_News_Video_Model.m
//  Union
//
//  Created by lanou3g on 15/7/21.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import "Union_News_TableView_Model.h"



@implementation Union_News_TableView_Model

- (void)setValue:(id)value forKey:(NSString *)key{
    
    [super setValue:value forKey:key];
}


-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    
}

- (void)dealloc{
    
    [_title release];
    
    [_id release];
    
    [_photo release];
    
    [_content release];
    
    [_readCount release];
    
    [_time release];
    
    [_type release];
    
    [super dealloc];
    
}

@end
