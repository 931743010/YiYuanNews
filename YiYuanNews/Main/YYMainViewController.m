//
//  YYMainViewController.m
//  YiYuanNews
//
//  Created by fun on 15/11/12.
//  Copyright © 2015年 fun. All rights reserved.
//

#import "YYMainViewController.h"
#import "WMPageController.h"
#import "WMPageConst.h"

#import "YYNewsViewController.h"
#import "YYNewsModule.h"

#import "YYPicturesViewController.h"

#import "ProfileViewController.h"

@interface YYMainViewController ()

@property (nonatomic, strong) YYNewsModule *newsModule;

@property (nonatomic, copy) NSArray *channelList;

@end

static const NSInteger focuseNewsCount = 14;
static const NSInteger lastestNewsCount = 10;

@implementation YYMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.newsModule = [[YYNewsModule alloc] init];
    
    [self.newsModule getNewsChannels:nil result:^(YYNewsChannelsResponseResult *result) {
        //焦点新闻 14
        
        NSMutableArray *focuseNewsTitlesArray = [NSMutableArray arrayWithCapacity:focuseNewsCount];
        NSMutableArray *foucuseNewsControllersArray = [NSMutableArray arrayWithCapacity:focuseNewsCount];
        self.channelList = result.showapi_res_body.channelList;
        for (int i=0; i<focuseNewsCount; i++) {
            YYNewsChannelModel *channel = _channelList[i];
            [focuseNewsTitlesArray addObject:channel.name];
            [foucuseNewsControllersArray addObject:[YYNewsViewController class]];
            
        }
        WMPageController *foucuseNewsVC = [[WMPageController alloc] initWithViewControllerClasses:foucuseNewsControllersArray andTheirTitles:focuseNewsTitlesArray];
        UINavigationController *focuseNewsNav = [[UINavigationController alloc] initWithRootViewController:foucuseNewsVC];
        foucuseNewsVC.menuHeight = 40;
        foucuseNewsVC.menuItemWidth = 90;
        foucuseNewsVC.menuViewStyle = WMMenuViewStyleLine;
        foucuseNewsVC.postNotification = YES;
        
        foucuseNewsVC.title = @"焦点新闻";
        
        //最新新闻
        NSMutableArray *lastestNewsTitlesArray = [NSMutableArray arrayWithCapacity:lastestNewsCount];
        NSMutableArray *lastestNewsControllersArray = [NSMutableArray arrayWithCapacity:lastestNewsCount];
        for (int i=focuseNewsCount; i<focuseNewsCount+lastestNewsCount; i++) {
            YYNewsChannelModel *channel = _channelList[i];
            [lastestNewsTitlesArray addObject:channel.name];
            [lastestNewsControllersArray addObject:[YYNewsViewController class]];
        }
        WMPageController *lastestNewsVC = [[WMPageController alloc] initWithViewControllerClasses:lastestNewsControllersArray andTheirTitles:lastestNewsTitlesArray];
        lastestNewsVC.menuHeight = 40;
        lastestNewsVC.menuItemWidth = 90;
        lastestNewsVC.menuViewStyle = WMMenuViewStyleLine;
        lastestNewsVC.postNotification = YES;
        UINavigationController *lastestNewsNav = [[UINavigationController alloc] initWithRootViewController:lastestNewsVC];
        lastestNewsVC.title = @"最新新闻";
        
        //搞笑图片
        YYPicturesViewController *picVC = [[YYPicturesViewController alloc] init];
        UINavigationController *picNav = [[UINavigationController alloc] initWithRootViewController:picVC];
        picVC.title = @"搞笑图片";
        
        //个人中心
        ProfileViewController *profileVC = [[ProfileViewController alloc] init];
        UINavigationController *profileNav = [[UINavigationController alloc] initWithRootViewController:profileVC];
        profileVC.title = @"个人中心";
        
        
        [self setViewControllers:@[lastestNewsNav, focuseNewsNav, picNav, profileNav] animated:YES];
        UITabBar *tabBar = self.tabBar;
        
        [self setupChildViewController:lastestNewsNav title:lastestNewsVC.title imageName:@"tabbar_icon_news_normal" selectedImageName:@"tabbar_icon_news_highlight" tabBar:tabBar index:0];
        [self setupChildViewController:focuseNewsNav title:foucuseNewsVC.title imageName:@"tabbar_icon_news_normal" selectedImageName:@"tabbar_icon_news_highlight" tabBar:tabBar index:1];
        [self setupChildViewController:picNav title:picVC.title imageName:@"tabbar_icon_news_normal" selectedImageName:@"tabbar_icon_news_highlight" tabBar:tabBar index:2];
        [self setupChildViewController:profileNav title:profileVC.title imageName:@"tabbar_icon_me_normal" selectedImageName:@"tabbar_icon_found_highlight" tabBar:tabBar index:3];
    }];


}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(displayCurrentController:) name:WMControllerDidFullyDisplayedNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:WMControllerDidFullyDisplayedNotification object:nil];
}


- (void)setupChildViewController:(UIViewController *)childVC
                           title:(NSString *)title
                       imageName:(NSString *)imageName
               selectedImageName:(NSString *)selectedImageName
                          tabBar:(UITabBar *)tabBar
                           index:(NSUInteger)index {
    childVC.title = title;
    UITabBarItem *item = [tabBar.items objectAtIndex:index];
    UIImage *image = [UIImage imageNamed:imageName];
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    // 设置不对图片进行蓝色的渲染
    [item setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [item setSelectedImage:[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
}


- (void)displayCurrentController:(NSNotification *)notify
{
    NSDictionary *dict = notify.object;
    NSInteger selectedIndex = self.selectedIndex;
    NSInteger itemIndex = [dict[@"index"] integerValue];
    
    NSInteger channelModelIndex = selectedIndex==0 ? (focuseNewsCount + itemIndex) : itemIndex;
    YYNewsChannelModel *channelModel = self.channelList[channelModelIndex];
    NSLog(@"channel name:%@  channel ID:%@", channelModel.name, channelModel.channelId);
    
    
    UINavigationController *nav = self.selectedViewController;
    WMPageController *pageVC = (WMPageController *)nav.topViewController;
    YYNewsViewController *currentNewsController = (YYNewsViewController *)pageVC.currentViewController;
    currentNewsController.newsChannelModel = channelModel;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






@end
