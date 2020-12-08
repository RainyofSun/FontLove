//
//  FLDuanYuModel.h
//  FontLove
//
//  Created by EGLS_BMAC on 2020/11/17.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "FLBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FLDuanYuModel : FLBaseModel

/** categoryName */
@property (nonatomic,strong) NSString *categoryName;
/** dataList */
@property (nonatomic,strong) NSArray <NSDictionary *>*dataList;

@end

NS_ASSUME_NONNULL_END
