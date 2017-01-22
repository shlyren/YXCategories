//
//  UIView+Extension.h
//  YXCategoriesDemo
//
//  Created by 任玉祥 on 2016/11/3.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

/**
 获取view的控制器
 @return 控制器
 */
- (__kindof UIViewController *)viewController;

/**
 把view加入到window
 */
- (void)addWindow;

- (UIWindow *)lastWindow;

/**
 从xib加载view

 @return 所有的view集合
 */
+ (NSArray<__kindof UIView*>*)loadViewsFromNib;

@end

@interface UIView (Action)

/**
 给uiview添加点击事件
 
 @param action 事件
 */
- (void)addTapAction:(void (^)())action;
- (void)removeTapAction;

- (void)addTapTarget:(id)target action:(SEL)action;
- (void)removeTapTarget:(id)target action:(SEL)action;

@end
