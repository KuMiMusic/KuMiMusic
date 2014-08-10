//
//  XFAudioBaseListController.m
//  XFFMAudioPlayer
//
//  Created by qisheng on 14-8-5.
//  Copyright (c) 2014年 QiSheng. All rights reserved.
//

#import "XFAudioBaseListController.h"
#import "XFAudio.h"
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
    
}
#pragma mark--
#pragma mark-- system otheres Moethes
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
