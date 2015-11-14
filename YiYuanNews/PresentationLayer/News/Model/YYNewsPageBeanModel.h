//
//  YYNewsPageBeanModel.h
//  YiYuanNews
//
//  Created by fun on 15/11/12.
//  Copyright © 2015年 fun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YYNewsPageBeanModel : NSObject

@property (nonatomic, assign) NSInteger allNum;

@property (nonatomic, assign) NSInteger allPages;

@property (nonatomic, assign) NSInteger currentPage;

@property (nonatomic, assign) NSInteger maxResult;

@property (nonatomic, strong) NSArray *contentlist;

@end
