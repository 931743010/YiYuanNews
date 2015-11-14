//
//  YYPicturesViewController.m
//  YiYuanNews
//
//  Created by fun on 15/11/13.
//  Copyright © 2015年 fun. All rights reserved.
//

#import "YYPicturesViewController.h"
#import "YYJokeModule.h"
#import "YYJokePictureCell.h"

@interface YYPicturesViewController ()

@property (nonatomic, strong) YYJokeModule *jokeModule;

@property (nonatomic, copy) NSArray *jokePicContentList;

@end

static  NSString * const cellID = @"CellID";

@implementation YYPicturesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tableView registerClass:[YYJokePictureCell class] forCellReuseIdentifier:cellID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.jokeModule = [[YYJokeModule alloc] init];
    __weak YYPicturesViewController *weakSelf = self;
    [self.jokeModule getJokePictureTypes:nil result:^(YYJokePicturesResponseResult *responseResult) {
        YYJokePicBodyModel *jokePicBody = responseResult.showapi_res_body;
        weakSelf.jokePicContentList = jokePicBody.contentlist;
        [weakSelf.tableView reloadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - UITableViewDelegate, UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.jokePicContentList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YYJokePictureCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    YYJokePicModel *jokePicModel = self.jokePicContentList[indexPath.row];
    cell.jokePicModel = jokePicModel;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
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
