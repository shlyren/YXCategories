//
//  MBProgressHUD+Extension.m
//  YXCategoriesDemo
//
//  Created by JiaQi on 2016/11/17.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import "MBProgressHUD+Extension.h"

@implementation MBProgressHUD (Extension)
#pragma mark 显示信息
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = text;
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", icon]]];
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    // 1秒之后再消失
    [hud hide:YES afterDelay:1.0];
}

#pragma mark 显示错误信息
+ (void)showError:(NSString *)error toView:(UIView *)view{
    [self show:error icon:@"error.png" view:view];
}

+ (void)showSuccess:(NSString *)success toView:(UIView *)view
{
    [self show:success icon:@"success.png" view:view];
}

#pragma mark 显示一些信息
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = message;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // YES代表需要蒙版效果
    hud.dimBackground = YES;
    return hud;
}

+ (void)hideHUDForView:(UIView *)view
{
    [self hideHUDForView:view animated:YES];
}



+ (void)showMessage:(NSString *)message type:(MBProgressHUDType)type
{
    switch (type) {
        case MBProgressHUDSuccess:
            [self showSuccess:message];
            break;
        case MBProgressHUDError:
            [self showError:message];
            break;
        default:
            [self showMessage:nil];
            break;
    }
}

+ (void)showSuccess:(NSString *)success
{
    [self hideHUD];
    [self showSuccess:success toView:nil];
}

+ (void)showError:(NSString *)error
{
    [self hideHUD];
    [self showError:error toView:nil];
}

+ (MBProgressHUD *)showMessage:(NSString *)message
{
    [self hideHUD];
    return [self showMessage:message toView:nil];
}

+ (void)showTitle:(NSString *)title
{
    [self hideHUD];
    [self show:title icon:nil view:nil];
}


+ (void)hideHUD
{
    [self hideHUDForView:nil];
}
@end
