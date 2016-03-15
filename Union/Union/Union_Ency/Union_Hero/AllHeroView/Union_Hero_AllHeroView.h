//
//  Union_Hero_AllHeroView.h
//  Union
//
//  Created by HarrisHan on 15/7/13.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^HeroDetailBlock)(NSString *heroName);

@interface Union_Hero_AllHeroView : UIView

//英雄详情block

@property (nonatomic , copy ) HeroDetailBlock heroDetailBlock;

@end
