//
//  MusicModel.h
//  音乐下载的小demo
//
//  Created by 胡卓 on 2017/3/14.
//  Copyright © 2017年 胡卓. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MusicModel : NSObject

/**
 音乐的id
 */
@property (nonatomic, copy) NSString *audioId;

/**
 音乐的标题
 */
@property (nonatomic, copy) NSString *name;

/**
 音乐的下载地址
 */
@property (nonatomic, copy) NSString *path;

/**
 音乐的大小
 */
@property (nonatomic, copy) NSString *size;

@end
