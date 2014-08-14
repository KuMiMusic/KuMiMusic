//
//  XFDefine.h
//  KuMiMusic
//
//  Created by qisheng on 14-8-10.
//  Copyright (c) 2014年 KuMi. All rights reserved.
//

#ifndef KuMiMusic_Header_h
#define KuMiMusic_Header_h

#endif
/************************Start Size Screen***********************/
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height
//判断系统得版本号7.0
#define IOS_VERSION_7_OR_ABOVE (([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)? (YES):(NO))
#define VAR (IOS_VERSION_7_OR_ABOVE ?20:0)
/*********************End Size Screen*************************/