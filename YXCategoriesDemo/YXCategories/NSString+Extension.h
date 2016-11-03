//
//  NSString+Extension.h
//  YXCategoriesDemo
//
//  Created by 任玉祥 on 2016/11/3.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface NSString (Extension)

/**
 *  计算当前字符串显示所需的实际frame，返回值的x = 0, y = 0
 */
- (CGRect)textRectWithSize:(CGSize)size attributes:(NSDictionary *)attributes;

/**
 *  判断字符串是否为空
 *
 *  @return boolean
 */
- (BOOL)isBlankString;

/**
 判断字符串是否为电话号码(移动,电信,联通)
 
 @return 是否合法
 */
- (BOOL)checkPhone;


/**
 获取今年的字符串
 
 @return 今年字符串
 */
+ (NSString *)currentYearStr;


/**
 md5 加密

 @return 加密后的字符串
 */
- (NSString *)md5;
@end
