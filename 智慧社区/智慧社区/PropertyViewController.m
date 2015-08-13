//
//  PropertyViewController.m
//  智慧社区
//
//  Created by 汉泰mac pro on 15/7/24.
//  Copyright (c) 2015年 汉泰mac pro. All rights reserved.
//

#import "PropertyViewController.h"
#import "ViewSetTool.h"
#import "HCUITool.h"



//#define PicScrowViewHeghit [UIScreen mainScreen].bounds.size.height > 480 ? 180:120

#define PicScrowViewHeghit 180

#define NumberPic 3


@interface PropertyViewController ()<UIScrollViewDelegate>
{
    UIScrollView *picScrowView;
    
    NSTimer *myTimer;
    
    NSInteger time;
    
    int scrowViewX;
    
    int oldScrowViewX;
    
    UIPageControl *page;
    
//小区公告等下面的scrowView
    UIScrollView *scrowView;
    
}
@end

@implementation PropertyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createScrowView];
    NSLog(@"高度%@",@(PicScrowViewHeghit));
    
    [self createUI];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)createScrowView
{
//    self.tabBarController.tabBar.backgroundColor = [UIColor blueColor];

    self.navigationItem.title = @"智慧物业";
    
    self.tabBarController.tabBar.barTintColor = TabBarBackgroundColor;
    
    self.tabBarItem.image = [[UIImage imageNamed:@"智慧物业"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
  
    self.tabBarItem.title = @"智慧物业";
    
    [self.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: TabBarTitleColor} forState:UIControlStateNormal];
    UIViewController *storeView = self.tabBarController.viewControllers[1];
    
    storeView.tabBarItem.image = [[UIImage imageNamed:@"周围商家"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    storeView.tabBarItem.title = @"周围商家";
    [storeView.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: TabBarTitleColor} forState:UIControlStateNormal];
    
    UIViewController *communicationView = self.tabBarController.viewControllers[2];
    communicationView.tabBarItem.image = [[UIImage imageNamed:@"社区交流"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    communicationView.tabBarItem.title = @"社区交流";
    [communicationView.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: TabBarTitleColor} forState:UIControlStateNormal];
    UIViewController *myViewController = self.tabBarController.viewControllers[NumberPic];
    myViewController.tabBarItem.image = [[UIImage imageNamed:@"个人中心"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    myViewController.tabBarItem.title = @"个人中心";
    [myViewController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: TabBarTitleColor} forState:UIControlStateNormal];
    
//    ViewSetTool *viewSet = [[ViewSetTool alloc] init];
//    
//    UITabBarController *tabBarController = (UITabBarController *)[self.storyboard instantiateViewControllerWithIdentifier:@"TabBarController"];
//    
//
//
//    [viewSet whoTabBar:tabBarController whereViewInTabBarControllers:0 tabBarItemImageName:@"智慧物业" title:@"智慧物业" color:[UIColor purpleColor]];
    
//    [viewSet whereViewInTabBarControllers:1 tabBarItemImageName:@"周围商家" title:@"周围商家" color:[UIColor purpleColor]];
    
    self.navigationBar.translucent = NO;
    
    picScrowView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, PicScrowViewHeghit)];
    
    picScrowView.contentSize = CGSizeMake(NumberPic*ScreenWidth, 0);
    
    picScrowView.pagingEnabled = YES;
    
    picScrowView.delegate = self;
    
    [self.view addSubview:picScrowView];
    
    UIImageView *firstImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, PicScrowViewHeghit)];
    
    firstImageView.image = [UIImage imageNamed:@"柳岩1"];
    
    [picScrowView addSubview:firstImageView];
    
    UIImageView *secondImageView = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth, 0, ScreenWidth, PicScrowViewHeghit)];
    
    secondImageView.image = [UIImage imageNamed:@"柳岩2"];
    
    [picScrowView addSubview:secondImageView];
    
    UIImageView *thirdImageView = [[UIImageView alloc] initWithFrame:CGRectMake(2*ScreenWidth, 0, ScreenWidth, PicScrowViewHeghit)];
    thirdImageView.image = [UIImage imageNamed:@"柳岩3"];
    [picScrowView addSubview:thirdImageView];
    
    page = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 64, 60, 10)];
    
    page.center = CGPointMake(picScrowView.center.x, picScrowView.frame.origin.y + picScrowView.frame.size.height - 10);
    
    page.numberOfPages = NumberPic;
    
    [self.view addSubview:page];

    time = 1;
    
    scrowViewX = 0;
    
    oldScrowViewX = 0;
    
    myTimer = [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(picActive) userInfo:nil repeats:YES];

}

- (void)createUI
{
    scrowView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, PicScrowViewHeghit + 64, ScreenWidth, ScreenHeight - 64 - 180 - 49)];
    
    
//    scrowView.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:scrowView];
    
    NSArray *imageArray = @[@"小区公告",@"费用缴纳",@"故障维修",@"房屋租售",@"呼叫物业",@"购票系统"];
    
