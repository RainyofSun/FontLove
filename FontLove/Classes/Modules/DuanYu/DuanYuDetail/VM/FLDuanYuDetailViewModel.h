//
//  FLDuanYuDetailViewModel.h
//  FontLove
//
//  Created by EGLS_BMAC on 2020/11/18.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "FLBaseViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FLDuanYuDetailViewModel : FLBaseViewModel

- (void)setupDuanYuDetailView:(UIView *)view;
- (void)duanYuDetailLocalData:(NSInteger)section sliderBarIndex:(NSInteger)barIndex;

@end

NS_ASSUME_NONNULL_END
