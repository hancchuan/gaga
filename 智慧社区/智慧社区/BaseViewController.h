//
//  BaseViewController.h
//  智慧社区
//
//  Created by 汉泰mac pro on 15/7/27.
//  Copyright (c) 2015年 汉泰mac pro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UINavigationController<UIGestureRecognizerDelegate>


- (void)panViewController:(UIPanGestureRecognizer *)pan;

@end
