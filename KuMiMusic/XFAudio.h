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
@property(nonatomic,copy) NSString  *actor;
@property(nonatomic,copy) NSString  *album;

@property(nonatomic,copy) NSString *lyric; //歌词
@property(nonatomic,copy) NSString  *play_uri;
@property(nonatomic,copy) NSString  *album_id;
@property(nonatomic,copy) NSString  *remote_play_uri;
@property(nonatomic,copy) NSString  *album_art;
@property(nonatomic,copy) NSString  *download_url;
@property(nonatomic,copy) NSString *style; //歌曲所属风格如：流行，摇滚。
@property(nonatomic,copy) NSString *description;//歌曲描述
@property(nonatomic,strong)NSString *coderate;//码率。
@property(nonatomic,copy) NSString *remark;//评论
@property(nonatomic,copy) NSString *audioImge; //歌曲图片。

@property(nonatomic,strong) MPMediaItem *mediaItem;
//audioType :0为网络歌曲，1为ipod歌曲，2为Document目录下歌曲
@property(nonatomic,assign) NSInteger audioType;
@property(nonatomic,copy) NSString *audiosize;
@property(nonatomic,copy) NSString *audioformat; //如 mp3,mp4. wav
@property(nonatomic,assign)   BOOL isIpodSource;
@property(nonatomic,copy)  NSString *albumCover_url;
@property(nonatomic,strong)  UIImage  *albumCover; //  封面图片

//涮新UI使用
@property (nonatomic,assign) BOOL isSelected;

@end
