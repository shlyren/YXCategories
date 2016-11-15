//
//  UIButton+Extension.h
//  YXCategoriesDemo
//
//  Created by 任玉祥 on 2016/11/3.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extension)

#pragma mark - title
/** 默认标题 */
@property (nonatomic, strong) NSString *normalTitle;
/** 高亮标题 */
@property (nonatomic, strong) NSString *highlightedTitle;
/** 选中标题 */
@property (nonatomic, strong) NSString *selectedTitle;
/** 不可用标题 */
@property (nonatomic, strong) NSString *disabledTitle;

#pragma mark - title Color
/** 默认标题颜色 */
@property (nonatomic, strong) UIColor *normalTitleColor;
/** 高亮标题颜色 */
@property (nonatomic, strong) UIColor *highlightedTitleColor;
/** 选中标题颜色 */
@property (nonatomic, strong) UIColor *selectedTitleColor;
/** 不可用标题颜色 */
@property (nonatomic, strong) UIColor *disabledTitleColor;

#pragma mark - image
/** 默认图片 */
@property (nonatomic, strong) UIImage *normalImg;
/** 高亮图片 */
@property (nonatomic, strong) UIImage *highlightedImg;
/** 选中图片 */
@property (nonatomic, strong) UIImage *selectedImg;
/** 不可用图片 */
@property (nonatomic, strong) UIImage *disabledImg;

#pragma mark - background image
/** 默认背景图片 */
@property (nonatomic, strong) UIImage *normalBgImg;
/** 高亮背景图片 */
@property (nonatomic, strong) UIImage *highlightedBgImg;
/** 选中背景图片 */
@property (nonatomic, strong) UIImage *selectedBgImg;
/** 不可用背景图片 */
@property (nonatomic, strong) UIImage *disabledBgImg;


#pragma mark - action
/**
 给按钮添加事件
 event == UIControlEventTouchUpInside
 @param action 事件回调
 */
- (void)addTouchUpInsideAction:(void (^)(UIButton *button))action;
@end
