//
//  ViewController.m
//  EncapsulationTableY
//
//  Created by 张一力 on 16/3/17.
//  Copyright © 2016年 张一力. All rights reserved.
//

#import "ViewController.h"
#import "TableViewDelegateObjc.h"
#import "SecondViewController.h"
#import "OneViewController.h"

@interface ViewController ()

@property(nonatomic,strong)UITableView * testTable;
@property(nonatomic,strong)TableViewDelegateObjc * tableDelegate;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self creatTable];
}

- (void)creatTable
{
    self.testTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height) style:UITableViewStylePlain];
    [self.view addSubview:_testTable];
    
    [self addDetails];
}

- (void)addDetails
{
    NSArray * array = @[@"效果一",@"效果二",@"效果三",@"效果四",@"效果五",@"效果六"];
    
    __weak typeof(self)weakSelf = self;
    self.tableDelegate = [TableViewDelegateObjc creatTableViewDelegateWithDataList:array selectBlock:^(NSIndexPath *indexPath) {
        NSLog(@"点击了%ld行",(long)indexPath.row);
        [weakSelf selectCurrentCell:indexPath];
    }];
    _testTable.delegate   = _tableDelegate;
    _testTable.dataSource = _tableDelegate;
    
}
- (void)selectCurrentCell:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:{
            SecondViewController * second = [[SecondViewController alloc]init];
            [self.navigationController pushViewController:second animated:YES];
        }break;
        case 1:{
            OneViewController * oneViewController = [[OneViewController alloc]init];
            [self.navigationController pushViewController:oneViewController animated:YES];
        }break;
        default:
            break;
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
