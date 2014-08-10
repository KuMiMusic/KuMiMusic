//
//  XFLocationBannerView.h
//  SongOne
//
//  Created by qisheng on 14-6-18.
//  Copyright (c) 2014年 xianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XFLocationBannerView : UIView<UIScrollViewDelegate>
- (id)initWithFrame:(CGRect)frame andArray:(NSArray*)array;
-(void)refreshDataWithArray:(NSArray*)array;
@end
