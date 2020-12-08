//
//  FLDuanYuView.m
//  FontLove
//
//  Created by EGLS_BMAC on 2020/11/17.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "FLDuanYuView.h"
#import "FLMingJuTableViewCell.h"
#import "FLMingJuSectionHeaderView.h"

static NSString *MingJuCell = @"MingJuCell";
static NSString *MingJuSectionHeader = @"MingJuSectionHeader";

@interface FLDuanYuView ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *duanYuTableView;

/** dataSource */
@property (nonatomic,strong) NSArray <FLDuanYuModel *>*dataSource;

@end

@implementation FLDuanYuView

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupTableView];
}

- (void)dealloc {
    NSLog(@"DELLOC : %@",NSStringFromClass(self.class));
}

- (void)reloadDuanYuModel:(NSArray<FLDuanYuModel *> *)modelSource {
    self.dataSource = modelSource;
    [self.duanYuTableView reloadData];
}

- (void)reloadFont {
    [self.duanYuTableView reloadData];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource[section].dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FLMingJuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MingJuCell];
    [cell reloadMingJuCellSource:[self.dataSource[indexPath.section].dataList[indexPath.row] objectForKey:@"text"]];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    FLMingJuSectionHeaderView *sectionView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:MingJuSectionHeader];
    [sectionView resetSectionHeaderText:self.dataSource[section].categoryName sectionIndex:section];
    return sectionView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [MBHUDToastManager showBriefAlert:@"收藏成功"];
    [[[FLCommonCache UserGlobalCache] mutableArrayValueForKey:@"collectionArray"] addObject:[self.dataSource[indexPath.section].dataList[indexPath.row] objectForKey:@"text"]];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

- (void)setupTableView {
    self.duanYuTableView.delegate = self;
    self.duanYuTableView.dataSource = self;
    [self.duanYuTableView registerNib:[UINib nibWithNibName:@"FLMingJuTableViewCell" bundle:nil] forCellReuseIdentifier:MingJuCell];
    [self.duanYuTableView registerNib:[UINib nibWithNibName:@"FLMingJuSectionHeaderView" bundle:nil] forHeaderFooterViewReuseIdentifier:MingJuSectionHeader];
}

@end
