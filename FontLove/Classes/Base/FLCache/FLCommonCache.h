//
//  FLCommonCache.h
//  FontLove
//
//  Created by EGLS_BMAC on 2020/11/18.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FLCommonCache : NSObject

+ (instancetype)UserGlobalCache;
- (void)removeCollectionCache;

/** duanYuCollection */
@property (nonatomic,strong) NSMutableArray <NSString *>*collectionArray;
/** fontName */
@property (nonatomic,strong) NSString *fontName;
/** fontDownloadComplete */
@property (nonatomic,assign) BOOL fontDownloadComplete;

@end

NS_ASSUME_NONNULL_END
