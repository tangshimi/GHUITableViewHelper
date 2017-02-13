//
//  GHUITableViewHelper.h
//
//
//  Created by tangshimi on 23/10/2016.
//  Copyright © 2016 tangshimi. All rights reserved.
//

#import <Foundation/Foundation.h>

#if __has_include(<GHUITableViewHelper/GHUITableViewHelper.h>)

    FOUNDATION_EXPORT double GHUITableViewHelperVersionNumber;
    FOUNDATION_EXPORT const unsigned char GHUITableViewHelperVersionString[];

    #import <GHUITableViewHelper/UITableView+GHHelper.h>
    #import <GHUITableViewHelper/GHTableViewDelegate.h>
    #import <GHUITableViewHelper/GHTableViewCellDelegate.h>
    #import <GHUITableViewHelper/GHBaseTableViewCell.h>

#else

    #import "UITableView+GHHelper.h"
    #import "GHTableViewDelegate.h"
    #import "GHTableViewCellDelegate.h"
    #import "GHBaseTableViewCell.h"

#endif
