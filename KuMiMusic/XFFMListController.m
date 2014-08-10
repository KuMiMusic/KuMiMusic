//
//  SOFMListController.m
//  SongOne
//
//  Created by qisheng on 14-7-7.
//  Copyright (c) 2014年 xiaoran. All rights reserved.
//
BOOL isPlayBlock = NO;
BOOL isRestartAudio=NO;

typedef enum {
    kTCP = 0,
    kUDP
}kNetworkWay;

#import "XFFMListController.h"
#import "XFFMAudioMode.h"
@interface XFFMListController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation XFFMListController
{
    UITableView *fmTableView;
    NSArray *tableViewArray;
    
    XFFMAudioMode *curFmAudio;
    
}
#pragma mark--
#pragma mark--Life Cicyle Meothes
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    NSString *middleTitel = [NSString stringWithFormat:@"%@",_fmDict[@"text"]];
    self.title = middleTitel;
    
    fmTableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0,320, 568-64) style:UITableViewStylePlain];
    fmTableView.delegate = self;
    fmTableView.dataSource = self;
    [self.view addSubview:fmTableView];
    
    [self loadFromNetworkFMList];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
  
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if (curFmAudio) {
        //[self stopPlayAudio];
    }
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
#pragma mark--
#pragma mark--private Meothes
-(void)loadFromNetworkFMList{
    if (1) {
        //模拟电台数据
        NSMutableArray *arrayFm = [NSMutableArray array];
       NSArray *audioArray = _fmDict[@"FMRadio"];
        for (int i = 0; i< audioArray.count; i++) {
            NSString *audioString = audioArray[i];
            if (audioString.length>0) {
                NSArray *audioData = [audioString componentsSeparatedByString:@" "];
                XFFMAudioMode *fmAudio = [[XFFMAudioMode alloc] init];
                fmAudio.fmTitle = audioData[1];
                fmAudio.fmPlayUrl = audioData[0];
                [arrayFm addObject:fmAudio];
            }
        }
        tableViewArray = arrayFm;
        [fmTableView reloadData];
        return;
    }
    
}

#pragma mark--
#pragma mark-- JsonRequestManagerDelegate
-(void)sendJsonFMRadioWithArray:(NSArray*)dataArray withType:(NSString*)string{
    if ([string isEqualToString:@"FMLIST"]) {
        NSLog(@"???==%@",dataArray);
        //tableViewArray = dataArray;
    }
}
-(void)sendJsonFMRadioFailError:(NSString*)error{
    NSLog(@"subFmList == %@",error);
}


