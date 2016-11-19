//
//  MBProgressHUD+Extension.h
//  YXCategoriesDemo
//
//  Created by JiaQi on 2016/11/17.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import "MBProgressHUD.h"

typedef NS_ENUM(NSInteger, MBProgressHUDType) {
    MBProgressHUDNormal = -1,
    MBProgressHUDError = 0,
    MBProgressHUDSuccess = 1,
};

@interface MBProgressHUD (Extension)

+ (void)showSuccess:(NSString *)success toView:(UIView *)view;
+ (void)showError:(NSString *)error toView:(UIView *)view;
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;
+ (void)hideHUDForView:(UIView *)view;


/**
 显示信息
 
 @param message 信息内容
 @param type    信息类别 1 成功状态，0失败状态，-1（默认）普通状态（菊花）
 */
+ (void)showMessage:(NSString *)message type:(MBProgressHUDType)type;
+ (void)showSuccess:(NSString *)success;
+ (void)showError:(NSString *)error;
+ (MBProgressHUD *)showMessage:(NSString *)message;
/**
 展示一个没有图片只有文字的提示框
 
 @param title 提示文字
 */
+ (void)showTitle:(NSString *)title;

+ (void)hideHUD;
@end
