//
//  FLMineCollectionDetailViewController.m
//  FontLove
//
//  Created by EGLS_BMAC on 2020/11/18.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "FLMineCollectionDetailViewController.h"
#import "FLMineCollectionDetailViewModel.h"

@interface FLMineCollectionDetailViewController ()

/** detailVM */
@property (nonatomic,strong) FLMineCollectionDetailViewModel *detailVM;

@end

@implementation FLMineCollectionDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.detailVM setupDetailView:self.view];
}

#pragma mark - lazy
- (FLMineCollectionDetailViewModel *)detailVM {
    if (!_detailVM) {
        _detailVM = [[FLMineCollectionDetailViewModel alloc] init];
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
