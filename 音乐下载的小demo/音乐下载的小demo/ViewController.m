//
//  ViewController.m
//  音乐下载的小demo
//
//  Created by 胡卓 on 2017/3/14.
//  Copyright © 2017年 胡卓. All rights reserved.
//

#import "ViewController.h"
#import "MusicCell.h"
#import "YYModel.h"
#import "MusicModel.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

static NSString *rid = @"music";

@implementation ViewController {
    
    NSMutableArray *_modelList;
    
}


#pragma mark - 实现数据源方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _modelList.count;
}

-(MusicCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MusicCell *cell = [tableView dequeueReusableCellWithIdentifier:rid forIndexPath:indexPath];
    //把数据传给cell
    MusicModel *model = _modelList[indexPath.row];
    cell.model = model;
    
    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //实例化
    _modelList = [NSMutableArray array];
    //设置controller不自动调整scrollView的contentInsets
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //设置数据源
    _tableView.dataSource = self;
    //注册
    [_tableView registerNib:[UINib nibWithNibName:@"MusicCell" bundle:nil] forCellReuseIdentifier:rid];
    
    _tableView.rowHeight = 100;
    
    
    //加载网上音乐数据
    [self loadMusic];
}

-(void) loadMusic {
    
    //发起网络请求，获取列表数据
    NSURL *url = [NSURL URLWithString:@"http://42.62.15.100/yyting/snsresource/getAblumnAudios.action?ablumnId=2719&imei=RkVGNzBFMkYtNjc2QS00NkQwLUEwOTYtNUU5Q0QyOUVGMzdE&nwt=1&q=50506&sc=1438f6d61a2907bfa8b3ea0973474ac1&sortType=1&token=j5xm1WPkdnI-uxtFXlv6CsWiNfwjfQYPQb63ToXOFc8%2A"];
    
    [[[NSURLSession sharedSession]dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error != nil) {
            
            return;
        }
        
        //解析json
        NSDictionary *musicDic = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        //取出list
        NSArray *musicArr = musicDic[@"list"];
        
        //字典数组转模型数组
        _modelList = (NSMutableArray *)[NSArray yy_modelArrayWithClass:[MusicModel class] json:musicArr];
        
        //让主线程更新UI
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [_tableView reloadData];
        });
        
    }] resume];
}
@end
