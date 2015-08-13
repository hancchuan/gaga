//
//  MyRootViewController.m
//  智慧社区
//
//  Created by 汉泰mac pro on 15/7/31.
//  Copyright (c) 2015年 汉泰mac pro. All rights reserved.
//

#import "MyRootViewController.h"

@interface MyRootViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    CGRect backImageViewOldFrame;
    CGRect tableViewOldFrame;
}
@end

@implementation MyRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
    // Do any additional setup after loading the view.
}

- (void)createUI
{
    self.headImageView.layer.cornerRadius = self.headImageView.frame.size.width/2;
    
    self.headImageView.layer.masksToBounds = YES;
    
    backImageViewOldFrame = self.backImageView.frame;
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.backImageView.frame.size.height + self.navigationController.navigationBar.frame.size.height, ScreenWidth, ScreenHeight - self.navigationController.navigationBar.frame.size.height - self.backImageView.frame.size.height) style:UITableViewStylePlain];
    
    tableViewOldFrame = tableView.frame;
    
    tableView.delegate = self;
    
    tableView.dataSource = self;
    
    UIView *footView = [[UIView alloc]init];
    
    tableView.tableFooterView = footView;
    
//    [self.backImageView becomeFirstResponder];
    
//    [self.view bringSubviewToFront:self.backImageView];
    
//    [self.view exchangeSubviewAtIndex:3 withSubviewAtIndex:0];
    
    
    
    
//    UIView *footView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - self.navigationController.navigationBar.frame.size.height - self.backImageView.frame.size.height)];
//    
//    
//    tableView.tableFooterView=footView;
//    
//    UIButton *outButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    
//    outButton.frame = CGRectMake(0, tableView.tableFooterView.frame.size.height -40, ScreenWidth, 40);
//    
//    outButton.backgroundColor = [UIColor yellowColor];
//    
//    [tableView.tableFooterView addSubview:outButton];

    [self.view addSubview:tableView];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];

    }
    
    cell.textLabel.font = [UIFont boldSystemFontOfSize:15];
    
    if (indexPath.section == 0&indexPath.row == 0) {
        cell.textLabel.text = @"我的帐户";
        cell.imageView.image = [UIImage imageNamed:@"我的帐户"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

        
    }else if (indexPath.section == 0&indexPath.row == 1){
    cell.textLabel.text = @"我的二维码";
        cell.imageView.image = [UIImage imageNamed:@"我的二维码"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
  

    }else if (indexPath.section == 1&indexPath.row == 0){
        cell.textLabel.text = @"我要发布";
        cell.imageView.image = [UIImage imageNamed:@"我要发布"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;


    }else if (indexPath.section == 1&indexPath.row == 1){
        cell.textLabel.text = @"我的店铺";
        cell.imageView.image = [UIImage imageNamed:@"我的店铺"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    

    }
    
    return cell;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;

}




- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;

}

//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    if (section == 1) {
//       return 80;
//    }
//    return 0;
//}





- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y < 0) {
        CGFloat a = scrollView.contentOffset.y;
        
//        self.backImageView.frame = CGRectMake(0, 64, ScreenWidth, backImageViewOldFrame.size.height - a);
        

    }else{
//        NSLog(@"出来了");
    
    }

}


- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
//    NSLog(@"a = %@",@(scrollView.contentOffset.y));

}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.backImageView.frame = CGRectMake(0, 64, ScreenWidth, backImageViewOldFrame.size.height);
    

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
