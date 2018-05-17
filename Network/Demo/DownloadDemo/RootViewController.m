//
//  RootViewController.m
//  DownloadDemo
//
//  Created by 王建 on 16/4/2.
//  Copyright © 2016年 王建.com. All rights reserved.
//

#import "RootViewController.h"
#import "MyTableViewCell.h"
#import "DownloadCenter.h"
@interface RootViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) UITableView *myTableView; //

@property (nonatomic,strong) NSArray *taskArr;


@end

//  此页面用来展示正在下载的内容。四个项目
@implementation RootViewController

- (NSArray *)taskArr{
    return DDownloadCenter.taskArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _myTableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:_myTableView];
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    _myTableView.rowHeight = 100;
    
    [_myTableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"downloadCell"];
    
    DDownloadCenter.reloadData = ^(){
        [self.myTableView reloadData];
    };
    
    for (Download *task in self.taskArr) {
        NSMutableDictionary *plist = [NSMutableDictionary dictionaryWithContentsOfFile:DownloadPath.downloadedPlistPath];
        NSMutableDictionary *dic = [plist objectForKey:task.urlString];
        if ([dic[@"state"] isEqualToString:@"loading"]) {
            if (task.isDownloading == YES) {
            }else{
               [task start];
            }
            task.date = [NSDate date];
        }
    }
    
    // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// tableView的代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.taskArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"downloadCell" forIndexPath:indexPath];
    Download *task = self.taskArr[indexPath.row];
    NSDictionary *plist = [NSDictionary dictionaryWithContentsOfFile:DownloadPath.downloadedPlistPath];
    NSDictionary *taskDic = plist[task.urlString];
    task.loadingBlock = ^(long long current, float progress, float all, float writ, NSString *speed){
        cell.downloadProgressView.progress = progress;
        cell.downloadAlreadyDownloadLabel.text = [NSString stringWithFormat:@"%.1fMB", writ];
        cell.downloadTotalByteLabel.text = [NSString stringWithFormat:@"%.1fMB", all];
        cell.downloadSpeedLabel.text = speed;
    };
    cell.downloadNameLabel.text = [taskDic objectForKey:@"showName"];
    if (taskDic[@"already"]) {
        cell.downloadAlreadyDownloadLabel.text = [NSString stringWithFormat:@"%@MB", taskDic[@"already"]];
        cell.downloadTotalByteLabel.text = [NSString stringWithFormat:@"%@MB", taskDic[@"totalBytes"]];
        cell.downloadProgressView.progress = [taskDic[@"already"] floatValue]/[taskDic[@"totalBytes"] floatValue];
        cell.downloadSpeedLabel.text = @"0 KB/s";
    }else{
        cell.downloadAlreadyDownloadLabel.text = @"0MB";
        cell.downloadTotalByteLabel.text = @"∞MB";
        cell.downloadProgressView.progress = 0;
    }
    if ([taskDic[@"state"] isEqualToString:@"waiting"]) {
        [cell.downloadButton setTitle:@"暂停" forState:UIControlStateNormal];
    }else{
        [cell.downloadButton setTitle:@"下载" forState:UIControlStateNormal];
    }
    
    [cell.downloadButton addTarget:self action:@selector(downloadAction:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

- (void)downloadAction:(UIButton *)sender{
    NSMutableDictionary *plist = [NSMutableDictionary dictionaryWithContentsOfFile:DownloadPath.downloadedPlistPath];
    MyTableViewCell *cell = (MyTableViewCell *)[[sender superview] superview];
    NSIndexPath *indexPath = [self.myTableView indexPathForCell:cell];
    Download *task = self.taskArr[indexPath.row];
    NSMutableDictionary *tempDic = [plist objectForKey:task.urlString];
    if ([[tempDic objectForKey:@"state"] isEqualToString:@"loading"]) {
        [tempDic setObject:@"waiting" forKey:@"state"];
        [plist setObject:tempDic forKey:task.urlString];
        [plist writeToFile:DownloadPath.downloadedPlistPath atomically:YES];
        [sender setTitle:@"暂停" forState:UIControlStateNormal];
        cell.downloadSpeedLabel.text = @"0 KB/s";
        [DDownloadCenter suspendTask:task];
        [task cancel];
    }else{
        [tempDic setObject:@"loading" forKey:@"state"];
        [plist setObject:tempDic forKey:task.urlString];
        [plist writeToFile:DownloadPath.downloadedPlistPath atomically:YES];
        [sender setTitle:@"下载" forState:UIControlStateNormal];
        task.date = [NSDate date];
        [task start];
    }
    
}
- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
