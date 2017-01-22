//
//  UIButton+Extension.m
//  YXCategoriesDemo
//
//  Created by 任玉祥 on 2016/11/3.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import "UIButton+Extension.h"

@implementation UIButton (Extension)
#pragma mark - title
- (void)setNormalTitle:(NSString *)title
{
    [self setTitle:title forState:UIControlStateNormal];
}
- (NSString *)normalTitle
{
    return [self titleForState:UIControlStateNormal];
}
- (void)setHighlightedTitle:(NSString *)title
{
    [self setTitle:title forState:UIControlStateHighlighted];
}
- (NSString *)highlightedTitle
{
    return [self titleForState:UIControlStateHighlighted];
}
- (void)setSelectedTitle:(NSString *)title
{
    [self setTitle:title forState:UIControlStateSelected];
}
- (NSString *)selectedTitle
{
    return [self titleForState:UIControlStateSelected];
}
- (void)setDisabledTitle:(NSString *)title
{
    [self setTitle:title forState:UIControlStateDisabled];
}
- (NSString *)disabledTitle
{
    return [self titleForState:UIControlStateDisabled];
}

#pragma mark - titlecolor
- (void)setNormalTitleColor:(UIColor *)color
{
    [self setTitleColor:color forState:UIControlStateNormal];
}
- (UIColor *)normalTitleColor
{
    return [self titleColorForState:UIControlStateNormal];
}
- (void)setHighlightedTitleColor:(UIColor *)color
{
    [self setTitleColor:color forState:UIControlStateHighlighted];
}
- (UIColor *)highlightedTitleColor
{
    return [self titleColorForState:UIControlStateHighlighted];
}
- (void)setSelectedTitleColor:(UIColor *)color
{
    [self setTitleColor:color forState:UIControlStateSelected];
}
- (UIColor *)selectedTitleColor
{
    return [self titleColorForState:UIControlStateSelected];
}
- (void)setDisabledTitleColor:(UIColor *)color
{
    [self setTitleColor:color forState:UIControlStateDisabled];
}
- (UIColor *)disabledTitleColor
{
    return [self titleColorForState:UIControlStateDisabled];
}

#pragma mark - image
- (void)setNormalImg:(UIImage *)imgN
{
    [self setImage:imgN forState:UIControlStateNormal];
}
- (UIImage *)normalImg
{
    return [self imageForState:UIControlStateNormal];
}
- (void)setHighlightedImg:(UIImage *)imgN
{
    [self setImage:imgN forState:UIControlStateHighlighted];
}
- (UIImage *)highlightedImg
{
    return [self imageForState:UIControlStateHighlighted];
}
- (void)setSelectedImg:(UIImage *)imgN
{
    [self setImage:imgN forState:UIControlStateSelected];
}
- (UIImage *)selectedImg
{
    return [self imageForState:UIControlStateSelected];
}
- (void)setDisabledImg:(UIImage *)imgN
{
    [self setImage:imgN forState:UIControlStateDisabled];
}
- (UIImage *)disabledImg
{
    return [self imageForState:UIControlStateDisabled];
}
#pragma mark - backgroundImg
- (void)setNormalBgImg:(UIImage *)imgN
{
    [self setBackgroundImage:imgN forState:UIControlStateNormal];
}
- (UIImage *)normalBgImg
{
    return [self backgroundImageForState:UIControlStateNormal];
}
- (void)setHighlightedBgImg:(UIImage *)imgN
{
    [self setBackgroundImage:imgN forState:UIControlStateHighlighted];
}
- (UIImage *)highlightedBgImg
{
    return [self backgroundImageForState:UIControlStateHighlighted];
}
- (void)setSelectedBgImg:(UIImage *)imgN
{
    [self setBackgroundImage:imgN forState:UIControlStateSelected];
}
- (UIImage *)selectedBgImg
{
    return [self backgroundImageForState:UIControlStateSelected];
}
- (void)setDisabledBgImg:(UIImage *)imgN
{
    [self setBackgroundImage:imgN forState:UIControlStateDisabled];
}
- (UIImage *)disabledBgImg
{
    return [self backgroundImageForState:UIControlStateDisabled];
}


@end

#pragma mark - action

#import <objc/runtime.h>

@interface UIButton ()
@property (nonatomic, copy) void (^action)();
@end

@implementation UIButton (Action)

static char YXTouchUpInsideAction = '\0';
- (void)setAction:(void (^)())action
{
    /*
     产生关联,让某个对象(name)与当前对象的属性(name)产生关联
     参数1: id object :表示给哪个对象添加关联
     参数2: const void *key : 表示: id类型的key值(以后用这个key来获取属性) 属性名
     参数3: id value : 属性值
     参数4: 策略, 是个枚举(点进去,解释很详细)
     */
    objc_setAssociatedObject(self, &YXTouchUpInsideAction, action , OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)())action
{
    return objc_getAssociatedObject(self, &YXTouchUpInsideAction);
}

/**
 给按钮添加点击事件
 event == UIControlEventTouchUpInside
 @param action 事件 block
 */
- (void)addTouchUpInsideAction:(void (^)())action
{
    
    self.action = action;
    [self addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)removeTouchUpInsideAction
{
    [self removeTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    if (self.action) {
        self.action = nil;
    }
}

- (void)buttonClick
{
    if (self.action) {
        self.action();
    }
}

@end
