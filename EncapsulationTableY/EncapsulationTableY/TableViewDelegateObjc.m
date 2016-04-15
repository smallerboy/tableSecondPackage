//
//  TableViewDelegateObjc.m
//  EncapsulationTableY
//
//  Created by 张一力 on 16/3/17.
//  Copyright © 2016年 张一力. All rights reserved.
//

#import "TableViewDelegateObjc.h"

@interface TableViewDelegateObjc()

@property(nonatomic,strong)NSArray *dataList;
@property(nonatomic,copy) selectCell selectBlock;
@end


@implementation TableViewDelegateObjc

+ (instancetype)creatTableViewDelegateWithDataList:(NSArray *)dataList selectBlock:(selectCell)selectBlock
{
    return [[[self class] alloc]initTableViewDelegateDataList:dataList selectBlock:selectBlock];
}

- (instancetype)initTableViewDelegateDataList:(NSArray *)dataList selectBlock:(selectCell)selectBlock
{
    self = [super init];
    if (self) {
        self.dataList = dataList;
        self.selectBlock = selectBlock;
    }
    return self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = _dataList[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataList.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    _selectBlock(indexPath);
}


@end
