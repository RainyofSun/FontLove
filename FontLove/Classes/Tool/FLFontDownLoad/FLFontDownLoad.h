//
//  FLFontDownLoad.h
//  FontLove
//
//  Created by EGLS_BMAC on 2020/11/18.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FLFontDownLoad : NSObject

+ (BOOL)isFontDownLoaded:(NSString *)fontName;
+ (void)downloadWithFontName:(NSString *)fontName downloadBegin:(void(^)(void))begin downloadProgress:(void(^)(CGFloat progressValue))value downloadComplete:(void(^)(void))complete;

@end

NS_ASSUME_NONNULL_END
