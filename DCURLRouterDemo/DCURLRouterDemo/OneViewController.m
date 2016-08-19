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
    
    
    // 不需要拼接参数直接跳转
    [DCURLRouter pushURLString:@"dariel://threeitem" animated:YES];
    
//    // 直接把参数拼接在自定义url末尾
//    NSString *urlStr = @"dariel://twoitem?name=dariel&userid=213213";
//    [DCURLRouter pushURLString:urlStr animated:YES];
//    // 可以将参数放入一个字典
//    NSDictionary *dict = @{@"userName":@"Hello", @"userid":@"32342"};
//    [DCURLRouter pushURLString:@"dariel://twoitem" query:dict animated:YES];
//
//    // 如果当前控制器和要push的控制器是同一个,可以将replace设置为Yes,进行替换.
//    [DCURLRouter pushURLString:@"dariel://oneitem" query:dict animated:YES replace:YES];
//    
//    // 重写了系统的push方法
//    TwoViewController *two = [[TwoViewController alloc] init];
//    [DCURLRouter pushViewController:two animated:YES];
    

    

    
    
}



@end
