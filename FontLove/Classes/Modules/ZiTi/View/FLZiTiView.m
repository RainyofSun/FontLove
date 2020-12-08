//
//  FLZiTiView.m
//  FontLove
//
//  Created by EGLS_BMAC on 2020/11/18.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "FLZiTiView.h"
#import "FLZiTiTableViewCell.h"

static NSString *ziTiCell = @"ziTiCell";

@interface FLZiTiView ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *ziTiTableView;
/** dataSource */
@property (nonatomic,strong) NSArray <NSDictionary *>*dataSource;

@end

@implementation FLZiTiView

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupTableView];
}

- (void)reloadZiTiSource:(NSArray <NSDictionary *>*)source {
    self.dataSource = source;
    [self.ziTiTableView reloadData];
}

- (void)reloadFont {
    [self.ziTiTableView reloadData];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FLZiTiTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ziTiCell];
    [cell resetZiTiText:[self.dataSource[indexPath.row] allKeys].firstObject];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ((void (*)(id, SEL, NSString *))objc_msgSend)([self nearsetViewController], @selector(downloadFont:), [self.dataSource[indexPath.row] allValues].firstObject);
}

#pragma mark - private methods
- (void)setupTableView {
    self.ziTiTableView.delegate = self;
    self.ziTiTableView.dataSource = self;
    [self.ziTiTableView registerNib:[UINib nibWithNibName:@"FLZiTiTableViewCell" bundle:nil] forCellReuseIdentifier:ziTiCell];
}

@end
