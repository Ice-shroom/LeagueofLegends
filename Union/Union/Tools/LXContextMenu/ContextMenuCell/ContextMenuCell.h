//
//  LXSideMenuCell.h
//  LXMenuAnimation
//
//  Created by 张展 on 15/8/4.
//  Copyright (c) 2015年 Lee. All rights reserved.
//


@import UIKit;

#import "LXContextMenuCell.h"

#import "PCH.h"

@interface ContextMenuCell : UITableViewCell <LXContextMenuCell>

@property (retain, nonatomic) IBOutlet UIImageView *menuImageView;

@property (retain, nonatomic) IBOutlet UILabel *menuTitleLabel;

@end
