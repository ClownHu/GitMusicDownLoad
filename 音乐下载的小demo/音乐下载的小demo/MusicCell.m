//
//  MusicCell.m
//  音乐下载的小demo
//
//  Created by 胡卓 on 2017/3/14.
//  Copyright © 2017年 胡卓. All rights reserved.
//

#import "MusicCell.h"

@implementation MusicCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

//重写setter方法
-(void)setModel:(MusicModel *)model {
    
    _model = model;
    _musicLabel.text = model.name;
    [_startBtn setTitle:@"开始" forState:UIControlStateNormal];
    _progressView.progress = 0.5;
}

@end
