//
//  NSString+SensitiveWords.h
//  Union
//
//  Created by HarrisHan on 15/7/28.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SensitiveWords)

//清除字符串敏感词

-(NSString *)removeSensitiveWordsWithArray:(NSArray *)array;

@end
