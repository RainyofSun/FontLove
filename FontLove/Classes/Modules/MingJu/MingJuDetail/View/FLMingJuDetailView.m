//
//  FLMingJuDetailView.m
//  FontLove
//
//  Created by EGLS_BMAC on 2020/11/17.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "FLMingJuDetailView.h"
#import "FLMingJuTableViewCell.h"

static NSString *MingJuCell = @"MingJuCell";

@interface FLMingJuDetailView ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *detailTableView;

/** dataSource */
@property (nonatomic,strong) NSArray <NSDictionary *>*dataSource;

@end

@implementation FLMingJuDetailView

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupTableView];
}

- (void)dealloc {
    NSLog(@"DELLOC : %@",NSStringFromClass(self.class));
}

- (void)reloadDetailSource:(NSArray<NSDictionary *> *)dataSource {
    self.dataSource = dataSource;
    [self.detailTableView reloadData];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FLMingJuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MingJuCell];
    [cell reloadMingJuCellSource:[self.dataSource[indexPath.row] objectForKey:@"text"]];
    return cell;
}

#pragma mark - private methods
- (void)setupTableView {
    self.detailTableView.delegate = self;
    self.detailTableView.dataSource = self;
    [self.detailTableView registerNib:[UINib nibWithNibName:@"FLMingJuTableViewCell" bundle:nil] forCellReuseIdentifier:MingJuCell];
}

@end
