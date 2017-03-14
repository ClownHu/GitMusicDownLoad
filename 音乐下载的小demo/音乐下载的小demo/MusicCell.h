//
//  MusicCell.h
//  音乐下载的小demo
//
//  Created by 胡卓 on 2017/3/14.
//  Copyright © 2017年 胡卓. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MusicModel.h"
@interface MusicCell : UITableViewCell

@property(nonatomic,strong) MusicModel *model;
@property (weak, nonatomic) IBOutlet UILabel *musicLabel;
@property (weak, nonatomic) IBOutlet UIButton *startBtn;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@end
