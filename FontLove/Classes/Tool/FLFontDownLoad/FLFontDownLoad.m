//
//  FLFontDownLoad.m
//  FontLove
//
//  Created by EGLS_BMAC on 2020/11/18.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "FLFontDownLoad.h"

@implementation FLFontDownLoad

- (void)dealloc {
    NSLog(@"DELLOC : %@",NSStringFromClass(self.class));
}

+ (BOOL)isFontDownLoaded:(NSString *)fontName {
    UIFont *aFont = [UIFont fontWithName:fontName size:17];
    if (aFont && ([aFont.fontName compare:fontName] == NSOrderedSame || [aFont.familyName compare:fontName] == NSOrderedSame)) {
        return YES;
    }else{
        return NO;
    }
}

+ (void)downloadWithFontName:(NSString *)fontName downloadBegin:(nonnull void (^)(void))begin downloadProgress:(nonnull void (^)(CGFloat))value downloadComplete:(nonnull void (^)(void))complete {
    //用字体的PostScript名字创建一个 dictionary
    NSMutableDictionary *attrs = [NSMutableDictionary dictionaryWithObjectsAndKeys:fontName,kCTFontNameAttribute, nil];
    //创建一个字体描述对象 CTFontDescriptorRef
    CTFontDescriptorRef desc = CTFontDescriptorCreateWithAttributes((__bridge CFDictionaryRef)attrs);
    //将字体描述对象放到一个NSMutableArray中
    NSMutableArray *descs = [NSMutableArray arrayWithCapacity:0];
    [descs addObject:(__bridge id _Nonnull)desc];
    CFRelease(desc);
    
    __block BOOL errorDuringDownload = NO;
    //下载字体
    CTFontDescriptorMatchFontDescriptorsWithProgressHandler((__bridge CFArrayRef)descs , NULL, ^bool(CTFontDescriptorMatchingState state, CFDictionaryRef  _Nonnull progressParameter) {
        double progressValue = [[(__bridge NSDictionary *)progressParameter objectForKey:(id)kCTFontDescriptorMatchingPercentage] doubleValue];
        switch (state) {
            case kCTFontDescriptorMatchingDidBegin:
                //字体已经匹配
                
                break;
            case kCTFontDescriptorMatchingWillBeginDownloading:
                //字体开始下载
                {
                    NSLog(@"字体开始下载");
                    dispatch_async(dispatch_get_main_queue(), ^{
                        if (begin) {
                            begin();
                        }
                    });
                }
                break;
            case kCTFontDescriptorMatchingDownloading:
            {
                NSLog(@" 下载进度 %.0f",progressValue);
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (value) {
                        value(progressValue);
                    }
                });
            }
                break;
            case kCTFontDescriptorMatchingDidFinishDownloading:
                //字体下载完成
                
                break;
            case kCTFontDescriptorMatchingDidFinish:
            {
                //字体已经下载完成
                if (!errorDuringDownload) {
                    NSLog(@"字体%@ 已经下载完成",fontName);
                    dispatch_async( dispatch_get_main_queue(), ^ {
                        // 可以在这里修改 UI 控件的字体
                        if (complete) {
                            complete();
                        }
                        return ;
                    });
                }
    
            }
                break;
            case kCTFontDescriptorMatchingDidFailWithError:
                //下载错误
            {
                NSError *error = [(__bridge NSDictionary *)progressParameter objectForKey:(id)kCTFontDescriptorMatchingError];
                // 设置标志
                errorDuringDownload = YES;
                NSLog(@" 下载错误: %@", error.description);
            }
                break;
            default:
                break;
        }
        return YES;
    });
}

@end
