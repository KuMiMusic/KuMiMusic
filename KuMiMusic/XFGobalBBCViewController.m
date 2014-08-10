//
//  SOGobalBBCViewController.m
//  SongOne
//
//  Created by qisheng on 14-4-7.
//  Copyright (c) 2014年 xiaoran. All rights reserved.
//

#import "XFGobalBBCViewController.h"
#import "XFFMListController.h"
#import "SO_FMCategroyView.h"
@interface XFGobalBBCViewController ()<SO_FMCategroyViewDelegate>

@end

@implementation XFGobalBBCViewController
{
    UIView *toolBarView;
    UIScrollView *fmScrollView;
}
-(id)init{
     self =  [super init];
    if (self) {
     self.title = @"环球FM";
     self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

#pragma mark--
#pragma mark--life Cicyle Meothes
- (void)viewDidLoad
{
    [super viewDidLoad];
    fmScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,64,SCREENWIDTH,SCREENHEIGHT-64)];
    fmScrollView.backgroundColor= [UIColor yellowColor];
    fmScrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:fmScrollView];
    [self loadDataFMFormNetWork];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
#pragma mark--
#pragma mark--Private Meothes
-(void)loadDataFMFormNetWork{
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"广播电台在线听地址" ofType:@"txt"];
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        NSArray *dictArray = [self decodeFmRadioWithData:data];
        [self refreshScrollViewData:dictArray];
}

-(void)refreshScrollViewData:(NSArray*)dataArray{
    int row = dataArray.count/2;
    if (dataArray.count%2 == 1) {
        row++;
    }
    fmScrollView.contentSize = CGSizeMake(320, row*180);
    for (int i =0; i< row; i++) {
        for (int j = 0; j<2; j++) {
            int tag = 2*i + j;
            if (tag >= dataArray.count) {
                return;
            }
            NSDictionary *dict = dataArray[tag];
            SO_FMCategroyView *fmView = [[SO_FMCategroyView alloc] initWithFrame:CGRectMake(0,-64,145,180) andData:dict];
            fmView.delegate = self;
            fmView.tag = 3000+tag;
            fmView.frame = CGRectMake(10+155*j, -54+185*i, 145, 180);
            [fmScrollView addSubview:fmView];
        }
    }
}

#pragma mark--
#pragma mark--SO_FMCategroyViewDelegate
-(void)showFMRadioListWithData:(NSDictionary *)dict{
    XFFMListController *fmlistCtl = [[XFFMListController alloc] init];
    fmlistCtl.fmDict =  dict;
    [self.navigationController pushViewController:fmlistCtl animated:YES];
}


#pragma mark--
#pragma mark--解析电台
-(NSArray*)decodeFmRadioWithData:(NSData*)data{
    NSString *dataString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSMutableArray *dictArray = [NSMutableArray array];
    //解析类别
    NSArray *sectionArray = [dataString componentsSeparatedByString:@"\r\n***"];
    for (int i = 0; i<sectionArray.count; i++) {
        NSMutableDictionary *audioDict = [NSMutableDictionary dictionary];
        NSString *subDataStr = sectionArray[i];
        if (subDataStr.length>0) {
         NSArray *subArray = [subDataStr componentsSeparatedByString:@"***\r\n"];
         NSArray *objArray = [subArray[1] componentsSeparatedByString:@"\r\n"];
            NSLog(@"==%@",[subArray[0] stringByRemovingPercentEncoding]);
            NSLog(@"objArray == %@",objArray);
         [audioDict setObject:subArray[0] forKey:@"text"];
         [audioDict setObject:objArray forKey:@"FMRadio"];
         [audioDict setObject:[NSString stringWithFormat:@"%d",objArray.count] forKey:@"count"];
         [dictArray addObject:audioDict];
        }
    }
    return dictArray;
}
@end
