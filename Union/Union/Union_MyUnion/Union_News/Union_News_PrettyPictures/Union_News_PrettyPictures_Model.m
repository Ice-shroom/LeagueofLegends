//
//  Union_News_PrettyPictures_Model.m
//  Union
//
//  Created by lanou3g on 15/7/21.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import "Union_News_PrettyPictures_Model.h"

@implementation Union_News_PrettyPictures_Model



- (void)setValue:(id)value forKey:(NSString *)key{
    
    [super setValue:value forKey:key];
}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    
}

-(void)dealloc{
    
    [_coverUrl release];
    
    [_galleryId release];
    
    [_title release];
    
    [_picsum release];
    
    [super dealloc];
    
}

@end
