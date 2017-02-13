//
//  GHTableViewDataSoureImp.h
//
//
//  Created by tangshimi on 7/14/16.
//  Copyright © 2016 tangshimi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GHTableViewDataSoureImp : NSObject <UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, weak) id<UITableViewDataSource> delegate;

@end
