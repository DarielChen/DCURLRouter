//
//  TwoViewController.m
//  DCURLRouterDemo
//
//  Created by Dariel on 16/8/17.
//  Copyright © 2016年 DarielChen. All rights reserved.
//

#import "TwoViewController.h"
#import "DCURLRouter.h"
#import "UIViewController+DCURLRouter.h"
#import "ThreeViewController.h"

@interface TwoViewController()

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"TwoViewController";
    
    UILabel *title = [[UILabel alloc] init];
    title.text = NSStringFromClass([self class]);
    title.font = [UIFont systemFontOfSize:20];
    title.textColor = [UIColor lightGrayColor];
    title.numberOfLines = 0;
    [title sizeToFit];
    [self.view addSubview:title];
    title.center = self.view.center;
    
    NSLog(@"接收的参数%@", self.params);
    NSLog(@"age:%@", self.params[@"age"]);

    NSLog(@"拿到URL:%@", self.originUrl);
    NSLog(@"URL路径:%@", self.path);
    
//    NSLog(@"%@", self.name);
    
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

//    [DCURLRouter presentURLString:@"dariel://threeitem" animated:YES completion:nil];
    
    self.valueBlock(@"any Type");
    
}



@end
