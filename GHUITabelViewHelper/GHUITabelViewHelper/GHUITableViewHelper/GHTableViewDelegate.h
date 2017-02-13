//
//  GHTableViewDelegate.h
//  
//
//  Created by tangshimi on 7/15/16.
//  Copyright © 2016 tangshimi. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GHTableViewDelegate <NSObject>

@optional

- (void)tableView:(UITableView *)tableView model:(id)model didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

- (void)tableView:(UITableView *)tableView model:(id)model cellEventType:(NSUInteger)type cellIndexPath:(NSIndexPath *)indexPath;

@end
