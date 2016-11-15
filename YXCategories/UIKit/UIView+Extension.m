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
@property (nonatomic, copy) void (^action)(UIView *);
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
- (void)addTapAction:(void (^)(UIView *view))action
{
    self.action = action;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTap)];
    [self addGestureRecognizer:tap];
}

static char *kTapAction = "kTapAction";
- (void)setAction:(void (^)(UIView *))action
{
    objc_setAssociatedObject(self, kTapAction, action, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(UIView *))action
{
    return objc_getAssociatedObject(self, kTapAction);
}

- (void)viewTap
{
    if (self.action) {
        self.action(self);
    }
}

@end
