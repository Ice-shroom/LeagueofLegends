//
//  Union_News_Video_View.h
//  Union
//
//  Created by lanou3g on 15/7/20.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^DetailsBlock)(NSString *string , NSString *type);


@interface Union_News_TableView_View : UIView

@property (nonatomic, copy) DetailsBlock detailsBlock;

@property (nonatomic, copy) DetailsBlock topicBlock;

@property (nonatomic, retain) UITableView *tableView;

@property (nonatomic, copy) NSString *urlstring;

@end
