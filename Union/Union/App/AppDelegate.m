//
//  AppDelegate.m
//  Union
//
//  Created by 李响 on 15/6/29.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import "AppDelegate.h"


#import "PCH.h"

#import "Union_NewsViewController.h"

#import "Union_VideoViewController.h"

#import "Union_EncyViewController.h"

#import "Union_MyUnionViewController.h"

#import "VideoPlayerViewController.h"

#import "BaseTabBarController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //window
    
    self.window = [[[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]] autorelease];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
    
    
    [self loadRootView];
    
    return YES;
    
}

//加载主视图

- (void)loadRootView{

    //联盟资讯
    
    Union_NewsViewController *UNVC = [[Union_NewsViewController alloc]init];
    
    UINavigationController *newsNC = [[UINavigationController alloc]initWithRootViewController:UNVC];
    
    //设置视图控制器
    
    UNVC.title = @"资讯";
    
    
    //设置导航控制器
    
    newsNC.tabBarItem.title = @"联盟资讯";
    
    newsNC.tabBarItem.image = [UIImage imageNamed:@"iconfont-news"];
    
    newsNC.navigationBar.translucent = NO;//不透明
    
    newsNC.navigationBar.barTintColor = MAINCOLOER;
    
    newsNC.navigationBar.barStyle=UIBarStyleBlackOpaque;
    
    
    //---------------------------------------------
    
    //视频直播
    
    Union_VideoViewController *UVVC = [[Union_VideoViewController alloc]init];
    
    UINavigationController *videoNC = [[UINavigationController alloc]initWithRootViewController:UVVC];
    
    //设置视图控制器
    
    UVVC.title = @"视频";
    
    
    //设置导航控制器
    
    videoNC.tabBarItem.title = @"视频直播";
    
    videoNC.tabBarItem.image = [UIImage imageNamed:@"iconfont-zhiboluxiang"];
    
    videoNC.navigationBar.translucent = NO;//不透明
    
    videoNC.navigationBar.barTintColor = MAINCOLOER;
    
    videoNC.navigationBar.barStyle=UIBarStyleBlackOpaque;
    
    
    //---------------------------------------------

    
    
    
    //联盟百科
    
    Union_EncyViewController *UEVC = [[Union_EncyViewController alloc]init];
    
    UINavigationController *encyNC = [[UINavigationController alloc]initWithRootViewController:UEVC];
    
    
    //设置视图控制器
    
    UEVC.title = @"百科";
    
    
    //设置导航控制器
    
    encyNC.tabBarItem.title = @"联盟百科";
    
    encyNC.tabBarItem.image = [UIImage imageNamed:@"iconfont-ency"];
    
    encyNC.navigationBar.translucent = NO;//不透明
    
    encyNC.navigationBar.barTintColor = MAINCOLOER;
    
    encyNC.navigationBar.barStyle=UIBarStyleBlackOpaque;
    
    //---------------------------------------------

    
    
    
    //我的联盟
    
    Union_MyUnionViewController *UMUVC = [[Union_MyUnionViewController alloc]init];
    
    UINavigationController *myunionNC = [[UINavigationController alloc]initWithRootViewController:UMUVC];
    
    
    //设置视图控制器
    
    UMUVC.title = @"我的";
    
    
    //设置导航控制器
    
    myunionNC.tabBarItem.title = @"我的";
    
    myunionNC.tabBarItem.image = [UIImage imageNamed:@"iconfont-wode"];
    
    myunionNC.navigationBar.translucent = NO;//不透明
    
    myunionNC.navigationBar.barTintColor = MAINCOLOER;
    
    myunionNC.navigationBar.barStyle=UIBarStyleBlackOpaque;//
    
    //---------------------------------------------

    
    
    
    
    //UITabBarController
    
    BaseTabBarController *tabBarController = [[BaseTabBarController alloc]init];
    
    tabBarController.tabBar.translucent = NO;//不透明
    
    tabBarController.viewControllers = @[newsNC , videoNC , encyNC , myunionNC];
    
    tabBarController.tabBar.tintColor = MAINCOLOER;
    
    self.window.rootViewController = tabBarController;
    
    
    
    
    //-------------------释放--------------------------
    
    [UNVC release];
    
    [newsNC release];
    
    [UVVC release];
    
    [videoNC release];
    
    [UEVC release];
    
    [encyNC release];
    
    [UMUVC release];
    
    [myunionNC release];
    
    [tabBarController release];
    
    
    
    
    
}

-(void)dealloc {
    
    [_window release];
    
    [super dealloc];
    
}

//禁止横屏

//- (NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
//{
//        
//    return UIInterfaceOrientationMaskPortrait;
//    
//}


#pragma mark ---


//当网络改变时

-(void)coreNetworkChangeNoti:(NSNotification *)noti{
    
    NSString *stateString = nil;
    
    //获取当前网络状态
    
    CoreNetWorkStatus currentStatus = [CoreStatus currentNetWorkStatus];
    
    switch (currentStatus) {
            
        case CoreNetWorkStatusNone:
            
            stateString = @"无网络";
            
            break;
            
        case CoreNetWorkStatusWifi:
            
            stateString = @"Wifi网络";
            
            break;
            
        case CoreNetWorkStatusWWAN:
            
            stateString = @"蜂窝网络";
            
            break;
            
        case CoreNetWorkStatus2G:
            
            stateString = @"2G网络";
            
            break;
            
        case CoreNetWorkStatus3G:
            
            stateString = @"3G网络";
            
            break;
            
        case CoreNetWorkStatus4G:
            
            stateString = @"4G网络";
            
            break;
            
        case CoreNetWorkStatusUnkhow:
            
            stateString = @"未知网络";
            
            break;
            
        default:
            

            
            break;
            
    }
    
    [UIView addLXNotifierWithText:[NSString stringWithFormat:@"您正处于%@状态",stateString] dismissAutomatically:YES];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    
    //应用程序将要入非活动状态
    
    //移除网络状态监听
    
    [CoreStatus endNotiNetwork:self];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    //程序被推送到后台
    
    
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    
    //程序从后台将要重新回到前台
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    //应用程序入活动状态
    
    //监听网络状态
    
    [CoreStatus beginNotiNetwork:self];
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    
    //应用程序即将终止时
    
    

}

@end
