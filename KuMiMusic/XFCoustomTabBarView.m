//
//  XFCoustomTabBarView.m
//  XFFMAudioPlayer
//
//  Created by qisheng on 14-8-1.
//  Copyright (c) 2014年 QiSheng. All rights reserved.
//

#import "XFCoustomTabBarView.h"

@implementation XFCoustomTabBarView
-(id)initWithFrame:(CGRect)frame andViewControllers:(NSArray*)viewControllers{
   
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *bgImagView = [[UIImageView alloc] initWithFrame:self.bounds];
        bgImagView.image = [UIImage imageNamed:@"narbar_bg"];
        [self addSubview:bgImagView];
        for (int i = 0;i< viewControllers.count;i++) {
            UIViewController *tempCtl = viewControllers[i];
            UIButton *tempBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            tempBtn.frame = CGRectMake(i*(SCREENWIDTH/viewControllers.count), 0, SCREENWIDTH/viewControllers.count, frame.size.height);
            [tempBtn setTitle:tempCtl.title forState:UIControlStateNormal];
            [tempBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
            tempBtn.tag = i;
            [tempBtn addTarget:self action:@selector(showCurrentViewController:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:tempBtn];
        }
    }
    return self;
}

-(void)showCurrentViewController:(UIButton*)btn{
    _tabBarCtl.selectedIndex = btn.tag;
}
@end
