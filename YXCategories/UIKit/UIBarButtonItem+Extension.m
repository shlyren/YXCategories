//
//  UIBarButtonItem+Extension.m
//  BaiDeJie
//
//  Created by 任玉祥 on 16/1/19.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)
/**
 设置图片
 */
+ (instancetype)itemWitImage:(UIImage *)image target:(id)target action:(SEL)action
{
    return [[self alloc] initWithImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:target action:action];
}

+ (instancetype)itemWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action;
{
    return [self itemWithImage: image highImage: highImage frame: CGRectZero target: target action: action];
}

+ (instancetype)itemWithImage:(UIImage *)image highImage:(UIImage *)highImage frame:(CGRect)frame target:(id)target action:(SEL)action;
{
    return [self itemWithImage:image selectedImage:nil highImage:highImage frame:frame target:target action:action];
}


+ (instancetype)itemWithImage:(UIImage *)image selectedImage:(UIImage *)selectedImage target:(id)target action:(SEL)action
{
    return [self itemWithImage: image selectedImage: selectedImage frame: CGRectZero target: self action: action];
}

+ (instancetype)itemWithImage:(UIImage *)image selectedImage:(UIImage *)selectedImage frame:(CGRect)frame target:(id)target action:(SEL)action
{
    return [self itemWithImage:image selectedImage:selectedImage highImage:nil frame:frame target:target action:action];
}

+ (instancetype)itemWithImage:(UIImage *)image selectedImage:(UIImage *)selectedImage highImage:(UIImage *)highImage target:(id)target action:(SEL)action
{
    return [self itemWithImage:image selectedImage:selectedImage highImage:highImage frame:CGRectZero target:target action:action];
}

+ (instancetype)itemWithImage:(UIImage *)image selectedImage:(UIImage *)selectedImage highImage:(UIImage *)highImage frame:(CGRect)frame target:(id)target action:(SEL)action
{
    
    UIView *view = [UIView new];
    
    UIButton *btn = [UIButton buttonWithType: UIButtonTypeCustom];
    [btn setImage: [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState: UIControlStateNormal];
    [btn setImage: [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState: UIControlStateSelected];
    [btn setImage: [highImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState: UIControlStateHighlighted];
    
    if (CGRectEqualToRect(frame, CGRectZero))
    {
        [btn sizeToFit];
    }
    else
    {
        btn.frame = frame;
    }
    
    [btn addTarget: target action: action forControlEvents: UIControlEventTouchUpInside];
    [view addSubview: btn];
    
    view.frame = btn.bounds;
    
    return [[UIBarButtonItem alloc] initWithCustomView: view];
}
@end
