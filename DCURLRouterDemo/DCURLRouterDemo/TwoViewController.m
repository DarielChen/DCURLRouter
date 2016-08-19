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
    NSLog(@"拿到URL:%@", self.originUrl);
    NSLog(@"URL路径:%@", self.path);
    
    
    NSLog(@"%@", self.name);
    

    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

//    // 不需要拼接参数直接跳转
//    [DCURLRouter presentURLString:@"dariel://threeitem" animated:YES completion:nil];
//    
//    // 直接把参数拼接在自定义url末尾
//    NSString *urlStr = @"dariel://threeitem?name=dariel&userid=213213";
//    [DCURLRouter presentURLString:urlStr animated:YES completion:nil];
//    // 可以将参数放入一个字典
//    NSDictionary *dict = @{@"userName":@"Hello", @"userid":@"32342"};
//    [DCURLRouter presentURLString:@"dariel://threeitem" query:dict animated:YES completion:nil];
//    // 给modal出来的控制器添加一个导航控制器
//    [DCURLRouter presentURLString:@"dariel://threeitem" animated:YES withNavigationClass:[UINavigationController class] completion:nil];
//    // 重写了系统的push方法
//    ThreeViewController *three = [[ThreeViewController alloc] init];
//    [DCURLRouter presentViewController:three animated:YES completion:nil];
    
}



@end
