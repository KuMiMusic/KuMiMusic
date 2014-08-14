//
//  XFPlayerBoxView.m
//  KuMiMusic
//
//  Created by qisheng on 14-8-13.
//  Copyright (c) 2014年 KuMi. All rights reserved.
//

#import "XFPlayerBoxView.h"

@implementation XFPlayerBoxView
{
    UIImageView *bgImageView;
    UIView *navBarView;
    UITextView *audioLricView;
    UIView *bottonBoardView;
}
- (id)initWithFrame:(CGRect)frame withAudio:(XFAudio*)audio
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT-100)];
        bgImageView.backgroundColor = [UIColor clearColor];
        bgImageView.image = audio.albumCover;
        [self addSubview:bgImageView];
        
        navBarView = [[UIView alloc] initWithFrame:CGRectMake(0,VAR, SCREENWIDTH,44)];
        navBarView.backgroundColor = [UIColor clearColor];
        UIButton *dismissButton = [UIButton buttonWithType:UIButtonTypeCustom];
        dismissButton.frame = CGRectMake(0, 0, 50, 44);
        [dismissButton setBackgroundImage:[UIImage imageNamed:@"skin_black_nav-bar-back-button"] forState:UIControlStateNormal];
        [dismissButton addTarget:self action:@selector(dismissButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        UILabel *audioNameLable = [[UILabel alloc] initWithFrame:CGRectMake(50, 0, 200, 20)];
        audioNameLable.text = audio.title;
        audioNameLable.textColor = [UIColor whiteColor];
        audioNameLable.backgroundColor = [UIColor clearColor];
        UILabel *audioAristLable = [[UILabel alloc] initWithFrame:CGRectMake(50,20, 200,12)];
        audioAristLable.text = audio.artist;
        audioAristLable.textColor = [UIColor whiteColor];
        audioAristLable.backgroundColor = [UIColor clearColor];
        [navBarView addSubview:audioNameLable];
        [navBarView addSubview:audioAristLable];
        [navBarView addSubview:dismissButton];
        [self addSubview:navBarView];
        
        audioLricView = [[UITextView alloc] initWithFrame:CGRectMake(10,VAR+navBarView.frame.size.height,SCREENWIDTH-20,SCREENHEIGHT-(VAR+navBarView.frame.size.height+100))];
        audioLricView.text = @"";
        audioLricView.backgroundColor = [UIColor clearColor];
        [self addSubview:audioLricView];
        bottonBoardView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREENHEIGHT-100,SCREENWIDTH, 100)];
        [self addSubview:bottonBoardView];
    }
    return self;
}

-(void)dismissButtonClick:(UIButton*)btn{
    [self removeFromSuperview];
}
@end
