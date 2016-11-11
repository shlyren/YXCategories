//
//  UIBarButtonItem+Extension.m
//  BaiDeJie
//
//  Created by 无头骑士 GJ on 16/1/19.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)

/**
 *  设置UIBarButtonItem属性，并返回
 *
 *  @param image     图片
 *  @param highImage 高亮图片
 *  @param target    调用者
 *  @param action    调用者的方法
 *
 *  @return UIBarButtonItem
 */
+ (UIBarButtonItem *)setupBarButtonItemWithImage:(UIImage *)image highImage:(UIImage *)highImage addTarget:(id)target action:(SEL)action;
{
    return [self setupBarButtonItemWithImage: image highImage: highImage frame: CGRectZero addTarget: target action: action];
}
/**
 *  设置UIBarButtonItem属性，并返回
 *
 *  @param image     图片
 *  @param highImage 高亮图片
 *  @param frame     图片尺寸
 *  @param target    调用者
 *  @param action    调用者的方法
 *
 *  @return UIBarButtonItem
 */
+ (UIBarButtonItem *)setupBarButtonItemWithImage:(UIImage *)image highImage:(UIImage *)highImage frame:(CGRect)frame addTarget:(id)target action:(SEL)action;
{
    UIView *view = [UIView new];
    
    UIButton *btn = [UIButton buttonWithType: UIButtonTypeCustom];
    [btn setImage: image forState: UIControlStateNormal];
    [btn setImage: highImage forState: UIControlStateHighlighted];
    if (CGRectIsEmpty(frame))
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

    return [[UIBarButtonItem new] initWithCustomView: view];
}

/**
 *  设置UIBarButtonItem属性，并返回
 *
 *  @param image     图片
 *  @param selectedImage 选中图片
 *  @param target    调用者
 *  @param action    调用者的方法
 *
 *  @return UIBarButtonItem
 */
+ (UIBarButtonItem *)setupBarButtonItemWithImage:(UIImage *)image selectedImage:(UIImage *)selectedImage addTarget:(id)target action:(SEL)action
{
    return [self setupBarButtonItemWithImage: image selectedImage: selectedImage frame: CGRectZero addTarget: self action: action];
}

/**
 *  设置UIBarButtonItem属性，并返回
 *
 *  @param image     图片
 *  @param selectedImage 选中图片
 *  @param frame     图片尺寸
 *  @param target    调用者
 *  @param action    调用者的方法
 *
 *  @return UIBarButtonItem
 */
+ (UIBarButtonItem *)setupBarButtonItemWithImage:(UIImage *)image selectedImage:(UIImage *)selectedImage frame:(CGRect)frame addTarget:(id)target action:(SEL)action
{
    UIView *view = [UIView new];
    
    UIButton *btn = [UIButton buttonWithType: UIButtonTypeCustom];
    [btn setImage: image forState: UIControlStateNormal];
    [btn setImage: selectedImage forState: UIControlStateSelected];
    
    if (CGRectIsEmpty(frame))
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
    
    return [[UIBarButtonItem new] initWithCustomView: view];
}

/**
 *  设置返回按钮
 *
 *  @param image     图片
 *  @param highImage 高亮图片
 *  @param target    self
 *  @param action    action
 *  @param title     标题
 *
 *  @return UIBarButtonItem
 */
+ (UIBarButtonItem *)backItemWithImage:(UIImage *)image highImage:(UIImage *)highImage addTarget:(id)target action:(SEL)action title:(NSString *)title
{
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setTitle:title forState:UIControlStateNormal];
    [backButton setImage:image forState:UIControlStateNormal];
    [backButton setImage:highImage forState:UIControlStateHighlighted];
    //backButton.frame = CGRectMake(0, 0, 20, 20);
    [backButton sizeToFit];
    
    // 设置内容内边距
    backButton.contentEdgeInsets = UIEdgeInsetsMake(0, -30, 0, 0);
    
    [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    
    [backButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
}
@end
