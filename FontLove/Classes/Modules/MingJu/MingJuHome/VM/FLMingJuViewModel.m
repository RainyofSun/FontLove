//
//  FLMingJuViewModel.m
//  FontLove
//
//  Created by EGLS_BMAC on 2020/11/17.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "FLMingJuViewModel.h"
#import "FLMingJuView.h"
#import "FLMingJuModel.h"

@interface FLMingJuViewModel ()

/** mingJuView */
@property (nonatomic,strong) FLMingJuView *mingJuView;
/** hotModel */
@property (nonatomic,strong) FLMingJuModel *hotModel;
/** newsModel */
@property (nonatomic,strong) FLMingJuModel *newsModel;
/** zheXueModel */
@property (nonatomic,strong) FLMingJuModel *zheXueModel;
/** ganQingModel */
@property (nonatomic,strong) FLMingJuModel *ganQingModel;

@end

@implementation FLMingJuViewModel

- (void)dealloc {
    NSLog(@"DELLOC : %@",NSStringFromClass(self.class));
}

#pragma mark - public methods
- (void)setupMingJuView:(UIView *)view {
    [view addSubview:self.mingJuView];
    [self.mingJuView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
    [self mingJuLocalSource];
}

- (void)pushMingJuDetailVC:(UIViewController *)vc selectedSection:(NSInteger)section {
    FLMingJuModel *tempModel = nil;
    switch (section) {
        case 0:
            tempModel = self.hotModel;
            break;
        case 1:
            tempModel = self.newsModel;
            break;
        case 2:
            tempModel = self.zheXueModel;
            break;
        case 3:
            tempModel = self.ganQingModel;
            break;
        default:
            tempModel = [[FLMingJuModel alloc] init];
            break;
    }
    [vc.navigationController pushViewController:[FLModuleMsgSend sendMsg:tempModel vcName:@"FLMingJuDetailViewController"] animated:YES];
}

- (void)modifyFont {
    if (_mingJuView) {
        [self.mingJuView reloadFont];
    }
}

#pragma mark - private methods
- (void)mingJuLocalSource {
    dispatch_group_t netGroup = dispatch_group_create();
    
    WeakSelf;
    dispatch_group_enter(netGroup);
    [MPLocalData MPGetLocalDataFileName:@"hot" localData:^(id  _Nonnull responseObject) {
        weakSelf.hotModel = [FLMingJuModel modelWithDictionary:(NSDictionary *)responseObject];
        weakSelf.hotModel.type = @"热门";
        dispatch_group_leave(netGroup);
    } errorBlock:^(NSString * _Nullable errorInfo) {
        
    }];
    
    dispatch_group_enter(netGroup);
    [MPLocalData MPGetLocalDataFileName:@"new" localData:^(id  _Nonnull responseObject) {
        weakSelf.newsModel = [FLMingJuModel modelWithDictionary:(NSDictionary *)responseObject];
        weakSelf.newsModel.type = @"最新";
        dispatch_group_leave(netGroup);
    } errorBlock:^(NSString * _Nullable errorInfo) {
        
    }];
    
    dispatch_group_enter(netGroup);
    [MPLocalData MPGetLocalDataFileName:@"ZheXue" localData:^(id  _Nonnull responseObject) {
        weakSelf.zheXueModel = [FLMingJuModel modelWithDictionary:(NSDictionary *)responseObject];
        weakSelf.zheXueModel.type = @"哲学";
        dispatch_group_leave(netGroup);
    } errorBlock:^(NSString * _Nullable errorInfo) {
        
    }];
    
    dispatch_group_enter(netGroup);
    [MPLocalData MPGetLocalDataFileName:@"QingGan" localData:^(id  _Nonnull responseObject) {
        weakSelf.ganQingModel = [FLMingJuModel modelWithDictionary:(NSDictionary *)responseObject];
        weakSelf.ganQingModel.type = @"情感";
        dispatch_group_leave(netGroup);
    } errorBlock:^(NSString * _Nullable errorInfo) {
        
    }];
    
    dispatch_group_notify(netGroup, dispatch_get_main_queue(), ^{
        [weakSelf.mingJuView reloadMingJuModel:[weakSelf combineData]];
    });
}

- (NSArray <FLMingJuModel *>*)combineData {
    NSMutableArray *tempSource = [NSMutableArray arrayWithCapacity:4];
    
    FLMingJuModel *hotModel = [[FLMingJuModel alloc] init];
    hotModel.type = @"热门";
    NSMutableArray *tempArray0 = [NSMutableArray arrayWithArray:self.hotModel.list];
    hotModel.list = [tempArray0 subarrayWithRange:NSMakeRange(0, 4)];
    
    FLMingJuModel *newsModel = [[FLMingJuModel alloc] init];
    newsModel.type = @"最新";
    NSMutableArray *tempArray1 = [NSMutableArray arrayWithArray:self.newsModel.list];
    newsModel.list = [tempArray1 subarrayWithRange:NSMakeRange(0, 4)];
    
    FLMingJuModel *zheXueModel = [[FLMingJuModel alloc] init];
    zheXueModel.type = @"哲学";
    NSMutableArray *tempArray2 = [NSMutableArray arrayWithArray:self.zheXueModel.list];
    zheXueModel.list = [tempArray2 subarrayWithRange:NSMakeRange(0, 4)];
    
    FLMingJuModel *qingGanModel = [[FLMingJuModel alloc] init];
    qingGanModel.type = @"情感";
    NSMutableArray *tempArray3 = [NSMutableArray arrayWithArray:self.ganQingModel.list];
    qingGanModel.list = [tempArray3 subarrayWithRange:NSMakeRange(0, 4)];
    
    [tempSource addObject:hotModel];
    [tempSource addObject:newsModel];
    [tempSource addObject:zheXueModel];
    [tempSource addObject:qingGanModel];
    
    return tempSource;
}

#pragma mark - lazy
- (FLMingJuView *)mingJuView {
    if (!_mingJuView) {
        _mingJuView = [[[NSBundle mainBundle] loadNibNamed:@"FLMingJuView" owner:nil options:nil] firstObject];
    }
    return _mingJuView;
}

@end
