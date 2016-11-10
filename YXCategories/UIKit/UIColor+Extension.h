//
//  UIColor+Extension.h
//  YXCategoriesDemo
//
//  Created by 任玉祥 on 2016/11/3.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)

/** 由颜色 -> 图片 */
@property (nonatomic, strong, readonly) UIImage *image;

/** UIColor -> 十六进制 */
@property (nonatomic, strong, readonly) NSString *hex;


/**
 从十六进制字符串获取颜色，
 @param color 支持@“#123456”、 @“0X123456”、 @“123456”三种格式
 @param alpha 透明度
 
 @return 颜色
 */
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;


/**
 从十六进制字符串获取颜色， alpha == 1.0f
 @param color 支持@“#123456”、 @“0X123456”、 @“123456”三种格式
 
 @return 颜色
 */
+ (UIColor *)colorWithHexString:(NSString *)color;



@end
