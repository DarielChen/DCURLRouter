//
//  OneChildView.m
//  DCURLRouterDemo
//
//  Created by Dariel on 16/8/19.
//  Copyright © 2016年 DarielChen. All rights reserved.
//

#import "OneChildView.h"
#import "DCURLRouter.h"

@implementation OneChildView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor cyanColor];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(addClick:)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)addClick:(UITapGestureRecognizer *)gesture
{
    NSString *urlStr = @"dariel://twoitem?name=dariel&userid=213213";
    [DCURLRouter pushURLString:urlStr animated:YES];

}

@end
