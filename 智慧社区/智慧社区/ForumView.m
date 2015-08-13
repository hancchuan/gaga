//
//  ForumView.m
//  智慧社区
//
//  Created by 汉泰mac pro on 15/8/5.
//  Copyright (c) 2015年 汉泰mac pro. All rights reserved.
//

#import "ForumView.h"

@interface ForumView ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ForumView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, self.frame.size.height) style:UITableViewStylePlain];
    
    tableView.delegate = self;
    
    tableView.dataSource = self;
    
    [self addSubview:tableView];
    
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"ForumTableViewCell" owner:self options:nil][0];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 170;
    
}


@end
