//
//  FLMainViewModel.m
//  FontLove
//
//  Created by EGLS_BMAC on 2020/11/17.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "FLMainViewModel.h"
#import "FLTabBarViewController.h"

@implementation FLMainViewModel

- (void)dealloc {
    NSLog(@"DELLOC : %@",NSStringFromClass(self.class));
}

#pragma mark - public methods
// 配置tabbar
- (void)loadTabBarController:(UIViewController *)vc {
    FLTabBarViewController *tabBar = [[FLTabBarViewController alloc] init];
    [vc.view addSubview:tabBar.view];
    [vc addChildViewController:tabBar];
    tabBar.view.translatesAutoresizingMaskIntoConstraints = NO;
    [tabBar.view autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
}

@end
