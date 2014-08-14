//
//  XFAudioPayerManager.m
//  KuMiMusic
//
//  Created by qisheng on 14-8-12.
//  Copyright (c) 2014年 KuMi. All rights reserved.
//

#import "XFAudioPayerManager.h"

@implementation XFAudioPayerManager

-(id)init{
    self = [super init];
    if (self) {
        XFBoxAudioPlayer *audioPlayer = [[XFBoxAudioPlayer alloc] init];
        _currentBoxPlayer = audioPlayer;
        NSMutableArray *boxPlayerArray = [NSMutableArray array];
        [boxPlayerArray addObject:audioPlayer];
        _audioPlayerQueue = boxPlayerArray;
    }
    return self;
}

+(XFAudioPayerManager*)shareDistance{
    static  XFAudioPayerManager *playManager = nil;
    if (!playManager) {
        playManager = [[[self class] alloc] init];
    }
    return playManager;
}

-(void)addAudioPlayer:(XFBoxAudioPlayer*)boxplayer{
    NSMutableArray *tempBoxPlayerArray = [NSMutableArray array];
    [tempBoxPlayerArray addObjectsFromArray:_audioPlayerQueue];
    [tempBoxPlayerArray addObject:boxplayer];
    _audioPlayerQueue = tempBoxPlayerArray;
}
@end
