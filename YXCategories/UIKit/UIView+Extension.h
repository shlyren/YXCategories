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
 把view加入到window
 
 @return 是否成功
 */
- (BOOL)addWindow;

/**
 从xib加载view

 @return 所有的view集合
 */
+ (NSArray<__kindof UIView*>*)loadViewsFromNib;

/**
 给uiview添加点击事件

 @param action 事件
 */
- (void)addTapAction:(void (^)(UIView *view))action;
@end
