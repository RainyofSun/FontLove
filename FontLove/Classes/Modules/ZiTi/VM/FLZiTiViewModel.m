//
//  FLZiTiViewModel.m
//  FontLove
//
//  Created by EGLS_BMAC on 2020/11/18.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "FLZiTiViewModel.h"
#import "FLZiTiView.h"
#import "CircularProgressView.h"

@interface FLZiTiViewModel ()

/** ziTiView */
@property (nonatomic,strong) FLZiTiView *ziTiView;
/** circleView */
@property (nonatomic,strong) CircularProgressView *circleView;

@end

@implementation FLZiTiViewModel

- (void)dealloc {
    NSLog(@"DELLOC : %@",NSStringFromClass(self.class));
}

- (void)setupZiTiView:(UIView *)view {
    [view addSubview:self.ziTiView];
    [self.ziTiView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
    [self.ziTiView reloadZiTiSource:[self ziTiSource]];
}

- (void)downloadFont:(NSString *)fontScript {
    NSLog(@"font %@",fontScript);
    [FLCommonCache UserGlobalCache].fontName = fontScript;
    if ([FLFontDownLoad isFontDownLoaded:[FLCommonCache UserGlobalCache].fontName]) {
        [self.ziTiView reloadFont];
    } else {
        WeakSelf;
        [FLFontDownLoad downloadWithFontName:fontScript downloadBegin:^{
            if (![weakSelf.ziTiView.superview.subviews containsObject:weakSelf.circleView]) {
                [weakSelf.ziTiView.superview addSubview:weakSelf.circleView];
                [weakSelf.circleView autoCenterInSuperview];
                [weakSelf.circleView autoSetDimensionsToSize:CGSizeMake(100, 100)];
            }
        } downloadProgress:^(CGFloat progressValue) {
            weakSelf.circleView.progress = progressValue;
        } downloadComplete:^{
            [FLCommonCache UserGlobalCache].fontDownloadComplete = YES;
            [weakSelf.circleView removeFromSuperview];
            weakSelf.circleView = nil;
            [weakSelf.ziTiView reloadFont];
        }];
    }
}

#pragma mark - private methods
- (NSArray <NSDictionary *>*)ziTiSource {
    return @[@{@"华文仿宋":@"STFangsong"},@{@"华文黑体":@"STXihei"},@{@"楷体-繁":@"STKaitiTC-Regular"},@{@"楷体-简":@"STKaitiSC-Regular"},
             @{@"兰亭黑-繁":@"FZLTTHB--B51-0"},@{@"兰亭黑-简":@"FZLTXHK--GBK1-0"},@{@"隶变-繁":@"STLibianTC-Regular"},@{@"隶变-简":@"STLibianSC-Regular"},
             @{@"凌慧体-繁":@"MLingWaiMedium-TC"},@{@"凌慧体-简":@"MLingWaiMedium-SC"},@{@"翩翩体-繁":@"HanziPenTC-W3"},@{@"翩翩体-简":@"HanziPenSC-W3"},
             @{@"手札体-繁":@"HannotateTC-W5"},@{@"手札体-简":@"HannotateSC-W5"},@{@"宋体-繁":@"STSongti-TC-Regular"},@{@"宋体-简":@"STSongti-SC-Regular"},
             @{@"娃娃体-繁":@"DFWaWaTC-W5"},@{@"娃娃体-简":@"DFWaWaSC-W5"},@{@"魏碑-繁":@"WeibeiTC-Bold"},@{@"魏碑-简":@"WeibeiSC-Bold"},
             @{@"行楷-繁":@"STXingkaiTC-Light"},@{@"行楷-简":@"STXingkaiSC-Light"},@{@"雅痞-繁":@"YuppyTC-Regular"},@{@"雅痞-简":@"YuppySC-Regular"},
             @{@"圆体-繁":@"STYuanti-TC-Regular"},@{@"圆体-简":@"STYuanti-SC-Regular"},@{@"报隶-繁":@"STBaoliTC-Regular"},@{@"报隶-简":@"STBaoliSC-Regular"},];
}

#pragma mark - lazy
- (FLZiTiView *)ziTiView {
    if (!_ziTiView) {
        _ziTiView = [[[NSBundle mainBundle] loadNibNamed:@"FLZiTiView" owner:nil options:nil] firstObject];
    }
    return _ziTiView;
}

- (CircularProgressView *)circleView {
    if (!_circleView) {
        _circleView = [[CircularProgressView alloc] init];
    }
    return _circleView;
}

@end
