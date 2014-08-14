//
//  XFAudio.h
//  SongOne
//
//  Created by mac on 14-1-16.
//  Copyright (c) 2014年 xianfeng. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import <MediaPlayer/MPMediaItem.h>
#import <AVFoundation/AVAsset.h>
#import <AVFoundation/AVAssetExportSession.h>
#import <MobileCoreServices/UTCoreTypes.h>
#import <MobileCoreServices/UTType.h>
#import <AVFoundation/AVMetadataFormat.h>

@interface XFAudio : NSObject

@property(nonatomic,copy) NSString *audioID;
@property(nonatomic,strong) NSString *title;
@property(nonatomic,copy) NSString  *artist;
@property(nonatomic,copy) NSString  *album;
@property(nonatomic,copy) NSString *lyric; //歌词
@property(nonatomic,copy) NSString  *play_uri;
@property(nonatomic,strong) NSURL     *playURL;
@property(nonatomic,copy) NSString  *remote_play_uri;
@property(nonatomic,copy) NSString  *download_url;
@property(nonatomic,copy) NSString *audioImge; //歌曲图片。
@property(nonatomic,copy) NSString *album_id;
@property(nonatomic,copy) NSString *album_arist;
@property(nonatomic,strong) UIImage *albumCover;
//audioType :0为网络歌曲，1为ipod歌曲，2为Document目录下歌曲
@property(nonatomic,assign) NSInteger audioType;

@end
