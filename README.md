# GHUITableViewHelper
##简介
封装UITableView常用的几个UITableViewDelegate与UITableViewDataSource方法，使用更方便。

##使用方法
1.基本使用

	UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    [view addSubview:tableView];
 
    tableView.ghDelegate = self;
    tableView.registerCells = @{ @"Model" : [tableViewCell class] };
 
    Model *modle1 = [[myModel alloc] init];
    Model *modle2 = [[myModel alloc] init];
    tableView.dataArray = @[@[modle1, modle2 ], @[modle1, modle2]];
 
    [tableView reloadData];
    注：Model是数据模型的类名，tableViewCell必须是遵守GHTableViewCellDelegate协议的UITableViewCell的子类；tableView.dataArray 是一个二维数组

 2.UITableViewCell点击的回调提供代理和block两种方式
 
    2.1 block:
    tableView.cellDidSelectBlock = ^(id model, NSIndexPath *indexPath) {
 
    };
    2.2 delegate:
    - (void)tableView:(UITableView *)tableView model:(id)model didSelectRowAtIndexPath:(NSIndexPath *)indexPath
    {
 
    }

 3.UITableViewCelll内部的事件的回调提供代理和block两种方式
 
    3.1 delgegate
    - (void)tableView:(UITableView *)tableView model:(id)model cellEventType:(NSUInteger)type cellIndexPath:(NSIndexPath *)indexPath
    {
 
    }
    3.2 block
    tableView.cellDetailEventBlock = ^(id model, NSUInteger type, NSIndexPath *indexPath){
 
    };
    注：UITableViewCell中对应的事件要使用cell的delegate调用GHTableViewCellEventDelegate协议中
        - (void)model:(id)model cellEventType:(NSUInteger)type cellIndexPath:(NSIndexPath *)indexPath;
        方法，如下传出cell的一个button点击事件
    - (void)buttonAction:(UIButton *)button
    {
        if ([self.delegate respondsToSelector:@selector(model:cellEventType:cellIndexPath:)]) {
            [self.delegate model:model cellEventType:1 cellIndexPath:self.currentIndexPath];
        }
    }
 4.能在使用UITableView类中正常使用除GHTableViewDataSoureImp和GHTableViewDelegateImp中其他的UItableViewDelegate和UITableViewDataSource的其他方法
    例：
    
    - (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
    {
        return 40;
    }

##CocoaPods

pod 'GHUITableViewHelper'