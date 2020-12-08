//
//  FLDuanYuViewController.m
//  FontLove
//
//  Created by EGLS_BMAC on 2020/11/17.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "FLDuanYuViewController.h"
#import "FLDuanYuViewModel.h"

@interface FLDuanYuViewController ()

/** duanYuVM */
@property (nonatomic,strong) FLDuanYuViewModel *duanYuVM;

@end

@implementation FLDuanYuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.duanYuVM setupDuanYuView:self.view];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [MBHUDToastManager showBriefAlert:@"点击短语可进行收藏"];
    [self.duanYuVM reloadFont];
}

// 消息透传
- (void)showMoreMingJu:(NSNumber *)selectedSection {
    [self.duanYuVM pushDuanYuDetailVC:self selectedSection:selectedSection.integerValue];
}

#pragma mark - lazy
- (FLDuanYuViewModel *)duanYuVM {
    if (!_duanYuVM) {
        _duanYuVM = [[FLDuanYuViewModel alloc] init];
    }
    return _duanYuVM;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
