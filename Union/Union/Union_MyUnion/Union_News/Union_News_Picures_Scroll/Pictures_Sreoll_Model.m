//
//  Pictures_Sreoll_Model.m
//  Union
//
//  Created by 张展 on 15/7/27.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import "Pictures_Sreoll_Model.h"

@implementation Pictures_Sreoll_Model


-(void)setValue:(id)value forKey:(NSString *)key{
    
    [super setValue:value forKey:key];
}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    
}

-(void)dealloc{
    
    [_title release];
    
    [_url release];
    
    [_source release];
    
    [_fileHeight release];
    
    [_fileWidth release];
    
    [_picId release];
    
    [_picDesc release];
    
    [super dealloc];
    
}

@end
