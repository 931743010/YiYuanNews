//
//  YYNewsViewController.h
//  YiYuanNews
//
//  Created by fun on 15/11/12.
//  Copyright © 2015年 fun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YYNewsChannelModel;

@interface YYNewsViewController : UITableViewController

/**
 *  新闻频道模型
 */
@property (nonatomic, strong) YYNewsChannelModel *newsChannelModel;

@end
