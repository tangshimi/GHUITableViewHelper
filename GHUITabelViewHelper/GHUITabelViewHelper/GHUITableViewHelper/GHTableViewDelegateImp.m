//
//  GHTableViewDelegateImp.m
//  jiankangbao
//
//  Created by tangshimi on 7/14/16.
//  Copyright © 2016 guahao. All rights reserved.
//

#import "GHTableViewDelegateImp.h"
#import "UITableView+GHHelper.h"
#import <objc/runtime.h>
#import "GHTableViewCellDelegate.h"

static const CGFloat kCellDefaultHeight = 30.0;

@interface GHTableViewDelegateImp ()<GHTableViewCellEventDelegate>

@end

@implementation GHTableViewDelegateImp

- (id)forwardingTargetForSelector:(SEL)aSelector {
    if ([super forwardingTargetForSelector:aSelector]) {
        return self;
    } else if ([self.delegate respondsToSelector:aSelector]) {
        return self.delegate;
    }
    return self;
}

- (BOOL)respondsToSelector:(SEL)aSelector
{    
    return [super respondsToSelector:aSelector] || [self.delegate respondsToSelector:aSelector];
}

#pragma mark -
#pragma mark - GHTableViewCellEventDelegate -

- (void)model:(id)model cellEventType:(NSUInteger)type cellIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(tableView: model:cellEventType:cellIndexPath:)]) {
        [self.delegate tableView:self.tableView model:model cellEventType:type cellIndexPath:indexPath];
    }
    
    if (self.tableView.gh_cellDetailEventBlock) {
        self.tableView.gh_cellDetailEventBlock(model, type, indexPath);
    }
}

#pragma mark -
#pragma mark - UITableViewDelegate -

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    id model = self.tableView.gh_dataArray[indexPath.section][indexPath.row];
    
    if ([cell conformsToProtocol:@protocol(GHTableViewCellDelegate)]) {
        if ([cell respondsToSelector:@selector(setCurrentIndexPath:)]) {
            [cell performSelector:@selector(setCurrentIndexPath:) withObject:indexPath];
        }
        
        if ([cell respondsToSelector:@selector(setFirstCell:)]) {
            [cell performSelector:@selector(setFirstCell:) withObject:@(indexPath.row == 0 ? : NO)];
        }
        
        if ([cell respondsToSelector:@selector(setLastCell:)]) {
            [cell performSelector:@selector(setLastCell:) withObject:@([self.tableView.gh_dataArray[indexPath.section] count] - 1 ? : NO)];
        }

        if ([cell respondsToSelector:@selector(configureCellWithModel:)]) {
            [cell performSelector:@selector(configureCellWithModel:) withObject:model]; 
        }
        
        if ([cell respondsToSelector:@selector(setDelegate:)]) {
            [cell performSelector:@selector(setDelegate:) withObject:self];
        }
        
        if ([cell respondsToSelector:@selector(setModel:)]) {
            [cell performSelector:@selector(setModel:) withObject:model];
        }
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    id model = self.tableView.gh_dataArray[indexPath.section][indexPath.row];

    if ([self.delegate respondsToSelector:@selector(tableView:model:didSelectRowAtIndexPath:)]) {
        [self.delegate tableView:tableView model:model didSelectRowAtIndexPath:indexPath];
    }
    
    if (self.tableView.gh_cellDidSelectBlock) {
        self.tableView.gh_cellDidSelectBlock(model, indexPath);
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id model = self.tableView.gh_dataArray[indexPath.section][indexPath.row];

    Class cellClass = self.tableView.gh_registerCells[NSStringFromClass([model class])];
    if ([cellClass conformsToProtocol:@protocol(GHTableViewCellDelegate)]) {
        if ([cellClass respondsToSelector:@selector(heightWithModel:)]) {
            return [cellClass heightWithModel:model];
        } else {
            return kCellDefaultHeight;
        }
    }
    return kCellDefaultHeight;
}

@end
