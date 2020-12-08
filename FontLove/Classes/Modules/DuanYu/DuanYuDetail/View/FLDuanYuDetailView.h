//
//  FLDuanYuDetailView.h
//  FontLove
//
//  Created by EGLS_BMAC on 2020/11/18.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FLDuanYuDetailModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FLDuanYuDetailView : UIView

- (void)reloadDuanYuDetailSource:(NSArray <FLDuanYuDetailModel *>*)source;

@end

NS_ASSUME_NONNULL_END
