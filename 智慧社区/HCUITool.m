//
//  HCUITool.m
//  智慧社区
//
//  Created by 汉泰mac pro on 15/7/30.
//  Copyright (c) 2015年 汉泰mac pro. All rights reserved.
//

#import "HCUITool.h"

@implementation HCUITool

- (void)loopCreateImageButtonNum:(NSInteger)number imageNames:(NSArray *)imageArray imageAttributes:(NSDictionary *)imageDic textAttributes:(NSDictionary *)textDic inView:(UIView *)addView Target:(id)target action:(SEL)action
{
    for (int i = 0; i<number; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        
        if (ScreenHeight>480) {
            NSLog(@"iphone5+");
            imageView.frame = CGRectMake(i%3*ScreenWidth/3 + 25, i/3*(ScreenWidth/3) + 30, ScreenWidth/3 - 50, ScreenWidth/3 - 50);
        }else{
            imageView.frame = CGRectMake(i%3*ScreenWidth/3 + 25, i/3*(ScreenWidth/3) + 30, ScreenWidth/3 - 50, ScreenWidth/3 - 50);
        }

        imageView.tag = 1000 + i;
        
        imageView.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
        
        [imageView addGestureRecognizer:tap];
        
        imageView.backgroundColor = [imageDic objectForKey:NSForegroundColorAttributeName];
        
        imageView.layer.cornerRadius = 10;
        
        imageView.layer.masksToBounds = YES;
        
        imageView.image = [UIImage imageNamed:imageArray[i]];
        
        [addView addSubview:imageView];
        
        UIButton *textButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [textButton setTitle:imageArray[i] forState:UIControlStateNormal];
        
        [textButton setTitleColor:[textDic objectForKey:NSForegroundColorAttributeName] forState:UIControlStateNormal];
        
        textButton.titleLabel.font = [textDic objectForKey:NSFontAttributeName];
        
        textButton.frame = CGRectMake(imageView.frame.origin.x, imageView.frame.origin.y + imageView.frame.size.height + 10, imageView.frame.size.width, 20);
        
        [addView addSubview:textButton];
    }



}


@end
