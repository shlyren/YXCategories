//
//  NSString+Extension.h
//  YXCategoriesDemo
//
//  Created by 任玉祥 on 2016/11/3.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Extension)

/**
 时间戳 -> yyy-MM-dd HH:mm
 */
@property (nonatomic, copy, readonly) NSString *formatDate;

/**
 去掉空格
 */
@property (nonatomic, strong, readonly) NSString *stringByTrim;

/**
 *  计算当前字符串显示所需的实际frame，返回值的x = 0, y = 0
 */
- (CGRect)textRectWithSize:(CGSize)size attributes:(NSDictionary *)attributes;

/**
 *  判断字符串是否为空
 */
@property (nonatomic, assign, readonly, getter=isBlankString) BOOL blankString;

/**
 判断字符串是否为电话号码(移动,电信,联通)
 */
@property (nonatomic, assign, readonly, getter=isPhoneNum) BOOL phoneNum;

/**
 验证金额是否合法 支持0 0.0 0.00 两位小数
 */
@property (nonatomic, assign, readonly, getter=isMoney) BOOL money;

/**
 获取今年的字符串
 */
@property (class, nonatomic, strong, readonly) NSString *currentYear;

/**
 获取当前时间戳
 */
@property (class, nonatomic, assign, readonly) long UnixTime;

/**
 md5 加密
 */
@property (nonatomic, strong, readonly) NSString *md5;
@end
