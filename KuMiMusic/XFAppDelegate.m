//
//  XFAppDelegate.m
//  KuMiMusic
//
//  Created by qisheng on 14-8-10.
//  Copyright (c) 2014年 KuMi. All rights reserved.
//

#import "XFAppDelegate.h"
#import "XFGobalBBCViewController.h"
#import "XFMyMusicBaseController.h"
#import "XFCoustomTabBarView.h"
@implementation XFAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    XFGobalBBCViewController *bbFMCtl = [[XFGobalBBCViewController alloc] init];
    UINavigationController *bbFmNav = [[UINavigationController alloc] initWithRootViewController:bbFMCtl];
    XFMyMusicBaseController *loactionCtl = [[XFMyMusicBaseController alloc] init];
    UINavigationController *locationFmNav = [[UINavigationController alloc] initWithRootViewController:loactionCtl];
    
    UITabBarController *rootTabCtl = [[UITabBarController alloc] init];
    rootTabCtl.viewControllers = @[locationFmNav,bbFmNav];
    rootTabCtl.tabBar.hidden = YES;
    UIView *transtionView = rootTabCtl.view.subviews[0];
    transtionView.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT-39);
    
    XFCoustomTabBarView *tabBarCoustemView = [[XFCoustomTabBarView alloc] initWithFrame:CGRectMake(0,transtionView.frame.size.height,transtionView.frame.size.width,39) andViewControllers:rootTabCtl.viewControllers];
    tabBarCoustemView.tabBarCtl = rootTabCtl;
    [rootTabCtl.view addSubview:tabBarCoustemView];
    self.window.rootViewController = rootTabCtl;

    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
