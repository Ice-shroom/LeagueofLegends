//
//  DownloadDataBaseManager.m
//  Union
//
//  Created by HarrisHan on 15/8/20.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import "DownloadDataBaseManager.h"

@implementation DownloadDataBaseManager

+ (DownloadDataBaseManager *)shareDownloadDataBaseManager{
    
    static DownloadDataBaseManager *manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manager = [[DownloadDataBaseManager alloc]init];
        
    });
    
    return manager;
    
}

















@end
