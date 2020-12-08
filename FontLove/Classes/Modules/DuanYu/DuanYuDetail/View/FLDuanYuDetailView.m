//
//  FLDuanYuDetailView.m
//  FontLove
//
//  Created by EGLS_BMAC on 2020/11/18.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "FLDuanYuDetailView.h"
#import "FLDuanYuDetailTableViewCell.h"

static NSString *duanYuDetailCell = @"duanYuDetailCell";

@interface FLDuanYuDetailView ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *detailTableView;

/** dataSource */
@property (nonatomic,strong) NSArray <FLDuanYuDetailModel *> *dataSource;

@end

@implementation FLDuanYuDetailView

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupTableView];
}

- (void)dealloc {
    NSLog(@"DELLOC : %@",NSStringFromClass(self.class));
}

- (void)reloadDuanYuDetailSource:(NSArray<FLDuanYuDetailModel *> *)source {
    self.dataSource = source;
    [self.detailTableView reloadData];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FLDuanYuDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:duanYuDetailCell];
    [cell resetDetailContentText:self.dataSource[indexPath.row].text];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [MBHUDToastManager showBriefAlert:@"收藏成功"];
    [[[FLCommonCache UserGlobalCache] mutableArrayValueForKey:@"collectionArray"] addObject:self.dataSource[indexPath.row].text];
}

#pragma mark - private methods
- (void)setupTableView {
    self.detailTableView.delegate = self;
    self.detailTableView.dataSource = self;
    [self.detailTableView registerNib:[UINib nibWithNibName:@"FLDuanYuDetailTableViewCell" bundle:nil] forCellReuseIdentifier:duanYuDetailCell];
}

@end
