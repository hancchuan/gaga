//
//  HCUITool.h
//  智慧社区
//
//  Created by 汉泰mac pro on 15/7/30.
//  Copyright (c) 2015年 汉泰mac pro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface HCUITool : NSObject


- (void)loopCreateImageButtonNum:(NSInteger)number imageNames:(NSArray *)imageArray imageAttributes:(NSDictionary *)imageDic textAttributes:(NSDictionary *)textDic inView:(UIView *)addView Target:(id)target action:(SEL)action;


@end
