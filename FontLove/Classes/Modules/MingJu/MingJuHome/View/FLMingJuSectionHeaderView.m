//
//  FLMingJuSectionHeaderView.m
//  FontLove
//
//  Created by EGLS_BMAC on 2020/11/17.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "FLMingJuSectionHeaderView.h"

@interface FLMingJuSectionHeaderView ()

@property (weak, nonatomic) IBOutlet UILabel *typeLab;
@property (weak, nonatomic) IBOutlet UIButton *moreBtn;

/** section */
@property (nonatomic,assign) NSInteger section;

@end

@implementation FLMingJuSectionHeaderView

- (void)dealloc {
    NSLog(@"DELLOC : %@",NSStringFromClass(self.class));
}

- (void)resetSectionHeaderText:(NSString *)text sectionIndex:(NSInteger)section {
    self.typeLab.text = text;
    self.section = section;
    [self.typeLab reloadFont];
    [self.moreBtn.titleLabel reloadFont];
}

- (IBAction)selectMore:(UIButton *)sender {
    ((void (*)(id, SEL, NSNumber *))objc_msgSend)([self nearsetViewController], @selector(showMoreMingJu:), [NSNumber numberWithInteger:self.section]);
}

@end
