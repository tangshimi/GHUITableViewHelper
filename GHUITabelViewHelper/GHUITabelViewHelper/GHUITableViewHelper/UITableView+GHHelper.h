//
//  UITableView+GHHelper.h
//
//
//  Created by tangshimi on 7/13/16.
//  Copyright © 2016 tangshimi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GHTableViewDelegate.h"

typedef void(^GHTableViewCellDidSelectBlock)(id model, NSIndexPath *indexPath);
typedef void(^GHTableViewCellDetailEventBlock)(id model, NSUInteger type, NSIndexPath *indexPath);

@interface UITableView (GHHelper)

@property (nonatomic, copy) NSDictionary *gh_registerCells;
@property (nonatomic, strong) NSArray *gh_dataArray;
@property (nonatomic, weak) id<GHTableViewDelegate> gh_delegate;
@property (nonatomic, copy) GHTableViewCellDidSelectBlock gh_cellDidSelectBlock;
@property (nonatomic, copy) GHTableViewCellDetailEventBlock gh_cellDetailEventBlock;

@end
