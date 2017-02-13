//
//  GHTableViewDataSoure.m
//  
//
//  Created by tangshimi on 7/14/16.
//  Copyright © 2016 tangshimi. All rights reserved.
//

#import "GHTableViewDataSoureImp.h"
#import "UITableView+GHHelper.h"

@implementation GHTableViewDataSoureImp

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
#pragma mark - UITableViewDataSource -

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.tableView.gh_dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tableView.gh_dataArray[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id model = self.tableView.gh_dataArray[indexPath.section][indexPath.row];

    NSDictionary *resgisterCells = self.tableView.gh_registerCells;
    NSString *key = NSStringFromClass([model class]);
    
    NSAssert([resgisterCells objectForKey:key], @"必须先注册cell和modle");

    NSString *cellIdentifier = NSStringFromClass(self.tableView.gh_registerCells[NSStringFromClass([model class])]);
        
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    return cell;
}

@end
