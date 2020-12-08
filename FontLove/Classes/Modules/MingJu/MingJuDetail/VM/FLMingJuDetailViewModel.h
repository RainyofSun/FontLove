//
//  FLMingJuDetailViewModel.h
//  FontLove
//
//  Created by EGLS_BMAC on 2020/11/17.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "FLBaseViewModel.h"
#import "FLMingJuModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FLMingJuDetailViewModel : FLBaseViewModel

/** mingJuModel */
@property (nonatomic,strong) FLMingJuModel *mingJuModel;

- (void)setupMingJuDetailView:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
