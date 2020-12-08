//
//  FLMingJuDetailViewModel.m
//  FontLove
//
//  Created by EGLS_BMAC on 2020/11/17.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "FLMingJuDetailViewModel.h"
#import "FLMingJuDetailView.h"

@interface FLMingJuDetailViewModel ()

/** detailView */
@property (nonatomic,strong) FLMingJuDetailView *detailView;

@end

@implementation FLMingJuDetailViewModel

- (void)dealloc {
    NSLog(@"DELLOC : %@",NSStringFromClass(self.class));
}

- (void)setupMingJuDetailView:(UIView *)view {
    [view addSubview:self.detailView];
    [self.detailView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
    [self.detailView reloadDetailSource:self.mingJuModel.list];
}

#pragma mark - lazy
- (FLMingJuDetailView *)detailView {
    if (!_detailView) {
        _detailView = [[[NSBundle mainBundle] loadNibNamed:@"FLMingJuDetailView" owner:nil options:nil] firstObject];
    }
    return _detailView;
}

@end
