//
//  FLNavigationViewController.h
//  FontLove
//
//  Created by EGLS_BMAC on 2020/11/17.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FLNavigationViewController : UINavigationController

- (void)setOrientationMask:(UIInterfaceOrientationMask)orientationMask preferredInterfaceOrientation:(UIInterfaceOrientation)preferredInterfaceOrientation;

@end

NS_ASSUME_NONNULL_END
