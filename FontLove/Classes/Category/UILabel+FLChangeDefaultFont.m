//
//  UILabel+FLChangeDefaultFont.m
//  FontLove
//
//  Created by EGLS_BMAC on 2020/11/18.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "UILabel+FLChangeDefaultFont.h"

@implementation UILabel (FLChangeDefaultFont)

- (void)reloadFont {
    if ([FLCommonCache UserGlobalCache].fontName && [FLCommonCache UserGlobalCache].fontDownloadComplete) {
        self.font = [UIFont fontWithName:[FLCommonCache UserGlobalCache].fontName size:self.font.pointSize];
    } else {
        self.font = [UIFont systemFontOfSize:self.font.pointSize];
    }
}

/*
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        SEL originalSelector = @selector(init);
        SEL originalSelector1 = @selector(initWithFrame:);
        SEL originalSelector2 = @selector(awakeFromNib);
        SEL swizzledSelector = @selector(FLInit);
        SEL swizzledSelector1 = @selector(FLInitWithFrame:);
        SEL swizzledSelector2 = @selector(FLAwakeFromNib);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method originalMethod1 = class_getInstanceMethod(class, originalSelector1);
        Method originalMethod2 = class_getInstanceMethod(class, originalSelector2);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        Method swizzledMethod1 = class_getInstanceMethod(class, swizzledSelector1);
        Method swizzledMethod2 = class_getInstanceMethod(class, swizzledSelector2);
        
        BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        BOOL didAddMethod1 = class_addMethod(class, originalSelector1, method_getImplementation(swizzledMethod1), method_getTypeEncoding(swizzledMethod1));
        BOOL didAddMethod2 = class_addMethod(class, originalSelector2, method_getImplementation(swizzledMethod2), method_getTypeEncoding(swizzledMethod2));
        
        if (didAddMethod) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
        
        if (didAddMethod1) {
            class_replaceMethod(class, swizzledSelector1, method_getImplementation(originalMethod1), method_getTypeEncoding(originalMethod1));
        } else {
            method_exchangeImplementations(originalMethod1, swizzledMethod1);
        }
        
        if (didAddMethod2) {
            class_replaceMethod(class, swizzledSelector2, method_getImplementation(originalMethod2), method_getTypeEncoding(originalMethod2));
        } else {
            method_exchangeImplementations(originalMethod2, swizzledMethod2);
        }
    });
}

// 替换方法
- (instancetype)FLInit {
    id __self = [self FLInit];
    if ([FLCommonCache UserGlobalCache].fontName.length) {
        UIFont *font = [UIFont fontWithName:[FLCommonCache UserGlobalCache].fontName size:self.font.pointSize];
        if (font) {
            self.font = font;
        }
    } else {
        self.font = [UIFont systemFontOfSize:self.font.pointSize];
    }
    return __self;
}

- (instancetype)FLInitWithFrame:(CGRect)rect {
    id __self = [self FLInitWithFrame:rect];
    if ([FLCommonCache UserGlobalCache].fontName.length) {
        UIFont *font = [UIFont fontWithName:[FLCommonCache UserGlobalCache].fontName size:self.font.pointSize];
        if (font) {
            self.font = font;
        }
    } else {
        self.font = [UIFont systemFontOfSize:self.font.pointSize];
    }
    return __self;
}

- (void)FLAwakeFromNib {
    [self FLAwakeFromNib];
    if ([FLCommonCache UserGlobalCache].fontName.length) {
        UIFont *font = [UIFont fontWithName:[FLCommonCache UserGlobalCache].fontName size:self.font.pointSize];
        if (font) {
            self.font = font;
        }
    } else {
        self.font = [UIFont systemFontOfSize:self.font.pointSize];
    }
}
*/

@end
