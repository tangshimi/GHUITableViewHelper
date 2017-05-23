//
//  GHTableViewCellDelegate.h
//
//
//  Created by tangshimi on 7/14/16.
//  Copyright © 2016 tangshimi. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GHTableViewCellEventDelegate <NSObject>

- (void)model:(id)model cellEventType:(NSUInteger)type cellIndexPath:(NSIndexPath *)indexPath;

@end

@protocol GHTableViewCellDelegate <NSObject>

@optional

@property (nonatomic, strong) NSIndexPath *currentIndexPath;
@property (nonatomic, strong) NSNumber *firstCell;
@property (nonatomic, strong) NSNumber *lastCell;
@property (nonatomic, weak) id<GHTableViewCellEventDelegate> delegate;
@property (nonatomic, strong) id model;

+ (CGFloat)heightWithModel:(id)model;

- (void)configureCellWithModel:(id)model;

@end
