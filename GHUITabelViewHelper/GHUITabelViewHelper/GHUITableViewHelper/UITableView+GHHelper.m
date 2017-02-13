//
//  UITableView+GHHelper.m
//
//
//  Created by tangshimi on 7/13/16.
//  Copyright © 2016 tangshimi. All rights reserved.
//

#import "UITableView+GHHelper.h"
#import <objc/runtime.h>
#import "GHTableViewDelegateImp.h"
#import "GHTableViewDataSoureImp.h"
#import "GHTableViewCellDelegate.h"

@interface UITableView ()

@property (nonatomic, strong) GHTableViewDelegateImp *ghTableViewDelgate;
@property (nonatomic, strong) GHTableViewDataSoureImp *ghTableViewDataSource;

@end

@implementation UITableView (GHHelper)

#pragma mark -
#pragma mark - setter and getter -

- (void)setGh_registerCells:(NSDictionary *)gh_registerCells
{
    for (Class cellClass in gh_registerCells.allValues) {
        NSAssert([cellClass isSubclassOfClass:[UITableViewCell class]], @"key为model的类名，value为UITableViewCell的子类的Class!");
        NSAssert([cellClass conformsToProtocol:@protocol(GHTableViewCellDelegate)], @"注册的UITableViewCell的子类必须实现GHTableViewCellDelegate协议!");
        [self registerClass:cellClass forCellReuseIdentifier:NSStringFromClass(cellClass)];
    }

    objc_setAssociatedObject(self, @selector(gh_registerCells), gh_registerCells, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSDictionary *)gh_registerCells
{
    return objc_getAssociatedObject(self, @selector(gh_registerCells));
}

- (void)setGh_dataArray:(NSArray *)gh_dataArray
{
    NSAssert([[gh_dataArray firstObject] isKindOfClass:[NSArray class]] && gh_dataArray.count > 0, @"dataArray必须是一个二维数组");
    
    objc_setAssociatedObject(self, @selector(gh_dataArray), gh_dataArray, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSArray *)gh_dataArray
{
    return objc_getAssociatedObject(self, @selector(gh_dataArray));
}

- (void)setGh_delegate:(id)gh_delegate
{
    if (!self.ghTableViewDelgate) {
        self.ghTableViewDelgate = ({
            GHTableViewDelegateImp *delegate = [[GHTableViewDelegateImp alloc] init];
            delegate.tableView = self;
            delegate.delegate = gh_delegate;
            self.delegate = delegate;
            
            delegate;
        });
    }
    
    if (!self.ghTableViewDataSource) {
        self.ghTableViewDataSource = ({
            GHTableViewDataSoureImp *dataSource = [[GHTableViewDataSoureImp alloc] init];
            dataSource.tableView = self;
            dataSource.delegate = gh_delegate;
            self.dataSource = dataSource;
            
            dataSource;
        });
    }
    
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    objc_setAssociatedObject(self, @selector(gh_delegate), gh_delegate, OBJC_ASSOCIATION_ASSIGN);
}

- (id)gh_delegate
{
    return objc_getAssociatedObject(self, @selector(gh_delegate));
}

- (void)setGhTableViewDelgate:(GHTableViewDelegateImp *)ghTableViewDelgate
{
    objc_setAssociatedObject(self, @selector(ghTableViewDelgate), ghTableViewDelgate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (GHTableViewDelegateImp *)ghTableViewDelgate
{
    return objc_getAssociatedObject(self, @selector(ghTableViewDelgate));
}

- (void)setGhTableViewDataSource:(GHTableViewDataSoureImp *)ghTableViewDataSource
{
    objc_setAssociatedObject(self, @selector(ghTableViewDataSource), ghTableViewDataSource, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (GHTableViewDataSoureImp *)ghTableViewDataSource
{
    return objc_getAssociatedObject(self, @selector(ghTableViewDataSource));
}

- (void)setGh_cellDidSelectBlock:(GHTableViewCellDidSelectBlock)gh_cellDidSelectBlock
{
    objc_setAssociatedObject(self, @selector(gh_cellDidSelectBlock), gh_cellDidSelectBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (GHTableViewCellDidSelectBlock)gh_cellDidSelectBlock
{
    return objc_getAssociatedObject(self, @selector(gh_cellDidSelectBlock));
}

- (void)setGh_cellDetailEventBlock:(GHTableViewCellDetailEventBlock)gh_cellDetailEventBlock
{
    objc_setAssociatedObject(self, @selector(gh_cellDetailEventBlock), gh_cellDetailEventBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(GHTableViewCellDetailEventBlock)gh_cellDetailEventBlock
{
    return objc_getAssociatedObject(self, @selector(gh_cellDetailEventBlock));
}

@end
