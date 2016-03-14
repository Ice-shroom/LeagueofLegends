//
//  Union_News_PrettyPictures_View.h
//  Union
//
//  Created by lanou3g on 15/7/20.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PCH.h"

typedef void (^PrettyPicturesBlock)(NSString *string);

@interface Union_News_PrettyPictures_View : UIView

@property (nonatomic, copy) PrettyPicturesBlock prettyPicturesBlock;

@property (nonatomic, copy) NSString *urlString;

@end
