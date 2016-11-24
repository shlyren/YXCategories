//
//  UITextField+Extension.h
//  YXCategoriesDemo
//
//  Created by JiaQi on 2016/11/15.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Extension)

/**
 编辑改变的时候执行block回调 
 event == UIControlEventEditingChanged
 @param action 回调
 */
- (void)addEditingChangedAction:(void (^)(UITextField *textField))action;

- (void)removeEditingChangedAction;
@end