//    for (int i = 0; i<6; i++) {
//        
//        UIImageView *imageView = [[UIImageView alloc] init];
//        
//        if ([UIScreen mainScreen].bounds.size.height>480) {
//            NSLog(@"iphone5+");
//            imageView.frame = CGRectMake(i%3*ScreenWidth/3 + 25, PicScrowViewHeghit + 64 + i/3*(ScreenWidth/3) + 30, ScreenWidth/3 - 50, ScreenWidth/3 - 55);
//        }else{
//             imageView.frame = CGRectMake(i%3*ScreenWidth/3 + 25, PicScrowViewHeghit + 64 + i/3*((ScreenHeight-PicScrowViewHeghit-64-49)/2) + 10, ScreenWidth/3 - 50, ScreenWidth/3 - 55);
//        }
//        
//        imageView.tag = 1000 + i;
//        
//        imageView.userInteractionEnabled = YES;
//        
//        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapIcon:)];
//        
//        [imageView addGestureRecognizer:tap];
//
//        imageView.backgroundColor = TabBarTitleColor;
//        
//        imageView.layer.cornerRadius = 10;
//        
//        imageView.layer.masksToBounds = YES;
//        
//        imageView.image = [UIImage imageNamed:imageArray[i]];
//        
//        [self.view addSubview:imageView];
//        
//        UIButton *textButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        
//        [textButton setTitle:imageArray[i] forState:UIControlStateNormal];
//        
//        [textButton setTitleColor:TabBarTitleColor forState:UIControlStateNormal];
//        
//        textButton.titleLabel.font = [UIFont boldSystemFontOfSize:12];
//        
//        textButton.frame = CGRectMake(imageView.frame.origin.x, imageView.frame.origin.y + imageView.frame.size.height + 10, imageView.frame.size.width, 20);
//        
//        [self.view addSubview:textButton];
//    }
    
    HCUITool *hcTool = [[HCUITool alloc] init];
    
    [hcTool loopCreateImageButtonNum:6 imageNames:imageArray     imageAttributes:@{NSForegroundColorAttributeName:TabBarTitleColor}
                      textAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:12],NSForegroundColorAttributeName:TabBarTitleColor}
                              inView:scrowView Target:self action:@selector(tapIcon:)];
    
    scrowView.contentSize = CGSizeMake(ScreenWidth, 250);
    
}



- (void)tapIcon:(UITapGestureRecognizer *)tapIcon
{
    NSInteger iconTag = tapIcon.view.tag - 1000;

    if (iconTag == 0) {
        NSLog(@"小区公告");
    }
    else if (iconTag == 1){
        NSLog(@"费用缴纳");
    
    }
    else if (iconTag == 2){
        NSLog(@"故障维修");
    
    }
    else if (iconTag == 3){
        NSLog(@"房屋租售");
    
    }
    else if (iconTag == 4){
        NSLog(@"呼叫物业");
    
    }
    else if (iconTag == 5){
        NSLog(@"购票系统");
    }
    
}




- (void)picActive
{
    int offset = oldScrowViewX - scrowViewX;
    
    int a = offset/ScreenWidth;
    
    if (abs(offset)>=ScreenWidth) {
           time = time - a;
    }
    
    picScrowView.contentOffset = CGPointMake(abs((int)time)%NumberPic*ScreenWidth, 0);
    
    page.currentPage = picScrowView.contentOffset.x/ScreenWidth;
    
    [page addTarget:self action:@selector(pageControlClick) forControlEvents:UIControlEventTouchUpInside];
    
    scrowViewX = 0;
    
    oldScrowViewX = 0;
    
    time++;
}

- (void)pageControlClick
{
    NSInteger where = page.currentPage;
    
    picScrowView.contentOffset = CGPointMake(where*ScreenWidth, 0);
    
    [myTimer invalidate];
    
    time = page.currentPage;
    
    myTimer = [NSTimer scheduledTimerWithTimeInterval:4.0f target:self selector:@selector(picActive) userInfo:nil repeats:YES];

}


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    oldScrowViewX = picScrowView.contentOffset.x;
    
    [myTimer invalidate];

}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
   scrowViewX = picScrowView.contentOffset.x;
    
    page.currentPage = scrowViewX/ScreenWidth;
}


-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    time = page.currentPage;
    
    myTimer=[NSTimer scheduledTimerWithTimeInterval:4.0f target:self selector:@selector(picActive) userInfo:nil repeats:YES];
}


- (void)panViewController:(UIPanGestureRecognizer *)pan
{
    [super panViewController:pan];
//
//    CGPoint translation = [pan translationInView:self.view];
//    
//    NSInteger x = translation.x;
//    
//     NSLog(@"滑动屏幕%@",@(x));
//    
//    if (x>-ScreenWidth/3&&x<0) {
//        self.tabBarController.selectedIndex = 1;
//    }

}

//-(void)viewWillDisappear:(BOOL)animated
//{
//    CATransition *transition = [CATransition animation];
//    [transition setDuration:0.4];
//    [transition setType:kCATransitionMoveIn];
////    @"cube"
//    [transition setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
//    [transition setSubtype:kCATransitionFromRight];
//    [self.tabBarController.view.layer addAnimation:transition forKey:nil];
//}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
