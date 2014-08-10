//
//  XFLocationBannerView.m
//  SongOne
//
//  Created by qisheng on 14-6-18.
//  Copyright (c) 2014年 xianfeng. All rights reserved.
//

#import "XFLocationBannerView.h"

@implementation XFLocationBannerView
{
    UIScrollView *bannerScrollView;
    UIPageControl *pageCtl;
     BOOL isAdd;
     NSInteger index;
    NSArray *curAlbumArray;
}

- (id)initWithFrame:(CGRect)frame andArray:(NSArray*)array
{
    self = [super initWithFrame:frame];
    if (self) {
        bannerScrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        bannerScrollView.bounces=NO;
        bannerScrollView.contentSize = CGSizeMake(frame.size.width * array.count, frame.size.height);
        bannerScrollView.delegate = self;
        bannerScrollView.showsHorizontalScrollIndicator = NO;
        bannerScrollView.pagingEnabled = YES;
        [self addSubview:bannerScrollView];
        
        [self refreshDataWithArray:array];
        
        pageCtl = [[UIPageControl alloc] initWithFrame:CGRectMake(0,frame.size.height-15, frame.size.width, 10)];
        pageCtl.backgroundColor = [UIColor clearColor];
        pageCtl.pageIndicatorTintColor = [UIColor whiteColor];
        pageCtl.currentPageIndicatorTintColor = [UIColor grayColor];
        pageCtl.currentPage = 0;
        pageCtl.numberOfPages = array.count;
        [pageCtl addTarget:self action:@selector(pageCtrolValueChange:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:pageCtl];
        isAdd = YES;
        [NSTimer scheduledTimerWithTimeInterval:10.0 target:self selector:@selector(scrollBannerImageView:) userInfo:nil repeats:YES];
    }
    return self;
}

-(void)refreshDataWithArray:(NSArray*)array{
    curAlbumArray = array;
    for (UIView *view in bannerScrollView.subviews){
         [view removeFromSuperview];
    }
    bannerScrollView.contentSize = CGSizeMake(self.frame.size.width * array.count, self.frame.size.height);
    pageCtl.numberOfPages = array.count;
    pageCtl.pageIndicatorTintColor=[UIColor grayColor];
    pageCtl.currentPageIndicatorTintColor =[UIColor whiteColor];
    for (int i = 0; i<array.count; i++) {
        UIImageView *imgeBannerView = [[UIImageView alloc] initWithFrame:CGRectMake(i*self.frame.size.width, 0,self.frame.size.width,self.frame.size.height)];
        imgeBannerView.userInteractionEnabled = YES;
        imgeBannerView.contentMode = UIViewContentModeScaleAspectFill;
        imgeBannerView.clipsToBounds =YES;
        [bannerScrollView addSubview:imgeBannerView];
    }
}

-(void)pageCtrolValueChange:(UIPageControl*)pagCtl{
    [bannerScrollView scrollRectToVisible:CGRectMake(pageCtl.currentPage*self.frame.size.width, 0, self.frame.size.width, self.frame.size.height) animated:YES];
}
-(void)scrollBannerImageView:(NSTimer*)timer{
    if (isAdd) {
       index++;
    } else {
       index--;
    }
    if (index > pageCtl.numberOfPages-1) {
        index--;
        isAdd = NO;
    } else if (index < 0){
        isAdd = YES;
        index++;
    }
    pageCtl.currentPage = index;
    [bannerScrollView scrollRectToVisible:CGRectMake(index*self.frame.size.width, 0, self.frame.size.width, self.frame.size.height) animated:YES];
}

#pragma mark--
#pragma mark--UIScrollViewDelegate
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    int page = scrollView.contentOffset.x/self.frame.size.width;
    pageCtl.currentPage = page;
    index =page;
}

@end
