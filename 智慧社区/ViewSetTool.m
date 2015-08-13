//
//  ViewSetTool.m
//  智慧社区
//
//  Created by 汉泰mac pro on 15/7/27.
//  Copyright (c) 2015年 汉泰mac pro. All rights reserved.
//

#import "ViewSetTool.h"

@implementation ViewSetTool

- (void)whoTabBar:(UITabBarController *)tabBarController whereViewInTabBarControllers:(int)number tabBarItemImageName:(NSString *)imageName title:(NSString *)name color:(UIColor *)color
{
//    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
//    UITabBarController *tabBarController = (UITabBarController *)[storyBoard instantiateViewControllerWithIdentifier:@"TabBarController"];
    
    UIViewController *viewController = tabBarController.viewControllers[number];
//    
//   UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:name]];
//    
//    image.frame = CGRectMake(0, 0, 80, 60);
//    
//    [viewController.view addSubview:image];
    
    viewController.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.title = name;
    [viewController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: color} forState:UIControlStateNormal];

}



@end
