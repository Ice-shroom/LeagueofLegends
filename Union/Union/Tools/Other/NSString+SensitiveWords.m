//
//  NSString+SensitiveWords.m
//  Union
//
//  Created by 李响 on 15/7/28.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import "NSString+SensitiveWords.h"

@implementation NSString (SensitiveWords)

//清除字符串敏感词

-(NSString *)removeSensitiveWordsWithArray:(NSArray *)array{
    
    for (NSString * item in array) {
        
        self = [self stringByReplacingOccurrencesOfString:item withString:@""];
        
    }
    
    return self;
    
}

@end
