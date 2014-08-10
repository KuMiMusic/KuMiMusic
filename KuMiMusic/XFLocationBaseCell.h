//
//  XFLocationBaseCell.h
//  XFFMAudioPlayer
//
//  Created by qisheng on 14-8-6.
//  Copyright (c) 2014年 QiSheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XFLocationCellMode.h"
@interface XFLocationBaseCell : UITableViewCell
-(void)refreshBaseCellWithMode:(XFLocationCellMode*)mode;
@end
