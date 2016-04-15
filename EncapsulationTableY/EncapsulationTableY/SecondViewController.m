//
//  SecondViewController.m
//  EncapsulationTableY
//
//  Created by 张一力 on 16/3/17.
//  Copyright © 2016年 张一力. All rights reserved.
//

#import "SecondViewController.h"
#import "ThreeViewController.h"

#import "CrossDissolveTransitionAnimatorY.h"

@interface SecondViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blueColor];
    // Do any additional setup after loading the view.
    
    UIButton * bottomButtn = [[UIButton alloc]init];
    bottomButtn.frame = CGRectMake(100, [[UIScreen mainScreen]bounds].size.height - 100, 200, 50);
    [bottomButtn setTitle:@"进行跳转" forState:UIControlStateNormal];
    [bottomButtn addTarget:self action:@selector(turnNext:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bottomButtn];

}
- (void)turnNext:(UIButton *)button
{
    ThreeViewController * threeController = [[ThreeViewController alloc]init];
    threeController.modalPresentationStyle = UIModalPresentationFullScreen;
    threeController.transitioningDelegate = self;
    [self presentViewController:threeController animated:YES completion:nil];
}

#pragma mark UIViewControllerTransitioningDelegate
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [CrossDissolveTransitionAnimatorY new];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [CrossDissolveTransitionAnimatorY new];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
