//
//  FLMingJuViewController.m
//  FontLove
//
//  Created by EGLS_BMAC on 2020/11/17.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "FLMingJuViewController.h"
#import "FLMingJuViewModel.h"

@interface FLMingJuViewController ()

/** mingJuVM */
@property (nonatomic,strong) FLMingJuViewModel *mingJuVM;

@end

@implementation FLMingJuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.mingJuVM setupMingJuView:self.view];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.mingJuVM modifyFont];
}

// 消息透传
- (void)showMoreMingJu:(NSNumber *)selectedSection {
    [self.mingJuVM pushMingJuDetailVC:self selectedSection:selectedSection.integerValue];
}

#pragma mark - lazy
- (FLMingJuViewModel *)mingJuVM {
    if (!_mingJuVM) {
        _mingJuVM = [[FLMingJuViewModel alloc] init];
    }
    return _mingJuVM;
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
