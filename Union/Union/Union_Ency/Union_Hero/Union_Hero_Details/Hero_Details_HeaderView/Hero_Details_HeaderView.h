//
//  Hero_Details_HeaderView.h
//  Union
//
//  Created by 张展 on 15/8/8.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Hero_Details_BasicModel.h"

@interface Hero_Details_HeaderView : UIView

@property (nonatomic , retain ) Hero_Details_BasicModel *basicModel;//数据模型

//初始化数据

- (void)initData;

@end
