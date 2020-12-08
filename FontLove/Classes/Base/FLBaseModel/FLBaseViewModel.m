//
//  FLBaseViewModel.m
//  FontLove
//
//  Created by EGLS_BMAC on 2020/11/17.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "FLBaseViewModel.h"

@implementation FLBaseViewModel

- (instancetype)init {
    if (self = [super init]) {
        [self setDefaultData];
    }
    return self;
}

- (void)dealloc {
    NSLog(@"DELLOC : %@",NSStringFromClass(self.class));
}

#pragma mark - public methods

#pragma mark - private methods
- (void)setDefaultData {
    self.page = 0;
    self.pageCount = 20;
}

@end
