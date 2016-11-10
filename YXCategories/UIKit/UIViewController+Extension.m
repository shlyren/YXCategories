//
//  UIViewController+Extension.m
//  驴宝宝
//
//  Created by 丨柠萌酱丶 on 2016/9/17.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

#import "UIViewController+Extension.h"

@implementation UIViewController (Extension)

- (UIViewController *)topViewController
{
    return [self topViewControllerWithRootViewController:self];
}

- (__kindof UIViewController *)loadStoryboard
{
    return [UIStoryboard storyboardWithName:NSStringFromClass([self class]) bundle:nil].instantiateInitialViewController;
}

- (UIViewController *)topViewControllerWithRootViewController:(UIViewController *)rootViewController
{
    if ([rootViewController isKindOfClass:[UITabBarController class]])
    {
        
        UITabBarController *tabBarController = (UITabBarController *)rootViewController;
        return [self topViewControllerWithRootViewController:tabBarController.selectedViewController];
    }
    else if ([rootViewController isKindOfClass:[UINavigationController class]])
    {
        
        UINavigationController *navigationController = (UINavigationController *)rootViewController;
        return [self topViewControllerWithRootViewController:navigationController.visibleViewController];
        
    }
    else if (rootViewController.presentedViewController)
    {
        
        return [self topViewControllerWithRootViewController:rootViewController.presentedViewController];
        
    }
    else
    {
        return rootViewController;
    }
}


@end
