//
//  Union_News_Headlines_TableViewCell.h
//  Union
//
//  Created by lanou3g on 15/7/18.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Union_News_TableView_Model.h"


@interface Union_News_TableViewCell : UITableViewCell

@property (nonatomic, retain) UIImageView *photoImageView;

@property (nonatomic, retain) UILabel *titleLabel;

@property (nonatomic, retain) UILabel *contentLabel;

@property (nonatomic, retain) UILabel *timeLabel;

@property (nonatomic, retain) UILabel *readCountLabel;

@property (nonatomic, retain) UILabel *readWordLabel;

@property (nonatomic, retain) UILabel *photoVideoLabel;

@property (nonatomic, retain) UIView *whiteView;



@property (nonatomic, retain) Union_News_TableView_Model *model;//数据模型

@end
