//
//  XFLocationCellMode.h
//  XFFMAudioPlayer
//
//  Created by qisheng on 14-8-2.
//  Copyright (c) 2014年 QiSheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XFLocationCellMode : NSObject
@property (nonatomic ,copy) NSString *itemTitle;
@property (nonatomic ,copy) NSString *songNumber;
@property (nonatomic ,copy) NSString *logoName;

@property (nonatomic ,strong) NSArray *audioListArray;

@end
