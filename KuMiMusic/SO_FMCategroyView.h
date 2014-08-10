//
//  SO_FMCategroyView.h
//  SongOne
//
//  Created by qisheng on 14-7-7.
//  Copyright (c) 2014年 xiaoran. All rights reserved.
//
@protocol SO_FMCategroyViewDelegate <NSObject>

-(void)showFMRadioListWithData:(NSDictionary*)dict;

@end
#import <UIKit/UIKit.h>

@interface SO_FMCategroyView : UIView
@property (nonatomic,weak) id<SO_FMCategroyViewDelegate>delegate;

- (id)initWithFrame:(CGRect)frame andData:(NSDictionary*)dict;
@end
