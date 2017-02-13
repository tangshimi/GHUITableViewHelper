//
//  ViewController.m
//  GHUITabelViewHelper
//
//  Created by tangshimi on 10/02/2017.
//  Copyright © 2017 guahao. All rights reserved.
//

#import "ViewController.h"
#import "GHUITableViewHelper.h"
#import "CellModel.h"
#import "GHTableViewCell.h"

@interface ViewController () <GHTableViewDelegate, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.tableView];
    self.tableView.frame = [UIScreen mainScreen].bounds;
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    self.tableView.gh_delegate = self;
    self.tableView.gh_registerCells = @{ @"CellModel" : [GHTableViewCell class] };
    
    self.dataArray = [[NSMutableArray alloc] init];
    

    for (NSInteger i = 0; i < 10; i ++) {
        CellModel *model = [[CellModel alloc] init];
        model.title = [NSString stringWithFormat:@"%@", @(i)];
        [self.dataArray addObject:model];
    }
    
    self.tableView.gh_dataArray = @[ self.dataArray ];
    
    self.tableView.gh_cellDidSelectBlock = ^(CellModel *model, NSIndexPath *indexPath) {
        NSLog(@"%@ row did selected by block", @(indexPath.row));
    };
    
    self.tableView.gh_cellDetailEventBlock = ^(id model, NSUInteger type, NSIndexPath *indexPath) {
        NSLog(@"%@ type, %@ row button did selected by block", @(type) ,@(indexPath.row));
    };
}

#pragma mark -
#pragma mark - UITableViewDelgate -

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 40)];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 40)];
    label.text = @"this is header view";
    label.textColor = [UIColor blackColor];
    
    [view addSubview:label];
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

#pragma mark -
#pragma mark - GHTableViewDelegate -

- (void)tableView:(UITableView *)tableView model:(id)model didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@ row did selected by delegate", @(indexPath.row));
}

- (void)tableView:(UITableView *)tableView model:(id)model cellEventType:(NSUInteger)type cellIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@ type, %@ row button did selected by delegate", @(type) ,@(indexPath.row));
}

#pragma mark -
#pragma mark - setter and getter -

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = ({
            UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
            tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
            tableView;
        });
    }
    return _tableView;
}

@end
