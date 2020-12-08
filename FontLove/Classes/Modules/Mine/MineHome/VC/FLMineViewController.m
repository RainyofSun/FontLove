//
//  FLMineViewController.m
//  FontLove
//
//  Created by EGLS_BMAC on 2020/11/17.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "FLMineViewController.h"
#import "FLMineViewModel.h"

@interface FLMineViewController ()

/** mineVM */
@property (nonatomic,strong) FLMineViewModel *mineVM;

@end

@implementation FLMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.mineVM setupMineView:self.view];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.mineVM reloadFont];
}

#pragma mark - lazy
- (FLMineViewModel *)mineVM {
    if (!_mineVM) {
        _mineVM = [[FLMineViewModel alloc] init];
    }
    return _mineVM;
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
