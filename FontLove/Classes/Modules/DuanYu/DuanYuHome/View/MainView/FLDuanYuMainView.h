//
//  FLDuanYuMainView.h
//  FontLove
//
//  Created by EGLS_BMAC on 2020/11/17.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class FLDuanYuModel;

@interface FLDuanYuMainView : UIView

- (void)loadDuanYuData:(NSArray <NSArray <FLDuanYuModel *> *>*)duanYuSource;
- (NSInteger)sliderBarSelectedIndex;
- (void)reloadSliderBarFont;

@end

NS_ASSUME_NONNULL_END
