//
//  DataCache.h
//  Union
//
//  Created by 李响 on 15/7/26.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataCache : NSObject


+(DataCache *)shareDataCache;


//保存数据到Document下指定文件夹下

- (void)saveDataForDocumentWithData:(id)data DataName:(NSString *)dataName;

//在Document下指定文件夹下获取指定数据

- (id)getDataForDocumentWithDataName:(NSString *)dataName;


@end
