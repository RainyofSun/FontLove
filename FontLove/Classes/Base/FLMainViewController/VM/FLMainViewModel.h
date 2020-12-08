//
//  FLMainViewModel.h
//  FontLove
//
//  Created by EGLS_BMAC on 2020/11/17.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "FLBaseViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FLMainViewModel : FLBaseViewModel

/// 配置tabbar
- (void)loadTabBarController:(UIViewController *)vc;

@end

NS_ASSUME_NONNULL_END
