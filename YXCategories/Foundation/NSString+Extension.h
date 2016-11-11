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

/** 时间戳 -> yyy-MM-dd HH:mm */
@property (nonatomic, copy, readonly) NSString *formatDate;

/** 去掉空格 */
@property (nonatomic, strong, readonly) NSString *stringByTrim;

/** 判断字符串是否为空 */
@property (nonatomic, assign, readonly, getter=isBlankString) BOOL blankString;

/** 判断字符串是否为电话号码(移动,电信,联通) */
@property (nonatomic, assign, readonly, getter=isPhoneNum) BOOL phoneNum;

/** 验证金额是否合法 支持0 0.0 0.00 两位小数  */
@property (nonatomic, assign, readonly, getter=isMoney) BOOL money;

/** 获取今年的字符串 */
@property (class, nonatomic, strong, readonly) NSString *currentYear;

/** 获取当前时间戳  */
@property (class, nonatomic, assign, readonly) long UnixTime;

/** md5加密 */
@property (nonatomic, strong, readonly) NSString *md5;

/** 字符串 -> UIColor
 支持@“#123456”、 @“0X123456”、 @“123456”三种格式
 */
@property (nonatomic, strong, readonly) UIColor *color;


/**
 获取从当前的年月到截至的年月
 
 @param endDateStr 截至年月  格式 yyyy-MM `-`为连接符 可根据情况自己定制
 @return 数组 firstObject 为当前的年月
 */
- (NSArray *)arryWithEndDate:(NSString *)endDateStr;

/**
 计算当前字符串显示所需的实际frame，返回值的x = 0, y = 0
 
 @param size 文字size
 @param attributes 格式
 @return 实际size
 */
- (CGRect)textRectWithSize:(CGSize)size attributes:(NSDictionary *)attributes;
@end
