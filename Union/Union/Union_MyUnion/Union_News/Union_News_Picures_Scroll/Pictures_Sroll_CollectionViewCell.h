//
//  Pictures_Sroll_CollectionViewCell.h
//  Union
//
//  Created by lanou3g on 15/7/22.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Pictures_Sreoll_Model.h"

@interface Pictures_Sroll_CollectionViewCell : UICollectionViewCell<UIScrollViewDelegate,UIGestureRecognizerDelegate>


@property (nonatomic, retain) Pictures_Sreoll_Model *model;

@property (nonatomic, retain) UIImageView *imageView;

@property (nonatomic, retain) UILabel *titleLable;

@property (nonatomic, retain) UIScrollView *scrollView;



@end
