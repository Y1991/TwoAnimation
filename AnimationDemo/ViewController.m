//
//  ViewController.m
//  AnimationDemo
//
//  Created by Guangquan Yu on 2018/9/15.
//  Copyright © 2018年 ZHM.YU. All rights reserved.
//

#import "ViewController.h"
#import "GQLizi8Button.h"
#import "FlyingAngelView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    FlyingAngelView * view = [[FlyingAngelView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
    view.tag = 1551;
//    view.center = self.view.center;
    [self.view addSubview:view];
    
    GQLizi8Button * button = [[GQLizi8Button alloc]initWithFrame:CGRectMake(0, 200, 200, 40)];
    [button setBackgroundColor:[UIColor greenColor]];
    [button setImage:[UIImage imageNamed:@"priase_dafault"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"priase_select"] forState:UIControlStateSelected];
    button.center = self.view.center;
    
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:64];
    [self.view addSubview:button];
    
}

#pragma mark -
- (void)buttonClick:(UIButton *)button{
    button.selected = !button.selected;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
