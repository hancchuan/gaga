//
//  CommunicationViewController.m
//  智慧社区
//
//  Created by 汉泰mac pro on 15/7/24.
//  Copyright (c) 2015年 汉泰mac pro. All rights reserved.
//

#import "CommunicationViewController.h"
#import "FriendsView.h"
#import "ActiveView.h"
#import "ForumView.h"

@interface CommunicationViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
{
    UIView *loopLine;
    
    UIScrollView *scrowView;
}
@end

@implementation CommunicationViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
    
    // Do any additional setup after loading the view.
}

- (void)createUI
{
    NSArray *headTextArray = @[@"我的好友",@"社区活动",@"社区论坛"];
    
    for (int i = 0; i < 3; i++) {
    
        UIButton *headButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        headButton.frame = CGRectMake(ScreenWidth/3*i, 64, ScreenWidth/3, 40);
        
//        headButton.backgroundColor = [UIColor yellowColor];
        
        headButton.tag = 1000 + i;
        
        headButton.layer.borderWidth = 0.3;
        
        [headButton setTitle:headTextArray[i] forState:UIControlStateNormal];
        
        [headButton setTitleColor:TabBarTitleColor forState:UIControlStateNormal];
        
        headButton.titleLabel.font = [UIFont systemFontOfSize:12];
        
//        UIView *loopLine = [[UIView alloc] initWithFrame:CGRectMake(0, headButton.frame.size.height - 5, headButton.frame.size.width, 5)];
//        
//        
//        loopLine.backgroundColor = TabBarTitleColor;
//        
//        [headButton addSubview:loopLine];
//        
        [headButton addTarget:self action:@selector(headButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:headButton];

        
    }
    
    scrowView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64 + 40, ScreenWidth, ScreenHeight - 64 - 40 - 49)];
    
//    scrowView.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:scrowView];
    
    scrowView.delegate = self;
    
    scrowView.contentSize = CGSizeMake(3*ScreenWidth, 0);
    
    scrowView.pagingEnabled = YES;
    
    scrowView.showsVerticalScrollIndicator = NO;
    
    scrowView.showsHorizontalScrollIndicator = NO;
    
    scrowView.indicatorStyle = UIScrollViewIndicatorStyleBlack;
    
    loopLine = [[UIView alloc] initWithFrame:CGRectMake(0, 64 + 40 - 5, ScreenWidth/3, 5)];
    
    loopLine.backgroundColor = TabBarTitleColor;
    
    [self.view addSubview:loopLine];
    
//    FriendsViewController *friend = [[FriendsViewController alloc]init];
//    
//    [scrowView addSubview:friend.view];
    
    FriendsView *friendsView = [[FriendsView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, scrowView.frame.size.height)];
    
    [scrowView addSubview:friendsView];
    
    ActiveView *actView = [[ActiveView alloc] initWithFrame:CGRectMake(ScreenWidth, 0, ScreenWidth, scrowView.frame.size.height)];
    
    [scrowView addSubview:actView];
    
    ForumView *forum = [[ForumView alloc] initWithFrame:CGRectMake(2*ScreenWidth, 0, ScreenWidth, scrowView.frame.size.height)];
    
    [scrowView addSubview:forum];
}






- (void)headButtonClick:(UIButton *)button
{

    NSInteger a = button.tag - 1000;
    
    if (a == 0) {
        scrowView.contentOffset = CGPointMake(0, 0);
    }else if (a == 1){
    
        scrowView.contentOffset = CGPointMake(ScreenWidth, 0);
    }else if (a == 2){
    
        scrowView.contentOffset = CGPointMake(2*ScreenWidth, 0);
    }
    

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    loopLine.frame = CGRectMake(scrollView.contentOffset.x/3, loopLine.frame.origin.y, loopLine.frame.size.width, loopLine.frame.size.height);


}



- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if(scrollView.contentOffset.x == ScreenWidth||scrollView.contentOffset.x == 2 * ScreenWidth||scrollView.contentOffset.x == 0){
        
        
        
    }
    
    
    [scrollView addObserver:self forKeyPath:@"loopLineChange" options:NSKeyValueObservingOptionNew context:nil];

}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
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
