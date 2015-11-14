//
//  YYNewsViewController.m
//  YiYuanNews
//
//  Created by fun on 15/11/12.
//  Copyright © 2015年 fun. All rights reserved.
//

#import "YYNewsViewController.h"
#import "MJRefresh.h"
#import "YYWebViewController.h"
#import "YYNewsModule.h"
#import "MJExtension.h"
#import "YYNewsPageBeanModel.h"
#import "YYNewsModel.h"
#import "YYNewsCell.h"

static NSString * cellID = @"cellID";

@interface YYNewsViewController ()
{
    BOOL _hadAutoRefresh;  //应用启动后第一次主动刷新获取最新数据，后面需要手动刷新数据，获取最新新闻
}

@property (nonatomic, strong) YYNewsModule *newsModule;

@property (nonatomic, strong) YYNewsPageBeanModel *newsPageBeanModel;

@end

@implementation YYNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _hadAutoRefresh = NO;
    // Do any additional setup after loading the view.
    [self.tableView registerClass:[YYNewsCell class] forCellReuseIdentifier:cellID];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    self.newsModule = [[YYNewsModule alloc] init];
    
    [self setupPullDownToRefreshLastestNews];
}


- (void)setNewsChannelModel:(YYNewsChannelModel *)newsChannelModel
{
    if (_newsChannelModel) {
        _newsChannelModel = nil;
    }
    _newsChannelModel = newsChannelModel;
    
    if (!_hadAutoRefresh) {
        _hadAutoRefresh = YES;
        [self.tableView.mj_header beginRefreshing];
    }
}


/**
 *  设置下拉刷新
 */
- (void)setupPullDownToRefreshLastestNews
{
    self.tableView.mj_header  = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(requestLatestNews)];
}

- (void)requestLatestNews
{
    NSLog(@"%s", __func__);
    //开始获取频道下的新闻列表
    NSLog(@"开始获取［%@］下的新闻列表 channelID:%@", _newsChannelModel.name, _newsChannelModel.channelId);
    YYNewsRequestParams *params = [YYNewsRequestParams new];
    params.channelId = _newsChannelModel.channelId;
    params.channelName = _newsChannelModel.name;
    __weak YYNewsViewController *weakSelf = self;
    [self.newsModule getNewsList:params result:^(YYNewsResponseResult *result) {
        weakSelf.newsPageBeanModel = result.showapi_res_body.pagebean;
        [weakSelf.tableView reloadData];
        [weakSelf.tableView.mj_header endRefreshing];
    }];
}

#pragma mark - UITableViewDelegate UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.newsPageBeanModel.contentlist.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YYNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    YYNewsModel *newsModel = self.newsPageBeanModel.contentlist[indexPath.row];
    cell.newsModel = newsModel;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    YYNewsModel *newsModel = self.newsPageBeanModel.contentlist[indexPath.row];
    YYWebViewController *webVC = [[YYWebViewController alloc] init];
    webVC.url = newsModel.link;
    [self.navigationController pushViewController:webVC animated:YES];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YYNewsModel *newsModel = self.newsPageBeanModel.contentlist[indexPath.row];
    CGFloat cellHeight = 100;
    if (newsModel.imageurls.count >=3) {
        cellHeight = 150;
    }
    return cellHeight;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
