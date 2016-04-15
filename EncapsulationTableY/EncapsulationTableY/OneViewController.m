//
//  OneViewController.m
//  EncapsulationTableY
//
//  Created by 张一力 on 16/3/17.
//  Copyright © 2016年 张一力. All rights reserved.
//

#import "OneViewController.h"
#import "TwoViewController.h"
#import "CurrentCustomPresentationController.h"

@interface OneViewController ()

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    // Do any additional setup after loading the view.
    
    
    UIButton * tipbutton= [[UIButton alloc]init];
    tipbutton.frame = CGRectMake(0, [[UIScreen mainScreen]bounds].size.height - 100, 200, 50);
    [tipbutton setTitle:@"自定义viewController" forState:UIControlStateNormal];
    [tipbutton addTarget:self action:@selector(showCustomviewController:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:tipbutton];
    
}

- (void)showCustomviewController:(UIButton *)button
{
    TwoViewController * twoViewController = [[TwoViewController alloc]init];
    
    
    CurrentCustomPresentationController * current NS_VALID_UNTIL_END_OF_SCOPE;
    
    current = [[CurrentCustomPresentationController alloc]initWithPresentedViewController:twoViewController presentingViewController:self];
    
    twoViewController.transitioningDelegate = current;
    
    
    [self presentViewController:twoViewController animated:YES completion:NULL];
    
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
