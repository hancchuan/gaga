//
//  FriendsView.m
//  智慧社区
//
//  Created by 汉泰mac pro on 15/8/5.
//  Copyright (c) 2015年 汉泰mac pro. All rights reserved.
//

#import "FriendsView.h"
#import "ChineseString.h"

@interface FriendsView ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,retain)NSMutableArray *indexArray;
@property(nonatomic,retain)NSMutableArray *LetterResultArr;
@end


@implementation FriendsView
@synthesize indexArray;
@synthesize LetterResultArr;


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (instancetype)initWithFrame:(CGRect)frame
{
  self =  [super initWithFrame:frame];
    
    self.userInteractionEnabled = YES;
    
    NSArray *stringsToSort=[NSArray arrayWithObjects:
                            @"￥hhh, .$",@" ￥Chin ese ",@"开源中国 ",@"www.oschina.net",
                            @"开源技术",@"社区",@"开发者",@"传播",
                            @"2014",@"a1",@"100",@"中国",@"暑假作业",
                            @"键盘", @"鼠标",@"hello",@"world",@"b1",
                            nil];
    
    self.indexArray = [ChineseString IndexArray:stringsToSort];
    self.LetterResultArr = [ChineseString LetterSortArray:stringsToSort];
    
    [self createUI];
    

    return self;
}

- (void)createUI
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, self.frame.size.height) style:UITableViewStylePlain];
    
    tableView.delegate = self;
    
    tableView.dataSource = self;
    
    [self addSubview:tableView];
    
    

}


#pragma mark -Section的Header的值
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *key = [indexArray objectAtIndex:section];
    return key;
}
#pragma mark - Section header view
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
    lab.backgroundColor = [UIColor grayColor];
    lab.text = [indexArray objectAtIndex:section];
    lab.textColor = [UIColor whiteColor];
    return lab;
}
#pragma mark - row height
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65.0;
}

#pragma mark -
#pragma mark Table View Data Source Methods
#pragma mark -设置右方表格的索引数组
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return indexArray;
}

#pragma mark -
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return index;
}

#pragma mark -允许数据源告知必须加载到Table View中的表的Section数。
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [indexArray count];
}
#pragma mark -设置表格的行数为数组的元素个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.LetterResultArr objectAtIndex:section] count];
}
#pragma mark -每一行的内容为数组相应索引的值
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.textLabel.text = [[self.LetterResultArr objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    return cell;
}
#pragma mark - Select内容为数组相应索引的值
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"---->%@",[[self.LetterResultArr objectAtIndex:indexPath.section]objectAtIndex:indexPath.row]);
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                    message:[[self.LetterResultArr objectAtIndex:indexPath.section]objectAtIndex:indexPath.row]
                                                   delegate:nil
                                          cancelButtonTitle:@"YES" otherButtonTitles:nil];
    [alert show];
}





@end
