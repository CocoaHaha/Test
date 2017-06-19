//
//  ViewController.m
//  StatusBar
//
//  Created by 石向锋 on 2017/6/16.
//  Copyright © 2017年 CocoHaHa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *vierw = [[UIView alloc]init];
    vierw.frame = CGRectMake(0, 0, self.view.frame.size.width, 64);
    vierw.backgroundColor = [UIColor redColor];
    [self.view addSubview:vierw];
   
    
}

//- (BOOL)prefersStatusBarHidden{
//    return YES;
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
