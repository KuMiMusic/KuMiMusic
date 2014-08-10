//
//  XFMyMusicBaseController.m
//  XFFMAudioPlayer
//
//  Created by qisheng on 14-8-1.
//  Copyright (c) 2014年 QiSheng. All rights reserved.
//

#import "XFMyMusicBaseController.h"
#import "XFAudioBaseListController.h"
#import "XFLocationBannerView.h"
#import "XFLocationBaseCell.h"
#import "XFAudio.h"
@interface XFMyMusicBaseController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation XFMyMusicBaseController
{
    UITableView *lactionTableView;
    NSMutableArray *tableViewArray;
    NSMutableArray *bannerDataArray;
}
- (id)init
{
    self = [super init];
    if (self) {
        self.title = @"我的音乐";
        self.view.backgroundColor = [UIColor clearColor];
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    lactionTableView = [[UITableView alloc] initWithFrame:CGRectMake(0,-44, SCREENWIDTH, SCREENHEIGHT) style:UITableViewStylePlain];
    lactionTableView.delegate = self;
    lactionTableView.dataSource = self;
    lactionTableView.showsVerticalScrollIndicator = NO;
    bannerDataArray = [[NSMutableArray alloc] initWithObjects:@"1",@"2",@"3",nil];
    
    XFLocationBannerView *headView = [[XFLocationBannerView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 180) andArray:bannerDataArray];
    headView.backgroundColor = [UIColor purpleColor];
    lactionTableView.tableHeaderView = headView;
    [self.view addSubview:lactionTableView];
    [self loadLocationData];
}
#pragma mark--
#pragma mark--private meothes

-(void)loadLocationData{
    tableViewArray  = [NSMutableArray array];
    NSArray *cellTitle = @[@"本地歌曲",@"下载管理",@"最近收听",@"我的收藏"];
    NSArray *cellLogo = @[@"xf_loctionfile",@"xf_loctiondownload",@"xf_mycentlisen",@"xf_radarLove"];
  dispatch_async(dispatch_get_global_queue(0, 0), ^{
      //获取ipod歌曲列表
      NSArray *ipodArray = [self getAllCollection];
      //获取下载的歌曲列表
      NSArray *downloadArray = nil;
      
      for (int i = 0; i<cellTitle.count; i++) {
          XFLocationCellMode *mode = [[XFLocationCellMode alloc] init];
          mode.itemTitle = cellTitle[i];
          mode.songNumber = @"0首歌曲";
          mode.audioListArray = nil;
          if (ipodArray.count>0 && i == 0) {
              mode.songNumber = [NSString stringWithFormat:@"%d首歌曲",ipodArray.count];
              mode.audioListArray = ipodArray;
          } else if(downloadArray.count>0 &&i == 1) {
              mode.songNumber = [NSString stringWithFormat:@"%d首歌曲",downloadArray.count];
              mode.audioListArray = downloadArray;
          }
          mode.logoName = cellLogo[i];
         [tableViewArray addObject:mode];
      }
      dispatch_async(dispatch_get_main_queue(), ^{
          [lactionTableView reloadData];
      });
  });
    
}
-(NSArray *)getAllCollection {
    NSMutableArray *ipodArray = [NSMutableArray array];
    //得到MPMediaItem
    NSArray *itemsFromGenericQuery = [[MPMediaQuery songsQuery] items];
    for (int i = 0; i < itemsFromGenericQuery.count ; i++) {
        MPMediaItem *item = itemsFromGenericQuery[i];
        if ([[item valueForProperty:MPMediaItemPropertyMediaType] intValue]!= MPMediaTypeMusic) {
            continue;
        }
        XFAudio *audio = [[XFAudio alloc] init];
        audio.title = [item valueForProperty:MPMediaItemPropertyTitle];
        audio.artist = [item valueForProperty:MPMediaItemPropertyArtist];
        audio.album  = [item valueForProperty:MPMediaItemPropertyAlbumTitle];
        NSString *playurl = [[item valueForProperty:MPMediaItemPropertyAssetURL] absoluteString];
        audio.play_uri = playurl;
        audio.download_url = playurl;
        audio.remote_play_uri = playurl;
        audio.audioID = playurl;
        audio.isIpodSource = YES;
        audio.audioType = 1;
        audio.album_id = [item valueForProperty:MPMediaItemPropertyAlbumPersistentID];
        audio.album_art = [item valueForProperty:MPMediaItemPropertyAlbumArtist];
        CGSize size = CGSizeMake(60, 60);
        audio.albumCover = [[item valueForProperty:MPMediaItemPropertyArtwork] imageWithSize:size];
        audio.mediaItem= item;
        [ipodArray addObject:audio];
    }
    return ipodArray;
}
#pragma mark --
#pragma mark --UITableViewDelegate,UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return tableViewArray.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath: (NSIndexPath *)indexPath{
    static NSString *cellID = @"cellID";
    XFLocationBaseCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (nil==cell) {
        cell = [[XFLocationBaseCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    XFLocationCellMode *mode = tableViewArray[indexPath.row];
    [cell refreshBaseCellWithMode:mode];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.0;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    XFLocationCellMode *mode = tableViewArray[indexPath.row];
    XFAudioBaseListController *baseListCtl = [[XFAudioBaseListController alloc] init];
    baseListCtl.title = mode.itemTitle;
    baseListCtl.ipodAudioArray = mode.audioListArray;
    [self.navigationController pushViewController:baseListCtl animated:YES];
}
#pragma mark--
#pragma mark--system others Meothes
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
