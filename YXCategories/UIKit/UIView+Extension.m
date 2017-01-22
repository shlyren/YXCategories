//
//  UIView+Extension.m
//  YXCategoriesDemo
//
//  Created by 任玉祥 on 2016/11/3.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)
- (__kindof UIViewController *)viewController
{
    for (UIView *next = [self superview]; next; next = next.superview)
    {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]])
            return (__kindof UIViewController *)nextResponder;
    }
    return nil;
}

/**
 把view加入到window
 
 */
- (void)addWindow
{
    [self.lastWindow addSubview: self];
}

- (UIWindow *)lastWindow
{
    NSArray *windows = [UIApplication sharedApplication].windows;
    for(UIWindow *window in [windows reverseObjectEnumerator]) {
        
        if ([window isKindOfClass:[UIWindow class]] && CGRectEqualToRect(window.bounds, [UIScreen mainScreen].bounds))
            return window;
    }
    
    return [UIApplication sharedApplication].keyWindow;
}

+ (NSArray<__kindof UIView*>*)loadViewsFromNib
{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil];
}

@end

#pragma mark - action
#import <objc/runtime.h>
@interface UIView ()
@property (nonatomic, copy) void (^tapActionBlock)();
@property (nonatomic, strong) UITapGestureRecognizer *tap;
/** 默认的的用户交互 */
@property (nonatomic, assign) BOOL defultUserInteractionEnabled;
@end

@implementation UIView (Action)

- (void)addTapAction:(void (^)())action
{
    self.tapActionBlock = action;
    self.defultUserInteractionEnabled = self.userInteractionEnabled;
    
    self.userInteractionEnabled = true;
    
    self.tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTap)];
    [self addGestureRecognizer:self.tap];
}

- (void)addTapTarget:(id)target action:(SEL)action
{
    self.defultUserInteractionEnabled = self.userInteractionEnabled;
    self.userInteractionEnabled = true;
    
    self.tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:@selector(action)];
    [self addGestureRecognizer:self.tap];
}
- (void)removeTapTarget:(id)target action:(SEL)action
{
    [self.tap removeTarget:target action:action];
    [self removeGestureRecognizer:self.tap];
    self.userInteractionEnabled = self.defultUserInteractionEnabled;
    self.tap = nil;
}

- (void)removeTapAction
{
    if (self.tap) {
        [self.tap removeTarget:self action:@selector(viewTap)];
        [self removeGestureRecognizer:self.tap];
        self.tap = nil;
    }
    if (self.tapActionBlock) {
        self.tapActionBlock = nil;
    }
    
    //    objc_removeAssociatedObjects(self);
    
    self.userInteractionEnabled = self.defultUserInteractionEnabled;
}

static char YXDefultUserInteractionEnabled = '\0';
- (void)setDefultUserInteractionEnabled:(BOOL)defultUserInteractionEnabled
{
    objc_setAssociatedObject(self, &YXDefultUserInteractionEnabled, @(defultUserInteractionEnabled), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)defultUserInteractionEnabled
{
    return [objc_getAssociatedObject(self, &YXDefultUserInteractionEnabled) boolValue];
}

static char YXTapGes = '\0';
- (void)setTap:(UITapGestureRecognizer *)tap
{
    objc_setAssociatedObject(self, &YXTapGes, tap, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UITapGestureRecognizer *)tap
{
    return objc_getAssociatedObject(self, &YXTapGes);
}

static char YXTapAction = '\0';
- (void)setTapActionBlock:(void (^)())tapActionBlock
{
    objc_setAssociatedObject(self, &YXTapAction, tapActionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)())tapActionBlock
{
    return objc_getAssociatedObject(self, &YXTapAction);
}

- (void)viewTap
{
    if (self.tapActionBlock) {
        self.tapActionBlock();
    }
}



@end
