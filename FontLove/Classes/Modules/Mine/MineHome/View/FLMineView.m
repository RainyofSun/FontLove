//
//  FLMineView.m
//  FontLove
//
//  Created by EGLS_BMAC on 2020/11/18.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "FLMineView.h"

@interface FLMineView ()

@property (weak, nonatomic) IBOutlet UIImageView *emptyImgView;
@property (weak, nonatomic) IBOutlet UILabel *emptyLab;
@property (weak, nonatomic) IBOutlet UILabel *duanYuLab;
@property (weak, nonatomic) IBOutlet UILabel *fontLab;
@property (weak, nonatomic) IBOutlet UILabel *collectionLab;
@property (weak, nonatomic) IBOutlet UILabel *recommandLab;
@property (weak, nonatomic) IBOutlet UIButton *recoverBtn;
@property (weak, nonatomic) IBOutlet UIButton *clearBtn;

@end

@implementation FLMineView

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupUI];
}

- (void)dealloc {
    [[FLCommonCache UserGlobalCache] removeObserver:self forKeyPath:@"collectionArray"];
    NSLog(@"DELLOC : %@",NSStringFromClass(self.class));
}

- (void)reloadFont {
    [self.emptyLab reloadFont];
    [self.duanYuLab reloadFont];
    [self.fontLab reloadFont];
    [self.collectionLab reloadFont];
    [self.recommandLab reloadFont];
    [self.recoverBtn.titleLabel reloadFont];
    [self.clearBtn.titleLabel reloadFont];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"collectionArray"]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.emptyLab.hidden = self.emptyImgView.hidden = [FLCommonCache UserGlobalCache].collectionArray.count;
            self.duanYuLab.hidden = !self.emptyLab.hidden;
            if (!self.duanYuLab.hidden) {
                self.duanYuLab.text = [FLCommonCache UserGlobalCache].collectionArray.lastObject;
            }
        });
    }
}

- (IBAction)showMoreCollection:(UIButton *)sender {
    [[self nearsetViewController].navigationController pushViewController:[FLModuleMsgSend sendMsg:@"" vcName:@"FLMineCollectionDetailViewController"] animated:YES];
}

- (IBAction)recoverFont:(UIButton *)sender {
    [FLCommonCache UserGlobalCache].fontName = @"";
    [FLCommonCache UserGlobalCache].fontDownloadComplete = NO;
    [self reloadFont];
}

- (IBAction)clearCache:(UIButton *)sender {
    [MBHUDToastManager showBriefAlert:@"缓存已清理"];
    [[[FLCommonCache UserGlobalCache] mutableArrayValueForKey:@"collectionArray"] removeAllObjects];
}

- (void)setupUI {
    [[FLCommonCache UserGlobalCache] addObserver:self forKeyPath:@"collectionArray" options:NSKeyValueObservingOptionNew context:nil];
}

@end
