//
//  GHBaseTableViewCell.m
//  HealthJiangSu
//
//  Created by tangshimi on 28/09/2016.
//  Copyright © 2016 guahao. All rights reserved.
//

#import "GHBaseTableViewCell.h"

@interface GHBaseTableViewCell ()

@property (nonatomic, strong) UIView *topBorderView;
@property (nonatomic, strong) UIView *bottomBorderView;

@end

@implementation GHBaseTableViewCell

- (void)addTopBorderLine
{
    [self.contentView addSubview:self.topBorderView];
    
    NSDictionary *views = @{ @"topBorderView" : self.topBorderView };
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[topBorderView]-0-|" options:0 metrics:nil views:views]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[topBorderView(0.5)]" options:0 metrics:nil views:views]];
}

- (void)addBottomBorderLine
{
    [self addSubview:self.bottomBorderView];
    NSDictionary *views = @{ @"bottomBorderView" : self.bottomBorderView };
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bottomBorderView]-0-|" options:0 metrics:nil views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[bottomBorderView(0.5)]-0-|" options:0 metrics:nil views:views]];
}

#pragma mark -
#pragma mark - setter and getter -

- (UIView *)topBorderView
{
    if (!_topBorderView) {
        _topBorderView = ({
            UIView *view = [[UIView alloc] init];
            view.translatesAutoresizingMaskIntoConstraints = NO;
            view.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.5];
            view;
        });
    }
    return _topBorderView;
}

- (UIView *)bottomBorderView
{
    if (!_bottomBorderView) {
        _bottomBorderView = ({
            UIView *view = [[UIView alloc] init];
            view.translatesAutoresizingMaskIntoConstraints = NO;
            view.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.5];
            view;
        });
    }
    return _bottomBorderView;
}

@end
