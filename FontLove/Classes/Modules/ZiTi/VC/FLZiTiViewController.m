//
//  FLZiTiViewController.m
//  FontLove
//
//  Created by EGLS_BMAC on 2020/11/17.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "FLZiTiViewController.h"
#import "FLZiTiViewModel.h"

@interface FLZiTiViewController ()

/** ziTiVM */
@property (nonatomic,strong) FLZiTiViewModel *ziTiVM;

@end

@implementation FLZiTiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.ziTiVM setupZiTiView:self.view];
}

// 消息透传
- (void)downloadFont:(NSString *)fontName {
    [self.ziTiVM downloadFont:fontName];
}

#pragma mark - lazy
- (FLZiTiViewModel *)ziTiVM {
    if (!_ziTiVM) {
        _ziTiVM = [[FLZiTiViewModel alloc] init];
    }
    return _ziTiVM;
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
