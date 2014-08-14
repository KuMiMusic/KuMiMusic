//
//  XFAudioPayerManager.h
//  KuMiMusic
//
//  Created by qisheng on 14-8-12.
//  Copyright (c) 2014年 KuMi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XFBoxAudioPlayer.h"
@interface XFAudioPayerManager : NSObject
/*
  @prama audioPlayerQueue 播放器队列。默认为只有本机系统的播放器，如果添加更多播放器。
 */
@property (nonatomic,strong) NSArray *audioPlayerQueue;
/*
 @prama 当前使用的播放器, 默认为本机系统的播放器；
 */
@property (nonatomic,strong) XFBoxAudioPlayer *currentBoxPlayer;

+(XFAudioPayerManager*)shareDistance;

/*
 @mothes 添加更多的播放器到XFAudioPlayerManager里来，例如：FM播放器，视频播放器等
 @prama boxplayer 是当前需要添加的播放器
 */
-(void)addAudioPlayer:(XFBoxAudioPlayer*)boxplayer;
@end
