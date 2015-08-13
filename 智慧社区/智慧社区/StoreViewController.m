//
//  StoreViewController.m
//  智慧社区
//
//  Created by 汉泰mac pro on 15/7/24.
//  Copyright (c) 2015年 汉泰mac pro. All rights reserved.
//

#import "StoreViewController.h"
#import "HCUITool.h"
@interface StoreViewController ()

@end

@implementation StoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)createUI
{
    HCUITool *hcTool = [[HCUITool alloc] init];
    
    UIScrollView *scrowView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight)];
    
//    scrowView.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:scrowView];
    
    NSArray *imageArray = @[@"快递",@"超市",@"外卖",@"搬家",@"干洗",@"开锁",@"酒店",@"家政",@"药店",@"五金店",@"复印",@"跳蚤街"];
    
//    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight)];
//    
//    [self.view addSubview:v];
//    
    [hcTool loopCreateImageButtonNum:12 imageNames:imageArray imageAttributes:nil textAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:12],NSForegroundColorAttributeName:TabBarTitleColor} inView:scrowView Target:self action:@selector(tapIcon)];
    
    scrowView.contentSize = CGSizeMake(ScreenWidth,600);
    
    
}


- (void)tapIcon
{
    NSLog(@"有");
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
