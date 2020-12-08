//
//  FLDuanYuViewModel.m
//  FontLove
//
//  Created by EGLS_BMAC on 2020/11/17.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "FLDuanYuViewModel.h"
#import "FLDuanYuMainView.h"
#import "FLDuanYuModel.h"

@interface FLDuanYuViewModel ()

/** mainView */
@property (nonatomic,strong) FLDuanYuMainView *mainView;
/** duanZiArray */
@property (nonatomic,strong) NSArray <FLDuanYuModel *>*duanZiArray;
/** mingYanArray */
@property (nonatomic,strong) NSArray <FLDuanYuModel *>*mingYanArray;
/** taiCiArray */
@property (nonatomic,strong) NSArray <FLDuanYuModel *>*taiCiArray;

@end

@implementation FLDuanYuViewModel

- (void)dealloc {
    NSLog(@"DELLOC : %@",NSStringFromClass(self.class));
}

- (void)setupDuanYuView:(UIView *)view {
    [view addSubview:self.mainView];
    [self.mainView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
    [self duanYuLocalData];
}

- (void)pushDuanYuDetailVC:(UIViewController *)vc selectedSection:(NSInteger)section {
    NSInteger X = [self.mainView sliderBarSelectedIndex];
    NSString *title;
    switch (X) {
        case 0:
            title = self.duanZiArray[section].categoryName;
            break;
        case 1:
            title = self.mingYanArray[section].categoryName;
            break;
        case 2:
            title = self.taiCiArray[section].categoryName;
            break;
        default:
            break;
    }
    [vc.navigationController pushViewController:[FLModuleMsgSend sendMsg:@{@"barIndex":@(X),@"section":@(section),@"title":title} vcName:@"FLDuanYuDetailViewController"] animated:YES];
}

- (void)reloadFont {
    [self.mainView reloadSliderBarFont];
}

#pragma mark - private methods
- (void)duanYuLocalData {
    dispatch_group_t netGroup = dispatch_group_create();
    
    WeakSelf;
    dispatch_group_enter(netGroup);
    [MPLocalData MPGetLocalDataFileName:@"Duanzi" localData:^(id  _Nonnull responseObject) {
        weakSelf.duanZiArray = [FLDuanYuModel modelArrayWithDictArray:(NSArray *)[responseObject objectForKey:@"list"]];
        dispatch_group_leave(netGroup);
    } errorBlock:^(NSString * _Nullable errorInfo) {
        
    }];
    
    dispatch_group_enter(netGroup);
    [MPLocalData MPGetLocalDataFileName:@"MingRenMingYan" localData:^(id  _Nonnull responseObject) {
        weakSelf.mingYanArray = [FLDuanYuModel modelArrayWithDictArray:(NSArray *)[responseObject objectForKey:@"list"]];
        dispatch_group_leave(netGroup);
    } errorBlock:^(NSString * _Nullable errorInfo) {
        
    }];
    
    dispatch_group_enter(netGroup);
    [MPLocalData MPGetLocalDataFileName:@"word" localData:^(id  _Nonnull responseObject) {
        weakSelf.taiCiArray = [FLDuanYuModel modelArrayWithDictArray:(NSArray *)[responseObject objectForKey:@"list"]];
        dispatch_group_leave(netGroup);
    } errorBlock:^(NSString * _Nullable errorInfo) {
        
    }];
    
    dispatch_group_notify(netGroup, dispatch_get_main_queue(), ^{
        [weakSelf.mainView loadDuanYuData:[weakSelf combineData]];
    });
}

- (NSArray <NSArray <FLDuanYuModel *>*>*)combineData {
    NSMutableArray *temp = [NSMutableArray arrayWithCapacity:3];
    [temp addObject:self.duanZiArray];
    [temp addObject:self.mingYanArray];
    [temp addObject:self.taiCiArray];
    return temp;
}

#pragma mark - lazy
- (FLDuanYuMainView *)mainView {
    if (!_mainView) {
        _mainView = [[FLDuanYuMainView alloc] init];
    }
    return _mainView;
}

@end
