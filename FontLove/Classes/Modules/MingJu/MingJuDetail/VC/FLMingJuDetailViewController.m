//
//  FLMingJuDetailViewController.m
//  FontLove
//
//  Created by EGLS_BMAC on 2020/11/17.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "FLMingJuDetailViewController.h"
#import "FLMingJuDetailViewModel.h"

@interface FLMingJuDetailViewController ()

/** detailVM */
@property (nonatomic,strong) FLMingJuDetailViewModel *detailVM;

@end

@implementation FLMingJuDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = self.detailVM.mingJuModel.type;
    [self.detailVM setupMingJuDetailView:self.view];
}

- (void)modulesSendMsg:(id)params {
    if (params) {
        self.detailVM.mingJuModel = (FLMingJuModel *)params;
    }
}

#pragma mark - lazy
- (FLMingJuDetailViewModel *)detailVM {
    if (!_detailVM) {
        _detailVM = [[FLMingJuDetailViewModel alloc] init];
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
