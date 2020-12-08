//
//  FLDuanYuSliderBar.h
//  FontLove
//
//  Created by EGLS_BMAC on 2020/11/17.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FLDuanYuSliderBar : UIView

- (void)loadSliderBarTitleSource:(NSArray <NSString *>*)titleSource;
- (void)switchSliderBar:(NSInteger)X;
- (void)reloadFont;

@end

NS_ASSUME_NONNULL_END
