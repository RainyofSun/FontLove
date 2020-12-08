//
//  FLDuanYuViewModel.h
//  FontLove
//
//  Created by EGLS_BMAC on 2020/11/17.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "FLBaseViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FLDuanYuViewModel : FLBaseViewModel

- (void)setupDuanYuView:(UIView *)view;
- (void)pushDuanYuDetailVC:(UIViewController *)vc selectedSection:(NSInteger)section;
- (void)reloadFont;

@end

NS_ASSUME_NONNULL_END
