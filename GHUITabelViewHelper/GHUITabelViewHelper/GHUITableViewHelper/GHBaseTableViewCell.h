//
//  GHBaseTableViewCell.h
//
//
//  Created by tangshimi on 28/09/2016.
//  Copyright © 2016 tangshimi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GHTableViewCellDelegate.h"

@interface GHBaseTableViewCell : UITableViewCell <GHTableViewCellDelegate>

@property (nonatomic, strong) NSIndexPath *currentIndexPath;
@property (nonatomic, assign) BOOL firstCell;
@property (nonatomic, assign) BOOL lastCell;
@property (nonatomic, weak) id<GHTableViewCellEventDelegate> delegate;
@property (nonatomic, strong) id model;

- (void)addTopBorderLine;

- (void)addBottomBorderLine;

@end
