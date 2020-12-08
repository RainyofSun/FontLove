//
//  FLDuanYuDetailViewModel.m
//  FontLove
//
//  Created by EGLS_BMAC on 2020/11/18.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "FLDuanYuDetailViewModel.h"
#import "FLDuanYuDetailView.h"

@interface FLDuanYuDetailViewModel ()

/** detailView */
@property (nonatomic,strong) FLDuanYuDetailView *detailView;
/** localSource */
@property (nonatomic,strong) NSArray <FLDuanYuDetailModel *>*localSource;

@end

@implementation FLDuanYuDetailViewModel

- (void)dealloc {
    NSLog(@"DELLOC : %@",NSStringFromClass(self.class));
}

- (void)setupDuanYuDetailView:(UIView *)view {
    [view addSubview:self.detailView];
    [self.detailView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
    [self.detailView reloadDuanYuDetailSource:self.localSource];
}

- (void)duanYuDetailLocalData:(NSInteger)section sliderBarIndex:(NSInteger)barIndex {
    switch (barIndex) {
        case 0:
            [self duanYuDetailSource:(section == 0 ? @"DuanziNewsDetail" : @"DuanziHotDetail")];
            break;
        case 1:
            [self duanYuDetailSource:(section == 0 ? @"MingRenMingYanNewsDetail" : @"MingRenMingYanHotDetail")];
            break;
        case 2:
            [self duanYuDetailSource:(section == 0 ? @"wordNewsDetail" : @"wordHotDetail")];
            break;
        default:
            break;
    }
}

#pragma mark - private methods
- (void)duanYuDetailSource:(NSString *)dataName {
    WeakSelf;
    [MPLocalData MPGetLocalDataFileName:dataName localData:^(id  _Nonnull responseObject) {
        weakSelf.localSource = [FLDuanYuDetailModel modelArrayWithDictArray:(NSArray *)[responseObject objectForKey:@"list"]];
    } errorBlock:^(NSString * _Nullable errorInfo) {
        
    }];
}

#pragma mark - lazy
- (FLDuanYuDetailView *)detailView {
    if (!_detailView) {
        _detailView = [[[NSBundle mainBundle] loadNibNamed:@"FLDuanYuDetailView" owner:nil options:nil] firstObject];
    }
    return _detailView;
}

@end
