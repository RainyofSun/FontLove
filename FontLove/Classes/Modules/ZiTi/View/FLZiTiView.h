//
//  FLZiTiView.h
//  FontLove
//
//  Created by EGLS_BMAC on 2020/11/18.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FLZiTiView : UIView

- (void)reloadZiTiSource:(NSArray <NSDictionary *>*)source;
- (void)reloadFont;

@end

NS_ASSUME_NONNULL_END
