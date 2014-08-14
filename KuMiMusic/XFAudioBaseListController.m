//
//  XFAudioBaseListController.m
//  XFFMAudioPlayer
//
//  Created by qisheng on 14-8-5.
//  Copyright (c) 2014年 QiSheng. All rights reserved.
//

#import "XFAudioBaseListController.h"
#import "XFPlayerBoxView.h"
@interface XFAudioBaseListController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation XFAudioBaseListController
{
    UITableView *musicTableView;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    musicTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH,SCREENHEIGHT) style:UITableViewStylePlain];
    musicTableView.delegate = self;
    musicTableView.dataSource = self;
    [self.view addSubview:musicTableView];
}
#pragma mark --
#pragma mark --UITableViewDelegate,UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _ipodAudioArray.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath: (NSIndexPath *)indexPath{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (nil==cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    XFAudio *auido = _ipodAudioArray[indexPath.row];
    cell.textLabel.text = auido.title;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
     XFAudio *auido = _ipodAudioArray[indexPath.row];
    
    //开始播放本地歌曲
    XFAudioPayerManager *playManager = [XFAudioPayerManager shareDistance];
    //不是播放当前的歌曲
    if (!playManager.currentBoxPlayer.currentAudio || ![playManager.currentBoxPlayer.currentAudio.audioID isEqualToString:auido.audioID]) {
        [playManager.currentBoxPlayer xfBoxPlayerStartWithAudio:auido];
          NSLog(@"播放本地歌曲");
    }
    //如果是当前播放的歌曲
    else {
     //弹出播放界面，继续播放
        NSLog(@"弹出播放界面，继续播放");
        XFAppDelegate *app = (XFAppDelegate*)[UIApplication sharedApplication].delegate;
        XFPlayerBoxView *playerBoxView = [[XFPlayerBoxView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT) withAudio:auido];
        [app.window addSubview:playerBoxView];
    }
}
#pragma mark--
#pragma mark-- system otheres Moethes
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
