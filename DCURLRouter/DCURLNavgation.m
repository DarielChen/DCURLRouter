//
//  DCURLNavgation.m
//  DCURLRouterDemo
//
//  Created by Dariel on 16/8/17.
//  Copyright © 2016年 DarielChen. All rights reserved.
//

#import "DCURLNavgation.h"

#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif

@implementation DCURLNavgation
DCSingletonM(DCURLNavgation)

- (UIViewController*)currentViewController {
    UIViewController* rootViewController = self.applicationDelegate.window.rootViewController;
    return [self currentViewControllerFrom:rootViewController];
}

- (UINavigationController*)currentNavigationViewController {
    UIViewController* currentViewController = self.currentViewController;
    return currentViewController.navigationController;
}

- (id<UIApplicationDelegate>)applicationDelegate {
    return [UIApplication sharedApplication].delegate;
}

+ (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated replace:(BOOL)replace
{
    if (!viewController) {
        DLog(@"请添加与url相匹配的控制器到plist文件中,或者协议头可能写错了!");
    }
    else {
        if([viewController isKindOfClass:[UINavigationController class]]) {
            [DCURLNavgation setRootViewController:viewController];
        } // 如果是导航控制器直接设置为根控制器
        else {
            UINavigationController *navigationController = [DCURLNavgation sharedDCURLNavgation].currentNavigationViewController;
            if (navigationController) { // 导航控制器存在
                // In case it should replace, look for the last UIViewController on the UINavigationController, if it's of the same class, replace it with a new one.
                if (replace && [navigationController.viewControllers.lastObject isKindOfClass:[viewController class]]) {
                                        
                    NSArray *viewControllers = [navigationController.viewControllers subarrayWithRange:NSMakeRange(0, navigationController.viewControllers.count-1)];
                    [navigationController setViewControllers:[viewControllers arrayByAddingObject:viewController] animated:animated];
                } // 切换当前导航控制器 需要把原来的子控制器都取出来重新添加
                else {
                    [navigationController pushViewController:viewController animated:animated];
                } // 进行push
            }
            else {
                navigationController = [[UINavigationController alloc]initWithRootViewController:viewController];
                [DCURLNavgation sharedDCURLNavgation].applicationDelegate.window.rootViewController = navigationController;
            } // 如果导航控制器不存在,就会创建一个新的,设置为根控制器
        }
    }
}

+ (void)presentViewController:(UIViewController *)viewController animated: (BOOL)flag completion:(void (^ __nullable)(void))completion
{
    if (!viewController) {
        DLog(@"请添加与url相匹配的控制器到plist文件中,或者协议头可能写错了!");
    }else {
        UIViewController *currentViewController = [[DCURLNavgation sharedDCURLNavgation] currentViewController];
        if (currentViewController) { // 当前控制器存在
            [currentViewController presentViewController:viewController animated:flag completion:completion];
        } else { // 将控制器设置为根控制器
            [DCURLNavgation sharedDCURLNavgation].applicationDelegate.window.rootViewController = viewController;
        }
    }
}

// 设置为根控制器
+ (void)setRootViewController:(UIViewController *)viewController
{
    [DCURLNavgation sharedDCURLNavgation].applicationDelegate.window.rootViewController = viewController;
}

// 通过递归拿到当前控制器
- (UIViewController*)currentViewControllerFrom:(UIViewController*)viewController {
    if ([viewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController* navigationController = (UINavigationController *)viewController;
        return [self currentViewControllerFrom:navigationController.viewControllers.lastObject];
    } // 如果传入的控制器是导航控制器,则返回最后一个
    else if([viewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController* tabBarController = (UITabBarController *)viewController;
        return [self currentViewControllerFrom:tabBarController.selectedViewController];
    } // 如果传入的控制器是tabBar控制器,则返回选中的那个
    else if(viewController.presentedViewController != nil) {
        return [self currentViewControllerFrom:viewController.presentedViewController];
    } // 如果传入的控制器发生了modal,则就可以拿到modal的那个控制器
    else {
        return viewController;
    }
}

+ (void)popTwiceViewControllerAnimated:(BOOL)animated {
    [DCURLNavgation popViewControllerWithTimes:2 animated:YES];
}

+ (void)popViewControllerWithTimes:(NSUInteger)times animated:(BOOL)animated {

    UIViewController *currentViewController = [[DCURLNavgation sharedDCURLNavgation] currentViewController];
    NSUInteger count = currentViewController.navigationController.viewControllers.count;
    if(currentViewController){
        if(currentViewController.navigationController) {
            if (count > times){
                [currentViewController.navigationController popToViewController:[currentViewController.navigationController.viewControllers objectAtIndex:count-1-times] animated:animated];
            }else { // 如果times大于控制器的数量
                DLog(@"确定可以pop掉那么多控制器?");
            }
        }
    }
}

+ (void)popToRootViewControllerAnimated:(BOOL)animated {
    UIViewController *currentViewController = [[DCURLNavgation sharedDCURLNavgation] currentViewController];
    NSUInteger count = currentViewController.navigationController.viewControllers.count;
    [DCURLNavgation popViewControllerWithTimes:count-1 animated:YES];
}


+ (void)dismissTwiceViewControllerAnimated: (BOOL)flag completion: (void (^ __nullable)(void))completion {
    [self dismissViewControllerWithTimes:2 animated:YES completion:completion];
}


+ (void)dismissViewControllerWithTimes:(NSUInteger)times animated: (BOOL)flag completion: (void (^ __nullable)(void))completion {
    UIViewController *rootVC = [[DCURLNavgation sharedDCURLNavgation] currentViewController];
    
    if (rootVC) {
        while (times > 0) {
            rootVC = rootVC.presentingViewController;
            times -= 1;
        }
        [rootVC dismissViewControllerAnimated:YES completion:completion];
    }
    
    if (!rootVC.presentedViewController) {
        DLog(@"确定能dismiss掉这么多控制器?");
    }
}


+ (void)dismissToRootViewControllerAnimated: (BOOL)flag completion: (void (^ __nullable)(void))completion {
    UIViewController *currentViewController = [[DCURLNavgation sharedDCURLNavgation] currentViewController];
    UIViewController *rootVC = currentViewController;
    while (rootVC.presentingViewController) {
        rootVC = rootVC.presentingViewController;
    }
    [rootVC dismissViewControllerAnimated:YES completion:completion];
}

@end
