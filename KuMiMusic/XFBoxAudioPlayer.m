//
//  XFBoxAudioPlayer.m
//  KuMiMusic
//
//  Created by qisheng on 14-8-12.
//  Copyright (c) 2014年 KuMi. All rights reserved.
//

#import "XFBoxAudioPlayer.h"

@implementation XFBoxAudioPlayer
- (instancetype)init
{
    self = [super init];
    if (self) {
       _playDeviceUDN = @"本机";
       _systmeAvplayer = nil;
       _playStata = BoxPlayStop;
    }
    return self;
}

-(void)xfBoxPlayerStartWithAudio:(XFAudio*)audio{
    _currentAudio = audio;
    
    AVPlayerItem *avItem = [AVPlayerItem playerItemWithURL:audio.playURL];
    if (!_systmeAvplayer) {
        _systmeAvplayer = [AVPlayer playerWithPlayerItem:avItem];
    } else {
        [_systmeAvplayer replaceCurrentItemWithPlayerItem:avItem];
    }
    [_systmeAvplayer play];
}
-(void)xfBoxPlayerPuase{

}
-(void)xfBoxPlayerStop{
}
-(CGFloat)xfBoxCurrentTime{
    return 0;
}
@end
