//
//  FLMineCollectionDetailViewModel.m
//  FontLove
//
//  Created by EGLS_BMAC on 2020/11/18.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "FLMineCollectionDetailViewModel.h"
#import "FLDuanYuDetailView.h"

@interface FLMineCollectionDetailViewModel ()

/** detailView */
@property (nonatomic,strong) FLDuanYuDetailView *detailView;

@end

@implementation FLMineCollectionDetailViewModel

- (void)dealloc {
    NSLog(@"DELLOC : %@",NSStringFromClass(self.class));
}

- (void)setupDetailView:(UIView *)view {
    [view addSubview:self.detailView];
    [self.detailView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
    [self.detailView reloadDuanYuDetailSource:[self collectionSource]];
}

- (NSArray <FLDuanYuDetailModel *>*)collectionSource {
    NSMutableArray <FLDuanYuDetailModel *>* temp = [NSMutableArray arrayWithCapacity:[FLCommonCache UserGlobalCache].collectionArray.count];
    for (NSString *text in [FLCommonCache UserGlobalCache].collectionArray) {
        FLDuanYuDetailModel *detailModel = [[FLDuanYuDetailModel alloc] init];
        detailModel.text = text;
        [temp addObject:detailModel];
    }
    return temp;
}

#pragma mark - lazy
- (FLDuanYuDetailView *)detailView {
    if (!_detailView) {
        _detailView = [[[NSBundle mainBundle] loadNibNamed:@"FLDuanYuDetailView" owner:nil options:nil] firstObject];
    }
    return _detailView;
}

@end
