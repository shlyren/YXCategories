//
//  UITextField+Extension.m
//  YXCategoriesDemo
//
//  Created by 任玉祥 on 2016/11/15.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import "UITextField+Extension.h"
#import <objc/runtime.h>

@interface UITextField ()
@property (nonatomic, copy) void (^editingChangedBlock)();
@end

@implementation UITextField (Extension)
#pragma mark - UIControlEventEditingChanged
/**
 编辑改变的时候执行block回调
 event == UIControlEventEditingChanged
 @param action 回调
 */
- (void)addEditingChangedAction:(void (^)())action;
{
    self.editingChangedBlock = action;
    [self addTarget:self action:@selector(editingChanged) forControlEvents:UIControlEventEditingChanged];
}
- (void)removeEditingChangedAction
{
    [self removeTarget:self action:@selector(editingChanged) forControlEvents:UIControlEventEditingChanged];
    if (self.editingChangedBlock) {
        self.editingChangedBlock = nil;
    }
}

static char YXEditingChangedAction = '\0';
- (void)setEditingChangedBlock:(void (^)())editingChanged
{
    objc_setAssociatedObject(self, &YXEditingChangedAction, editingChanged, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)())editingChangedBlock
{
    return objc_getAssociatedObject(self, &YXEditingChangedAction);
}

- (void)editingChanged
{
    if (self.editingChangedBlock) {
        self.editingChangedBlock();
    }
}
@end
