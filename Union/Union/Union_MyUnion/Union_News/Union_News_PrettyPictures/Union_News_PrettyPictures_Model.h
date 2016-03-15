//
//  Union_News_PrettyPictures_Model.h
//  Union
//
//  Created by HarrisHan on 15/7/27.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Union_News_PrettyPictures_Model : NSObject


@property (nonatomic, copy) NSString *galleryId;

@property (nonatomic, copy) NSString *coverUrl;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *picsum;

@property (nonatomic, copy) NSString *coverWidth;//图片宽度

@property (nonatomic, copy) NSString *coverHeight;//图片高度

@property (nonatomic, copy) NSString *modify_time;//时间

@end