#pragma mark --
#pragma mark --UITableViewDelegate,UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return tableViewArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath: (NSIndexPath *)indexPath{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (nil==cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    XFFMAudioMode *fmAudio = tableViewArray[indexPath.row];
    cell.textLabel.text = fmAudio.fmTitle;
    cell.textLabel.textColor = [UIColor blackColor];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    curFmAudio = tableViewArray[indexPath.row];
    if (curFmAudio) {
        //[self stopPlayAudio];
        //[self playAudioAll:YES];
    }
}
#pragma mark--
#pragma mark-- system others Meothes
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark--
#pragma mark -- FFmpeg processing
//-(void)playAudioAll:(BOOL)isClearMem
//{
//    //NSString *fmAddress = @"mms://218.28.9.99/Hxinwen"; //新闻混合
//    //@"mmst://218.61.6.228/dlyp2";
//    NSString *fmAddress = curFmAudio.fmPlayUrl;
//   //NSString *fmAddress = @"/318381.mp3";
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        if ([self initFFmpegAudioStream:fmAddress withTransferWay:kTCP] == NO)
//        {
//            NSLog(@"Init ffmpeg failed");
//            return;
//        }
//        if(isClearMem==NO&&aPlayer != nil&&aPlayer->audioPacketQueue.count>5)
//        {
//            aPlayer = [[AudioPlayer alloc] initAuido:aPlayer->audioPacketQueue withCodecCtx:(AVCodecContext *)pAudioCodeCtx];
//        }
//        else
//        {
//            aPlayer = [[AudioPlayer alloc] initAuido:nil withCodecCtx:(AVCodecContext *)pAudioCodeCtx];
//        }
//        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            if(aPlayer->audioPacketQueue.count<50||isClearMem == YES)
//            {
//                sleep(5);
//                NSLog(@"播放");
//            }
//            isRestartAudio = NO;
//            if ([aPlayer getStatus] != eAudioRunning) {
//                [aPlayer play];
//            }
//        });
//        
//        // Read Packet in another thread
//        [self readFFmpegAudioFrameAndDecode];
//    });
//}
//- (void)readFFmpegAudioFrameAndDecode
//{
//    int error;
//    AVPacket aPacket;
//    av_init_packet(&aPacket);
//    {
//        // Remote File playing
//        while (isStop == NO) {
//            //            NSLog(@"%@--putAVPacket------%d",aPlayer,aPlayer->audioPacketQueue.count);
//            // Read frame
//            error = av_read_frame(pFormatCtx, &aPacket);
//            if(isPlayBlock == YES)
//            {
//                //zzzili
//                [self RestartAudio];
//                return;
//            }
//            if (error == AVERROR_EOF) {
//                // End of playing music
//                isStop = YES;
//            } else if (error == 0) {
//                // During playing..
//                if (aPacket.stream_index == audioStream) {
//                    if ([aPlayer putAVPacket:&aPacket] <=0 ) {
//                        NSLog(@"Put Audio packet error");
//                    }
//                } else {
//                    av_free_packet(&aPacket);
//                }
//            } else {
//                // Error occurs
//                NSLog(@"av_read_frame error :%s", av_err2str(error));
//                isStop = YES;
//            }
//        }
//    }
//    NSLog(@"End of playing ffmpeg");
//}
//-(void)RestartAudio
//{
//    if(isRestartAudio == NO)
//    {
//        isRestartAudio = YES;
//        NSLog(@"重启播放线程------");
//        isStop = YES;
//        [aPlayer stop:YES];
//        [self stopPlayAudio];
//        
//        [self playAudioAll:NO];
//        isPlayBlock = NO;
//    }
//}
//- (void)stopPlayAudio
//{
//    isStop = YES;
//    [aPlayer stop:YES];
//    [self destroyFFmpegAudioStream];
//}
//- (void)destroyFFmpegAudioStream
//{
//    avformat_network_deinit();
//}
//- (BOOL)initFFmpegAudioStream:(NSString *)filePath withTransferWay:(kNetworkWay)network
//{
//    NSString *pAudioInPath;
//    AVCodec  *pAudioCodec;
//    
//    // Parse header
//    uint8_t pInput[] = {0x0ff,0x0f9,0x058,0x80,0,0x1f,0xfc};
//    tAACADTSHeaderInfo vxADTSHeader={0};
//    [AudioUtilities parseAACADTSHeader:pInput toHeader:(tAACADTSHeaderInfo *) &vxADTSHeader];
//    NSLog(@"AAA path %@", filePath);
//    // Compare the file path
//    if (strncmp([filePath UTF8String],"rtsp:", 4) == 0) {
//        pAudioInPath = filePath;
//         NSLog(@"Audio path %@", pAudioInPath);
//        isLocalFile = NO;
//    } else if (strncmp([filePath UTF8String], "mms:", 4) == 0) {
//        pAudioInPath = [filePath stringByReplacingOccurrencesOfString:@"mms:" withString:@"rtsp:"];
//        NSLog(@"Audio path %@", pAudioInPath);
//        isLocalFile = NO;
//    } else if (strncmp([filePath UTF8String], "mmsh:", 4) == 0) {
//        pAudioInPath = filePath;
//        isLocalFile = NO;
//        NSLog(@"2.audopath==%@",filePath);
//    }
//    else if (strncmp([filePath UTF8String], "mmst:", 4) == 0) {
//        pAudioInPath = filePath;
//        isLocalFile = NO;
//        NSLog(@"3.audopath==%@",filePath);
//    }
//    else if (strncmp([filePath UTF8String], "http:", 4) == 0) {
//        pAudioInPath = filePath;
//        isLocalFile = NO;
//        NSLog(@"4.audopath==%@",filePath);
//    }
//    else {
//        pAudioInPath = [[[NSBundle mainBundle] bundlePath] stringByAppendingString:filePath];
//        NSLog(@"NSBundle == %@",pAudioInPath);
//        isLocalFile = YES;
//    }
//    
//    // Register FFmpeg
//    avcodec_register_all();
//    av_register_all();
//    if (isLocalFile == NO) {
//        avformat_network_init();
//    }
//    
//    @synchronized(self) {
//        pFormatCtx = avformat_alloc_context();
//        //zzzili
//        //pFormatCtx->interrupt_callback.callback = interrupt_cb;//--------注册回调函数
//        //pFormatCtx->interrupt_callback.opaque = pFormatCtx;
//    }
//    
//    // Set network path
//    switch (network) {
//        case kTCP:
//        {
//            AVDictionary *option = 0;
//            av_dict_set(&option, "rtsp_transport", "tcp", 0);
//            // Open video file
//            if (avformat_open_input(&pFormatCtx, [pAudioInPath cStringUsingEncoding:NSASCIIStringEncoding], NULL, &option) != 0) {
//                NSLog(@"Could not open connection");
//                return NO;
//            }
//            av_dict_free(&option);
//        }
//            break;
//        case kUDP:
//        {
//            if (avformat_open_input(&pFormatCtx, [pAudioInPath cStringUsingEncoding:NSASCIIStringEncoding], NULL, NULL) != 0) {
//                NSLog(@"Could not open connection");
//                return NO;
//            }
//        }
//            break;
//    }
//    
//    pAudioInPath = nil;
//    
//    // Retrieve stream information
//    if (avformat_find_stream_info(pFormatCtx, NULL) < 0) {
//        NSLog(@"Could not find streaming information");
//        return NO;
//    }
//    
//    // Dump Streaming information
//    av_dump_format(pFormatCtx, 0, [pAudioInPath UTF8String], 0);
//    // Find the first audio stream
//    if ((audioStream = av_find_best_stream(pFormatCtx, AVMEDIA_TYPE_AUDIO, -1, -1, &pAudioCodec, 0)) < 0) {
//        NSLog(@"Could not find a audio streaming information");
//        return NO;
//    } else {
//        // Succeed to get streaming information
//        if (pAudioCodec->profiles) {
//            NSLog(@"Profile names = %@", pAudioCodec->profiles);
//        } else {
//            //            NSLog(@"Profile is Null");
//        }
//        
//        // Get a pointer to the codec context for the video stream
//        pAudioCodeCtx = pFormatCtx->streams[audioStream]->codec;
//        
//        // Find out the decoder
//        pAudioCodec = avcodec_find_decoder(pAudioCodeCtx->codec_id);
//        
//        // Open codec
//        if (avcodec_open2(pAudioCodeCtx, pAudioCodec, NULL) < 0) {
//            return NO;
//        }
//    }
//    isStop = NO;
//    
//    return YES;
//}
@end
