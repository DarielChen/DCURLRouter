//
//  OneViewController.m
//  DCURLRouterDemo
//
//  Created by Dariel on 16/8/17.
//  Copyright © 2016年 DarielChen. All rights reserved.
//

#import "OneViewController.h"
#import "DCURLRouter.h"
#import "TwoViewController.h"
#import "OneChildView.h"

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"OneViewController";
    
    UILabel *title = [[UILabel alloc] init];
    title.text = NSStringFromClass([self class]);
    title.font = [UIFont systemFontOfSize:20];
    title.textColor = [UIColor lightGrayColor];
    title.numberOfLines = 0;
    [title sizeToFit];
    [self.view addSubview:title];
    title.center = self.view.center;
    
    OneChildView *oneView = [[OneChildView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    [self.view addSubview:oneView];

}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    

    [DCURLRouter presentURLString:@"dariel://twoitem" animated:YES completion:nil];

//    [DCURLRouter dismissViewControllerWithTimes:1 animated:YES completion:nil];

    
}



@end
