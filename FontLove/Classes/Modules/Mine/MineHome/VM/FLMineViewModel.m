//
//  FLMineViewModel.m
//  FontLove
//
//  Created by EGLS_BMAC on 2020/11/18.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "FLMineViewModel.h"
#import "FLMineView.h"

@interface FLMineViewModel ()

/** mineView */
@property (nonatomic,strong) FLMineView *mineView;

@end

@implementation FLMineViewModel

- (void)dealloc {
    NSLog(@"DELLOC : %@",NSStringFromClass(self.class));
}

- (void)setupMineView:(UIView *)view {
    [view addSubview:self.mineView];
    [self.mineView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
    [self collectionChange];
}

- (void)reloadFont {
    if (_mineView) {
        [self.mineView reloadFont];
    }
}

- (void)collectionChange {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[FLCommonCache UserGlobalCache] willChangeValueForKey:@"collectionArray"];
        [[FLCommonCache UserGlobalCache] didChangeValueForKey:@"collectionArray"];
    });
}

#pragma mark - lazy
- (FLMineView *)mineView {
    if (!_mineView) {
        _mineView = [[[NSBundle mainBundle] loadNibNamed:@"FLMineView" owner:nil options:nil] firstObject];
    }
    return _mineView;
}

@end
