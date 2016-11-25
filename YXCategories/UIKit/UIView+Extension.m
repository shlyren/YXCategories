//
//  UIView+Extension.m
//  YXCategoriesDemo
//
//  Created by 任玉祥 on 2016/11/3.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import "UIView+Extension.h"
#import <objc/runtime.h>

@interface UIView ()
@property (nonatomic, copy) void (^action)(__kindof UIView *);
@property (nonatomic, strong) UITapGestureRecognizer *tap;
/** 默认的的用户交互 */
@property (nonatomic, assign) BOOL defultUserInteractionEnabled;
@end

@implementation UIView (Extension)

/**
 把view加入到window
 
 @return 是否成功
 */
- (BOOL)addWindow
{
    NSEnumerator *frontToBackWindows = [UIApplication.sharedApplication.windows reverseObjectEnumerator];
    for (UIWindow *window in frontToBackWindows)
    {
        BOOL windowOnMainScreen = window.screen == UIScreen.mainScreen;
        BOOL windowIsVisible = !window.hidden && window.alpha > 0;
        BOOL windowLevelNormal = window.windowLevel == UIWindowLevelNormal;
        
        if(windowOnMainScreen && windowIsVisible && windowLevelNormal)
        {
            [window addSubview:self];
            return true;
        }
    }
    
#ifdef DEBUG
    NSLog(@"%@ 无法添加到window", self);
#endif
    return false;
}
+ (NSArray<__kindof UIView*>*)loadViewsFromNib
{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil];
}


#pragma mark - action
- (void)addTapAction:(void (^)(__kindof UIView *view))action
{
    self.action = action;
    self.defultUserInteractionEnabled = self.userInteractionEnabled;
    
    self.userInteractionEnabled = true;
    
    self.tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTap)];
    [self addGestureRecognizer:self.tap];
}

- (void)removeTapAction
{
    if (self.tap) {
        [self.tap removeTarget:self action:@selector(viewTap)];
        [self removeGestureRecognizer:self.tap];
        self.tap = nil;
    }
    if (self.action) {
        self.action = nil;
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
- (void)setAction:(void (^)(__kindof UIView *))action
{
    objc_setAssociatedObject(self, &YXTapAction, action, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(__kindof UIView *))action
{
    return objc_getAssociatedObject(self, &YXTapAction);
}

- (void)viewTap
{
    if (self.action) {
        self.action(self);
    }
}

@end
