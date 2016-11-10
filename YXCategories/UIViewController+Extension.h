//
//  UIViewController+Extension.h
//  驴宝宝
//
//  Created by 丨柠萌酱丶 on 2016/9/17.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Extension)

- (UIViewController *)topViewController;

/**
 加载storyboard initialViewController

 @return UIViewController
 */
- (__kindof UIViewController *)loadStoryboard;
@end
