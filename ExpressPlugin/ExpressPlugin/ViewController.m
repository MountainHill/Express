//
//  ViewController.m
//  ExpressPlugin
//
//  Created by dingyl on 16/6/30.
//  Copyright © 2016年 丁业林. All rights reserved.
//

#import "ViewController.h"
#import "RRBExpress.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [RRBExpress queryByExpressCompanyCode:ExpressYto expressNumber:@"807138721139" result:^(NSError *resultError, RRBExpressOrder *expressOrder) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
