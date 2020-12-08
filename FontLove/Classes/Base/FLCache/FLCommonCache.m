//
//  FLCommonCache.m
//  FontLove
//
//  Created by EGLS_BMAC on 2020/11/18.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "FLCommonCache.h"

static FLCommonCache *cache = nil;

@implementation FLCommonCache

+ (instancetype)UserGlobalCache {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!cache) {
            cache = [[FLCommonCache alloc] init];
            cache.collectionArray = [NSMutableArray array];
        }
    });
    return cache;
}

- (void)removeCollectionCache {
    [cache.collectionArray removeAllObjects];
}

@end
