//
//  SummonerDetailsViewController.h
//  Union
//
//  Created by 李响 on 15/7/20.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SummonerDetailsViewController : UIViewController

@property (nonatomic , copy ) NSString *summonerName;//用户名称(召唤师名称)

@property (nonatomic , copy ) NSString *serverName;//服务器名称(召唤师区名称)

//加载WebView

- (void)loadWebView;

@end
