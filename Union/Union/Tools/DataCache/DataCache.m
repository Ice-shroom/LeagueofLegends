//
//  DataCache.m
//  Union
//
//  Created by 李响 on 15/7/26.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import "DataCache.h"



@implementation DataCache



+(DataCache *)shareDataCache{
    
    static DataCache *dataCache = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        dataCache = [[DataCache alloc]init];
        
    });
    
    return dataCache;
    
}

#pragma mark ---获取document路径

- (NSString *)documentPath{
    
    NSArray *array = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    return array.firstObject;
    
}

#pragma mark ---document下创建文件夹并获取文件夹路径

- (NSString *)documentFileManagerPathWithFileName:(NSString *)fileName{
    
    NSString *documentPath = [self documentPath];
    
    //创建一个文件夹对象
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSString *filePath = [[NSString stringWithFormat:@"%@/datacache",documentPath] stringByAppendingPathComponent:fileName];
    
    //判断该文件夹是否存在
    if(![fileManager fileExistsAtPath:filePath])
    {

        //不存在创建文件夹 在document/datacache文件下
        
        [fileManager createDirectoryAtPath:filePath withIntermediateDirectories:YES attributes:nil error:nil];


    }
    
    return filePath;
    
}

#pragma mark ---保存数据到Document下指定文件夹下

- (void)saveDataForDocumentWithData:(id)data DataName:(NSString *)dataName{
    if (data != nil) {
        
        //将JSON数据转换成Data 存储
        
        NSData *tempData = [NSJSONSerialization dataWithJSONObject:data options:NSJSONWritingPrettyPrinted error:nil];
        
        [tempData writeToFile:[[self documentFileManagerPathWithFileName:dataName] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.json" , dataName ]] atomically:YES];

    }

}


#pragma mark ---在Document下指定文件夹下获取指定数据

- (id)getDataForDocumentWithDataName:(NSString *)dataName{
    NSData *tempData = [NSData dataWithContentsOfFile:[[self documentFileManagerPathWithFileName:dataName] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.json" , dataName ]]];
    
    if (tempData != nil) {
        
        //从本地获取数据 并转化成JSON格式
        
        return [NSJSONSerialization JSONObjectWithData:tempData options:NSJSONReadingMutableContainers error:nil];
        
    } else {
        
        return nil;
        
    }
    
}














@end
