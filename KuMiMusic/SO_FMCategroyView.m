//
//  SO_FMCategroyView.m
//  SongOne
//
//  Created by qisheng on 14-7-7.
//  Copyright (c) 2014年 xiaoran. All rights reserved.
//

#import "SO_FMCategroyView.h"

@implementation SO_FMCategroyView
{
    NSDictionary *dataDict;
}
- (id)initWithFrame:(CGRect)frame andData:(NSDictionary*)dict
{
    self = [super initWithFrame:frame];
    if (self) {
        dataDict = dict;
        UIImageView *fmCoverView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 145,145)];
        NSString *imageUrl = [NSString stringWithFormat:@"%@",dict[@"img"]];
        fmCoverView.backgroundColor = [UIColor redColor];
        fmCoverView.userInteractionEnabled = YES;
        NSURL *url = [NSURL URLWithString:imageUrl];
        fmCoverView.image = [UIImage imageNamed:@"fm_default.jpg"];
       // [fmCoverView setImageWithURL:url placeholderImage:[UIImage imageNamed:@"xf_cover2"]];
        [self addSubview:fmCoverView];
        
        UILabel *categroyTitel = [[UILabel alloc] initWithFrame:CGRectMake(0,145,145,20)];
         NSString *textTitle = [NSString stringWithFormat:@"%@",dict[@"text"]];
        categroyTitel.text = textTitle;
        categroyTitel.font = [UIFont systemFontOfSize:12];
        categroyTitel.backgroundColor = [UIColor clearColor];
        [self addSubview:categroyTitel];
        
        UILabel *fmCountLable = [[UILabel alloc] initWithFrame:CGRectMake(0,165,145,20)];
        NSString *textCount = [NSString stringWithFormat:@"%@",dict[@"count"]];
        fmCountLable.text = textCount;
        fmCountLable.font = [UIFont systemFontOfSize:10];
        fmCountLable.textColor = [UIColor grayColor];
        fmCountLable.backgroundColor = [UIColor clearColor];
        [self addSubview:fmCountLable];
        
        UITapGestureRecognizer *imageTap = [[UITapGestureRecognizer alloc] init];
        [imageTap addTarget:self action:@selector(showFMRadiolist:)];
        [fmCoverView addGestureRecognizer:imageTap];
        
    }
    return self;
}

-(void)showFMRadiolist:(UITapGestureRecognizer*)tap{
    [self.delegate showFMRadioListWithData:dataDict];
}
@end
