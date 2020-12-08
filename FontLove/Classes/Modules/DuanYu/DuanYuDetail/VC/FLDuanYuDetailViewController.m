//
//  FLDuanYuDetailViewController.m
//  FontLove
//
//  Created by EGLS_BMAC on 2020/11/18.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "FLDuanYuDetailViewController.h"
#import "FLDuanYuDetailViewModel.h"

@interface FLDuanYuDetailViewController ()

/** detailVM */
@property (nonatomic,strong) FLDuanYuDetailViewModel *detailVM;

@end

@implementation FLDuanYuDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.detailVM setupDuanYuDetailView:self.view];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [MBHUDToastManager showBriefAlert:@"点击短语可进行收藏"];
}

- (void)modulesSendMsg:(id)params {
    if ([params isKindOfClass:[NSDictionary class]]) {
        self.title = [params objectForKey:@"title"];
        [self.detailVM duanYuDetailLocalData:[[params objectForKey:@"section"] integerValue] sliderBarIndex:[[params objectForKey:@"barIndex"] integerValue]];
    }
}

#pragma mark - lazy
- (FLDuanYuDetailViewModel *)detailVM {
    if (!_detailVM) {
        _detailVM = [[FLDuanYuDetailViewModel alloc] init];
    }
    return _detailVM;
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
