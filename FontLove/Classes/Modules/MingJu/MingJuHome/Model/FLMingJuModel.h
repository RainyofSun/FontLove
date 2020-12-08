//
//  FLMingJuModel.h
//  FontLove
//
//  Created by EGLS_BMAC on 2020/11/17.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "FLBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FLMingJuModel : FLBaseModel

/** type */
@property (nonatomic,strong) NSString *type;
/** list */
@property (nonatomic,strong) NSArray <NSDictionary *>*list;

@end

NS_ASSUME_NONNULL_END
