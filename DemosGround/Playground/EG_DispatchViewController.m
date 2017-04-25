//
//  EG_DispatchViewController.m
//  DemosGround
//
//  Created by EG on 17/3/6.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EG_DispatchViewController.h"

@interface EG_DispatchViewController ()

@end

@implementation EG_DispatchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (void)test1 {
    dispatch_queue_t queue = dispatch_queue_create("queue", NULL);
    
    dispatch_sync(queue, ^{
        NSLog(@"1");
        
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"2");
        
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"3");
        
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"4");
        
        
    });
    

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    dispatch_queue_t queue = dispatch_queue_create("queue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        NSLog(@"1");
        
    });
    
    dispatch_async(queue, ^{
        NSLog(@"2");
        
    });
    
    dispatch_async(queue, ^{
        NSLog(@"3");
        
    });
    
    dispatch_async(queue, ^{
        NSLog(@"4");
        
        
    });
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
