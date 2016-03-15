//
//  NSString+URL.m
//  Union
//
//  Created by HarrisHan on 15/7/1.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import "NSString+URL.h"

@implementation NSString (URL)

//URL转Encoded

- (NSString *)URLEncodedString
{
    NSString *encodedString = (NSString *)
    CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                            (CFStringRef)self,
                                            (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]",
                                            NULL,
                                            kCFStringEncodingUTF8);
    return [encodedString autorelease];
}

@end
