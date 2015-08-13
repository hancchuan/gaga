//
//  BaseViewController.m
//  智慧社区
//
//  Created by 汉泰mac pro on 15/7/27.
//  Copyright (c) 2015年 汉泰mac pro. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createNav];
    
    [self createPanGes];
    // Do any additional setup after loading the view.
}

- (void)createNav
{
    self.navigationBar.barTintColor = TabBarTitleColor;

    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    
//    self.navigationController.navigationItem.leftBarButtonItem = [UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"智慧社区"] style:UIBarButtonItemStylePlain target:self action:@select();
}

- (void)createPanGes
{
    UIPanGestureRecognizer *panGes = [[UIPanGestureRecognizer alloc] init];
    
    [panGes addTarget:self action:@selector(panViewController:)];

    [self.view addGestureRecognizer:panGes];
    
    panGes.delegate = self;

}


- (void)panViewController:(UIPanGestureRecognizer *)pan
{
    
  
    
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
