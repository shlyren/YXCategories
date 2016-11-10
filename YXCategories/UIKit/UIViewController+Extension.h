//
//  UIViewController+Extension.h
//  驴宝宝
//
//  Created by 丨柠萌酱丶 on 2016/9/17.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Extension)

/** 最前面的viewcontroller */
@property (nonatomic, strong, readonly) UIViewController *topViewController;

/** 加载storyboard initialViewController */
@property (nonatomic, strong, readonly) __kindof UIViewController *loadStoryboard;
@end
