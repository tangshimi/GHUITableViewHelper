//
//  GHTableViewCell.m
//  GHUITabelViewHelper
//
//  Created by tangshimi on 10/02/2017.
//  Copyright © 2017 guahao. All rights reserved.
//

#import "GHTableViewCell.h"
#import "CellModel.h"

@interface GHTableViewCell ()

@property (nonatomic, strong) UIButton *button;

@end

@implementation GHTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self.contentView addSubview:self.button];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.button attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1 constant:-50]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.button attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    }
    return self;
}

- (void)configureCellWithModel:(CellModel *)model
{
    [self addBottomBorderLine];

    self.textLabel.text = model.title;
    
    [self.contentView bringSubviewToFront:self.button];
}

+ (CGFloat)heightWithModel:(id)model
{
    return 60;
}

#pragma mark -
#pragma mark - response event -

- (void)buttonAction:(UIButton *)button
{
    [self.delegate model:self.model cellEventType:1 cellIndexPath:self.currentIndexPath];
}

#pragma mark -
#pragma mark - setter and getter -

- (UIButton *)button
{
    if (!_button) {
        _button = ({
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.translatesAutoresizingMaskIntoConstraints = NO;
            [button setTitle:@"点击" forState:UIControlStateNormal];
            [button.titleLabel setFont:[UIFont systemFontOfSize:15]];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            button;
        });
    }
    return _button;
}

@end
