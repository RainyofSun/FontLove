//
//  FLMingJuViewModel.h
//  FontLove
//
//  Created by EGLS_BMAC on 2020/11/17.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "FLBaseViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FLMingJuViewModel : FLBaseViewModel

- (void)setupMingJuView:(UIView *)view;
- (void)pushMingJuDetailVC:(UIViewController *)vc selectedSection:(NSInteger)section;
- (void)modifyFont;

@end

NS_ASSUME_NONNULL_END
