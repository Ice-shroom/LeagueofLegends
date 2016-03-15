//
//  Union_News_PrettyPictures_CollectionViewCell.h
//  Union
//
//  Created by HarrisHan on 15/7/27.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Union_News_PrettyPictures_Model.h"

@interface Union_News_PrettyPictures_CollectionViewCell : UICollectionViewCell


@property (nonatomic, retain) UIImageView *coverImageView;

@property (nonatomic, retain) UILabel *titleLable;

@property (nonatomic, retain) UILabel *picsumLable;

@property (nonatomic, retain) Union_News_PrettyPictures_Model *model;



@end
