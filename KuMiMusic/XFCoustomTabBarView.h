//
//  XFCoustomTabBarView.h
//  XFFMAudioPlayer
//
//  Created by qisheng on 14-8-1.
//  Copyright (c) 2014年 QiSheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XFCoustomTabBarView : UIView
@property (nonatomic,strong) UITabBarController *tabBarCtl;
-(id)initWithFrame:(CGRect)frame andViewControllers:(NSArray*)viewControllers;
@end
