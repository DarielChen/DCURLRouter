//
//  WebViewController.m
//  DCURLRouterDemo
//
//  Created by Dariel on 16/8/18.
//  Copyright © 2016年 DarielChen. All rights reserved.
//

#import "WebViewController.h"
#import "DCURLRouter.h"

@interface WebViewController ()

@property (nonatomic, strong) UIWebView *webView;


@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [self randomColors];
    
    self.navigationController.title = NSStringFromClass([self class]);
    
    NSLog(@"originUrl:%@",self.originUrl);
    NSLog(@"path:%@", self.path);
    NSLog(@"params:%@", self.params);
    
    UIWebView *webView = [[UIWebView alloc] init];
    self.webView = webView;
    webView.frame = self.view.bounds;
    [self.view addSubview:webView];
    
    NSURL *url = [NSURL URLWithString:self.params[@"urlStr"]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}


- (UIColor *)randomColors
{
    CGFloat r = arc4random_uniform(256)/255.0;
    CGFloat g = arc4random_uniform(256)/255.0;
    CGFloat b = arc4random_uniform(256)/255.0;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
    
}

@end
