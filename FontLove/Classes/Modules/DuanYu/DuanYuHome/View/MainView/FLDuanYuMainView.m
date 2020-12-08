//
//  FLDuanYuMainView.m
//  FontLove
//
//  Created by EGLS_BMAC on 2020/11/17.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "FLDuanYuMainView.h"
#import "FLDuanYuSliderBar.h"
#import "FLDuanYuView.h"

@interface FLDuanYuMainView ()<UIScrollViewDelegate>

/** topBar */
@property (nonatomic,strong) FLDuanYuSliderBar *topBar;
/** titleArray */
@property (nonatomic,strong) NSArray <NSString *>*titleArray;
/** scrollView */
@property (nonatomic,strong) UIScrollView *mainScrollView;
/** duanZiView */
@property (nonatomic,strong) FLDuanYuView *duanZiView;
/** mingYanView */
@property (nonatomic,strong) FLDuanYuView *mingYanView;
/** taiCiView */
@property (nonatomic,strong) FLDuanYuView *taiCiView;

/** dataSource */
@property (nonatomic,strong) NSArray <NSArray <FLDuanYuModel *>*>*dataSource;

@end

@implementation FLDuanYuMainView

- (instancetype)init {
    if (self = [super init]) {
        [self setDefaultData];
        [self setupUI];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.mainScrollView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
    [self.mainScrollView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.topBar];
    
    self.duanZiView.frame = CGRectMake(0, 8, CGRectGetWidth(self.bounds), (CGRectGetHeight(self.bounds) - CGRectGetHeight(self.topBar.bounds)));
}

- (void)dealloc {
    NSLog(@"DELLOC : %@",NSStringFromClass(self.class));
}

- (void)loadDuanYuData:(NSArray <NSArray <FLDuanYuModel *> *>*)duanYuSource {
    self.dataSource = duanYuSource;
    [self.duanZiView reloadDuanYuModel:self.dataSource.firstObject];
}

- (NSInteger)sliderBarSelectedIndex {
    return self.mainScrollView.contentOffset.x / ScreenWidth;
}

- (void)reloadSliderBarFont {
    [self.topBar reloadFont];
    NSInteger X = self.mainScrollView.contentOffset.x / ScreenWidth;
    switch (X) {
        case 0:
            [self.duanZiView reloadFont];
            break;
        case 1:
            [self.mingYanView reloadFont];
            break;
        case 2:
            [self.taiCiView reloadFont];
            break;
        default:
            break;
    }
}

#pragma mark - 消息透传
- (void)switchTopSliderBarItem:(NSNumber *)senderTag {
    switch (senderTag.integerValue) {
        case 0:
            [self.mainScrollView setContentOffset:CGPointZero animated:YES];
            break;
        case 1:
            [self.mainScrollView addSubview:self.mingYanView];
            self.mingYanView.frame = CGRectMake(ScreenWidth * senderTag.integerValue, 0, ScreenWidth, CGRectGetHeight(self.duanZiView.bounds));
            [self.mainScrollView setContentOffset:CGPointMake(ScreenWidth * senderTag.integerValue, 0) animated:YES];
            [self.mingYanView reloadDuanYuModel:self.dataSource[senderTag.integerValue]];
            break;
        case 2:
            [self.mainScrollView addSubview:self.taiCiView];
            self.taiCiView.frame = CGRectMake(ScreenWidth * senderTag.integerValue, 0, ScreenWidth, CGRectGetHeight(self.duanZiView.bounds));
            [self.mainScrollView setContentOffset:CGPointMake(ScreenWidth * senderTag.integerValue, 0) animated:YES];
            [self.taiCiView reloadDuanYuModel:self.dataSource[senderTag.integerValue]];
            break;
        default:
            break;
    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
}

/**
*  滚动完毕就会调用（如果不是人为拖拽scrollView导致滚动完毕，才会调用这个方法）
*/
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    FLOG(@"不是人为拖拽scrollView导致滚动完毕");
    
}

/**
 *  滚动完毕就会调用（如果是人为拖拽scrollView导致滚动完毕，才会调用这个方法）
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    FLOG(@"人为拖拽scrollView导致滚动完毕");
    NSInteger X = scrollView.contentOffset.x / ScreenWidth;
    [self.topBar switchSliderBar:X];
}

#pragma mark - private methods
- (void)setDefaultData {
    self.titleArray = @[@"搞笑段子",@"至理名言",@"影视台词"];
}

- (void)setupUI {
    
    self.mainScrollView = [[UIScrollView alloc] init];
    if (@available(iOS 11.0, *)) {
        self.mainScrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        // Fallback on earlier versions
    }
    self.mainScrollView.delegate = self;
    self.mainScrollView.contentSize = CGSizeMake(ScreenWidth * 3, 0);
    self.mainScrollView.bounces = NO;
    self.mainScrollView.showsVerticalScrollIndicator = NO;
    self.mainScrollView.showsHorizontalScrollIndicator = NO;
    self.mainScrollView.pagingEnabled = YES;
    self.mainScrollView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.mainScrollView];
    
    self.backgroundColor = HexColor(0xF4F4F4);
    [self addSubview:self.topBar];
    [self.topBar loadSliderBarTitleSource:self.titleArray];
    [self.mainScrollView addSubview:self.duanZiView];
}

#pragma mark - lazy
- (FLDuanYuSliderBar *)topBar {
    if (!_topBar) {
        _topBar = [[FLDuanYuSliderBar alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 64)];
    }
    return _topBar;
}

- (FLDuanYuView *)duanZiView {
    if (!_duanZiView) {
        _duanZiView = [[[NSBundle mainBundle] loadNibNamed:@"FLDuanYuView" owner:nil options:nil] firstObject];
    }
    return _duanZiView;
}

- (FLDuanYuView *)mingYanView {
    if (!_mingYanView) {
        _mingYanView = [[[NSBundle mainBundle] loadNibNamed:@"FLDuanYuView" owner:nil options:nil] firstObject];
    }
    return _mingYanView;
}

- (FLDuanYuView *)taiCiView {
    if (!_taiCiView) {
        _taiCiView = [[[NSBundle mainBundle] loadNibNamed:@"FLDuanYuView" owner:nil options:nil] firstObject];
    }
    return _taiCiView;
}

@end
