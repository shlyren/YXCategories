//
//  UIBarButtonItem+Extension.h
//  BaiDeJie
//
//  Created by 任玉祥 on 16/1/19.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+ (instancetype)itemWitImage:(UIImage *)image target:(id)target action:(SEL)action;

+ (instancetype)itemWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action;

+ (instancetype)itemWithImage:(UIImage *)image highImage:(UIImage *)highImage frame:(CGRect)frame target:(id)target action:(SEL)action;

+ (instancetype)itemWithImage:(UIImage *)image selectedImage:(UIImage *)selectedImage target:(id)target action:(SEL)action;

+ (instancetype)itemWithImage:(UIImage *)image selectedImage:(UIImage *)selectedImage frame:(CGRect)frame target:(id)target action:(SEL)action;

+ (instancetype)itemWithImage:(UIImage *)image selectedImage:(UIImage *)selectedImage highImage:(UIImage *)highImage target:(id)target action:(SEL)action;

+ (instancetype)itemWithImage:(UIImage *)image selectedImage:(UIImage *)selectedImage highImage:(UIImage *)highImage frame:(CGRect)frame target:(id)target action:(SEL)action;

@end
