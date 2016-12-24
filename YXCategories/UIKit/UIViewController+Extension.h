//
//  UIViewController+Extension.h
//   
//
//  Created by 任玉祥 on 2016/9/17.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Extension)

/** 最前面的viewcontroller */
- (UIViewController *)topViewController;

/** 加载storyboard initialViewController */
- (__kindof UIViewController *)loadStoryboard;
+ (__kindof UIViewController *)loadStoryboard;
@end
