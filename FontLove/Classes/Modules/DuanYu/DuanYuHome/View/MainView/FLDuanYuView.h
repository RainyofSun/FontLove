//
//  FLDuanYuView.h
//  FontLove
//
//  Created by EGLS_BMAC on 2020/11/17.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FLDuanYuModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FLDuanYuView : UIView

- (void)reloadDuanYuModel:(NSArray<FLDuanYuModel *> *)modelSource;
- (void)reloadFont;

@end

NS_ASSUME_NONNULL_END
