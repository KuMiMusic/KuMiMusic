//
//  XFLocationBaseCell.m
//  XFFMAudioPlayer
//
//  Created by qisheng on 14-8-6.
//  Copyright (c) 2014年 QiSheng. All rights reserved.
//

#import "XFLocationBaseCell.h"

@implementation XFLocationBaseCell
{
    UIImageView *logoImageView;
    UILabel *itemLable;
    UILabel *subNumbleLable;
    UIButton *playButton;
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5,10,40,40)];
        
        [self.contentView addSubview:logoImageView];
        
        itemLable = [[UILabel alloc] initWithFrame:CGRectMake(50,10,150,20)];
        [self.contentView addSubview:itemLable];
        
        subNumbleLable = [[UILabel alloc] initWithFrame:CGRectMake(50,30,150,20)];
       [self.contentView addSubview:subNumbleLable];
        playButton = [UIButton buttonWithType:UIButtonTypeCustom];
        playButton.frame = CGRectMake(SCREENWIDTH-50,10, 35, 35);
       [playButton setBackgroundImage:[UIImage imageNamed:@"xf_play_icon"] forState:UIControlStateNormal];
        [playButton addTarget:self action:@selector(playAudioListBegainButton:) forControlEvents:UIControlEventTouchUpInside];
       [self.contentView addSubview:playButton];
    }
    return self;
}

-(void)refreshBaseCellWithMode:(XFLocationCellMode*)mode{
    logoImageView.image = [UIImage imageNamed:mode.logoName];
    itemLable.text = mode.itemTitle;
    subNumbleLable.text  =  mode.songNumber;
}


-(void)playAudioListBegainButton:(UIButton*)btn{
    NSLog(@"playAudioListBegainButton");
}
- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
