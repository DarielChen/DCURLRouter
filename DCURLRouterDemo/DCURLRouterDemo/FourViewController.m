//
//  FourViewController.m
//  DCURLRouterDemo
//
//  Created by Dariel on 16/8/17.
//  Copyright © 2016年 DarielChen. All rights reserved.
//

#import "FourViewController.h"
#import "DCURLRouter.h"

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"FourViewController";
    
    
    UILabel *title = [[UILabel alloc] init];
    title.text = NSStringFromClass([self class]);
    title.font = [UIFont systemFontOfSize:20];
    title.textColor = [UIColor lightGrayColor];
    title.numberOfLines = 0;
    [title sizeToFit];
    [self.view addSubview:title];
    title.center = self.view.center;
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [DCURLRouter pushURLString:@"dariel://fiveitem" animated:YES replace:NO];

//    [DCURLRouter presentURLString:@"dariel://fiveitem" animated:YES];
//    [DCURLRouter presentURLString:@"dariel://fiveitem" animated:YES completion:nil];

}

- (void)dealloc {
    
    NSLog(@"%s", __func__);
}

@end
