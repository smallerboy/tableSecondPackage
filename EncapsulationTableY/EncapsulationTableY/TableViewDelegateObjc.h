//
//  TableViewDelegateObjc.h
//  EncapsulationTableY
//
//  Created by 张一力 on 16/3/17.
//  Copyright © 2016年 张一力. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef void(^selectCell)(NSIndexPath *indexPath);

@interface TableViewDelegateObjc : NSObject<UITableViewDelegate,UITableViewDataSource>

+ (instancetype)creatTableViewDelegateWithDataList:(NSArray *)dataList selectBlock:(selectCell)selectBlock;


@end
