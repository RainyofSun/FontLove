//
//  FLZiTiViewModel.h
//  FontLove
//
//  Created by EGLS_BMAC on 2020/11/18.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "FLBaseViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FLZiTiViewModel : FLBaseViewModel

- (void)setupZiTiView:(UIView *)view;
- (void)downloadFont:(NSString *)fontScript;

@end

NS_ASSUME_NONNULL_END
