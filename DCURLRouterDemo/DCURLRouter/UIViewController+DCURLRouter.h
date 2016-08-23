//
//  UIViewController+DCURLRouter.h
//  DCURLRouterDemo
//
//  Created by Dariel on 16/8/17.
//  Copyright © 2016年 DarielChen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface UIViewController (DCURLRouter)

/** 跳转后控制器能拿到的url */
@property(nonatomic, strong) NSURL *originUrl;

/** url路径 */
@property(nonatomic,copy) NSString *path;

/** 跳转后控制器能拿到的参数 */
@property(nonatomic,strong) NSDictionary *params;

// 根据参数创建控制器
+ (UIViewController *)initFromString:(NSString *)urlString fromConfig:(NSDictionary *)configDict;
// 根据参数创建控制器
+ (UIViewController *)initFromString:(NSString *)urlString withQuery:(NSDictionary *)query fromConfig:(NSDictionary *)configDict;


NS_ASSUME_NONNULL_END

@end
