//
//  DCURLNavgation.h
//  DCURLRouterDemo
//
//  Created by Dariel on 16/8/17.
//  Copyright © 2016年 DarielChen. All rights reserved.
//  控制器 导航控制器管理

#import <UIKit/UIKit.h>
#import "DCSingleton.h"

NS_ASSUME_NONNULL_BEGIN

@interface DCURLNavgation : NSObject
DCSingletonH(DCURLNavgation)

/**
 *  返回当前控制器
 */
- (UIViewController*)currentViewController;

/**
 *  返回当前的导航控制器
 */
- (UINavigationController*)currentNavigationViewController;



+ (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated replace:(BOOL)replace;
+ (void)presentViewController:(UIViewController *)viewController animated: (BOOL)flag completion:(void (^ __nullable)(void))completion;

+ (void)popTwiceViewControllerAnimated:(BOOL)animated;
+ (void)popViewControllerWithTimes:(NSUInteger)times animated:(BOOL)animated;
+ (void)popToRootViewControllerAnimated:(BOOL)animated;


+ (void)dismissTwiceViewControllerAnimated: (BOOL)flag completion: (void (^ __nullable)(void))completion;
+ (void)dismissViewControllerWithTimes:(NSUInteger)times animated: (BOOL)flag completion: (void (^ __nullable)(void))completion;
+ (void)dismissToRootViewControllerAnimated: (BOOL)flag completion: (void (^ __nullable)(void))completion;

NS_ASSUME_NONNULL_END

@end
