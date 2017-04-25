//
//  EG_FoldedTableViewController.m
//  DemosGround
//
//  Created by EG on 17/3/24.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EG_FoldedTableViewController.h"

@interface EG_FoldedTableViewController () {
    NSMutableDictionary *isOpenDic;
    NSMutableDictionary *dic;
}

/*dataArray*/
@property (strong, nonatomic)NSMutableArray *dataArray;

@end

@implementation EG_FoldedTableViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    NSArray *arr0 = [NSArray arrayWithObjects:@"come1",@"come1",@"come1",@"come1",@"come1",@"come1", nil];
    
    NSArray *arr1 = [NSArray arrayWithObjects:@"come2",@"come2",@"come2",@"come2",@"come2",@"come2", nil];
   
    NSArray *arr2  = [NSArray arrayWithObjects:@"come3",@"come3",@"come3",@"come3",@"come3",@"come3", nil];
    NSArray *arr3  = [NSArray arrayWithObjects:@"come4",@"come4",@"come4",@"come4",@"come4",@"come4", nil];
    
    dic = [[NSMutableDictionary alloc] initWithObjectsAndKeys:arr0,@"section0",arr1,@"section1",arr2,@"section2", arr3,@"section3",nil];
    
    isOpenDic = [[NSMutableDictionary alloc] init];
    for (int i= 0; i <[[dic allKeys] count] ; i++)
      {
        [isOpenDic setValue:[NSNumber numberWithBool:NO] forKey:[NSString stringWithFormat:@"section%d",i]];
        
      }
}

-(void)sectionHeaderClicked:(UIButton *)btn {
    BOOL isOpen = [[isOpenDic objectForKey:[NSString stringWithFormat:@"section%ld",(long)btn.tag]] boolValue];
    [isOpenDic setValue:[NSNumber numberWithBool:!isOpen] forKey:[NSString stringWithFormat:@"section%ld",(long)btn.tag]];
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:btn.tag] withRowAnimation:UITableViewRowAnimationFade];
}

#pragma - delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    view.backgroundColor = [UIColor grayColor];
    view.alpha = 0.5;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 100, 40) ;
    [btn setTitle:[NSString stringWithFormat:@"Section %ld",(long)section] forState:UIControlStateNormal];
    btn.tag = section;
    [btn addTarget:self action:@selector(sectionHeaderClicked:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn];
    
    return view ;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

#pragma -datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *arr = [dic objectForKey:[NSString stringWithFormat:@"section%ld",(long)section]];
    BOOL isOpen = [[isOpenDic objectForKey:[NSString stringWithFormat:@"section%ld",(long)section]] boolValue];
    return isOpen ? [arr count]:0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
      {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier];
      }
    NSArray *arr = [dic objectForKey:[NSString stringWithFormat:@"section%ld",(long)[indexPath section]]];
    cell.textLabel.text = [arr objectAtIndex:[indexPath row]];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[dic allKeys] count];
}


@end
