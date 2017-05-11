//
//  EG_RootViewController.m
//  DemosGround
//
//  Created by EG on 17/3/3.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EG_RootViewController.h"

@interface EG_RootViewController ()
/*subcontrollers*/
@property (copy, nonatomic)NSArray *subControllers;
@end

@implementation EG_RootViewController

    //所有子控制器
- (NSArray *)subControllers {
    if (!_subControllers) {
        _subControllers = @[
                            @"EG_TypeViewController",
                            @"EG_ShakingViewController",
                            @"LogoAnimationViewController",
                            @"EG_DispatchViewController",
                            @"EG_ShakeViewController",
                            @"EG_DBViewController",
                            @"EG_LocalViewController",
                            @"EG_ProgressCircleViewController",
                            @"EG_UploadBackupViewController",
                            @"EG_LocalArchieveViewController",
                            @"EG_GradualColorViewController",
                            @"EG_ArrayContainsViewController",
                            @"EG_GradualViewController",
                            @"EG_SignInViewController",
                            @"EG_AboutViewController",
                            @"EG_FoldedTableViewController",
                            @"EG_FoldCollectionViewController",
                            @"EG_DownloadTableViewController",
                            @"EG_PeiAnimationViewController",
                            @"EG_BlurEffectViewController",
                            @"EG_ijkPlayerViewController",
                            @"EG_PanControlViewController",
                            @"EG_DraggableLineViewController",
                            @"EG_SegmentFeedBack",
                            @"EG_MapLongPressViewController",
                            ];
    }
    return _subControllers;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];
}

#pragma mark - delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.navigationController pushViewController:
                                [NSClassFromString(self.subControllers[indexPath.row]) new]
                                         animated:YES];
}

#pragma mark - datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.subControllers.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"subviewControllersCellID"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"subviewControllersCellID"];
    }
    cell.textLabel.text = self.subControllers[indexPath.row];
    return cell;
}



@end
