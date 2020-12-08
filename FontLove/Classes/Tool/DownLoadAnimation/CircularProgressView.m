//
//  CircularProgressView.m
//  SellMyiPhone
//
//  Created by Vincent on 1/12/17.
//  Copyright © 2017 Huishoubao Tech. All rights reserved.
//

#import "CircularProgressView.h"

#define LineWidth 5.f
#define Space 7.f

@interface CircularProgressView ()

/** processLab */
@property (nonatomic,strong) UILabel *processLab;

@end

@implementation CircularProgressView

- (instancetype)init {
    if (self = [super init]) {
        self.backgroundColor = [UIColor clearColor];
        self.processLab = [[UILabel alloc] init];
        self.processLab.font = [UIFont boldSystemFontOfSize:20];
        self.processLab.textColor = [UIColor whiteColor];
        self.processLab.textAlignment = NSTextAlignmentCenter;
        self.processLab.text = @"0%";
        [self addSubview:self.processLab];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.processLab.frame = CGRectMake(CGRectGetWidth(self.bounds)/4, CGRectGetWidth(self.bounds)/4, CGRectGetWidth(self.bounds)/2, CGRectGetWidth(self.bounds)/2);
}

- (void)dealloc {
    NSLog(@"DELLOC : %@",NSStringFromClass(self.class));
}

- (void)setProgress:(float)progress {
    if (progress >= 100.f) {
        _progress = 100.f;
    }
    _progress = progress;
    self.processLab.text = [[NSString stringWithFormat:@"%.0f",progress] stringByAppendingString:@"%"];
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    [self drawBackground];
    [self drawProgressLine];
}

- (void)drawProgressLine {
    [self drawCircleDashed:NO];
}

- (void)drawBackground {
    CGRect rect = self.bounds;
    CGPoint center = CGPointMake(CGRectGetWidth(rect) / 2.f, CGRectGetHeight(rect) / 2.f);
    CGFloat radius = MIN(CGRectGetHeight(rect), CGRectGetWidth(rect)) / 2 - Space - LineWidth;
    // draw pie
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    [[[UIColor alloc] initWithRed:246/255.0 green:178/255.0 blue:9/255.0 alpha:1] setFill];
    [path fill];
    // draw dash circle
    [self drawCircleDashed:YES];
}

- (void)drawCircleDashed:(BOOL)dash {
    CGRect rect = self.bounds;
    CGPoint center = CGPointMake(CGRectGetWidth(rect) / 2.f, CGRectGetHeight(rect) / 2.f);
    CGFloat radius = MIN(CGRectGetHeight(rect), CGRectGetWidth(rect)) / 2 - LineWidth / 2;
    CGFloat endAngle = 2 * M_PI;
    CGFloat startAngle = 0;
    if (!dash) {
        startAngle = -M_PI_2;
        endAngle = M_PI * 2 * self.progress / 100.f - M_PI_2;
    }
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
    if (dash) {
        CGFloat lengths[] = {2, 6};
        [path setLineDash:lengths count:2 phase:0];
    }
    [path setLineWidth:LineWidth];
    [[[UIColor alloc] initWithRed:246/255.0 green:178/255.0 blue:9/255.0 alpha:1] setStroke];
    [path stroke];
}

@end
