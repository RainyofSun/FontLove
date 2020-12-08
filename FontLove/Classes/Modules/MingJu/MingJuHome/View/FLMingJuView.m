//
//  FLMingJuView.m
//  FontLove
//
//  Created by EGLS_BMAC on 2020/11/17.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "FLMingJuView.h"
#import "AppCycleScrollview.h"
#import "FLMingJuTableViewCell.h"
#import "FLMingJuSectionHeaderView.h"

static NSString *MingJuCell = @"MingJuCell";
static NSString *MingJuSectionHeader = @"MingJuSectionHeader";

@interface FLMingJuView ()<AppCycleScrollviewDelegate,UITableViewDelegate,UITableViewDataSource>

/** imgBannerView */
@property (nonatomic,strong) AppCycleScrollview *imgBannerView;

@property (weak, nonatomic) IBOutlet UITableView *mingJuTableView;

/** dataSource */
@property (nonatomic,strong) NSArray <FLMingJuModel *>*dataSource;

@end

@implementation FLMingJuView

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupImgBannerView];
    [self setupTableView];
}

- (void)dealloc {
    NSLog(@"DELLOC : %@",NSStringFromClass(self.class));
}

- (void)reloadMingJuModel:(NSArray<FLMingJuModel *> *)modelSource {
    self.dataSource = modelSource;
    [self.mingJuTableView reloadData];
}

- (void)reloadFont {
    [self.mingJuTableView reloadData];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource[section].list.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FLMingJuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MingJuCell];
    [cell reloadMingJuCellSource:[self.dataSource[indexPath.section].list[indexPath.row] objectForKey:@"text"]];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    FLMingJuSectionHeaderView *sectionView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:MingJuSectionHeader];
    [sectionView resetSectionHeaderText:self.dataSource[section].type sectionIndex:section];
    return sectionView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

#pragma mark - AppCycleScrollviewDelegate
- (void)cycleScrollView:(AppCycleScrollview *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    
}

#pragma mark - private methods
- (void)setupTableView {
    self.mingJuTableView.delegate = self;
    self.mingJuTableView.dataSource = self;
    [self.mingJuTableView registerNib:[UINib nibWithNibName:@"FLMingJuTableViewCell" bundle:nil] forCellReuseIdentifier:MingJuCell];
    [self.mingJuTableView registerNib:[UINib nibWithNibName:@"FLMingJuSectionHeaderView" bundle:nil] forHeaderFooterViewReuseIdentifier:MingJuSectionHeader];
}

- (void)setupImgBannerView {
    
    self.imgBannerView = [AppCycleScrollview appCycleScrollViewWithFrame:CGRectMake(0, 0, ScreenWidth, 250) shouldInfiniteLoop:YES cycleDelegate:self];
    self.imgBannerView.imgCornerRadius = 5.0f;
    self.imgBannerView.autoScrollTimeInterval = 3.0f;
    self.imgBannerView.isZoom = NO;
    self.imgBannerView.heightProportion = 1;
    self.imgBannerView.itemWidth = ScreenWidth;
    self.imgBannerView.isHidePageControl = NO;
    [self addSubview:self.imgBannerView];
    self.imgBannerView.placeholderImage = [UIImage imageNamed:@"loop1.jpg"];
    self.imgBannerView.imageURLStringsGroup = @[@"loop1.jpg",@"loop2.jpeg",@"loop3.jpg"];
}

@end
