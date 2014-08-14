//
//  XFBoxAudioPlayer.h
//  KuMiMusic
//
//  Created by qisheng on 14-8-12.
//  Copyright (c) 2014年 KuMi. All rights reserved.
//

typedef enum{
    BoxPlayStop = 20,
    BoxPlaying,
    BoxPlayPuase
} BoxAudioPlayerStata;
#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "XFAudio.h"
@interface XFBoxAudioPlayer : NSObject
/*
  @prama playDeviceUDN 播放器的标识，默认为"本机"
 */
@property (nonatomic,strong) NSString *playDeviceUDN;
/*
  @prama systmeAvplayer 系统播放器 默认为nil；
*/
@property (nonatomic,strong) AVPlayer *systmeAvplayer;

/*
 @prama playStata 默认为BoxPlayStop;
*/
@property (nonatomic,assign) BoxAudioPlayerStata playStata;
/*
 @prama crrentAudio 是当前播放的audio，默认值为nil；
 */
@property (nonatomic,strong) XFAudio *currentAudio;

-(void)xfBoxPlayerStartWithAudio:(XFAudio*)audio;
-(void)xfBoxPlayerPuase;
-(void)xfBoxPlayerStop;
-(CGFloat)xfBoxCurrentTime;
@end
