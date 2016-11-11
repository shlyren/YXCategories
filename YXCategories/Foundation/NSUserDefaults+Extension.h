//
//  NSUserDefaults+Extension.h
//  YXCategoriesDemo
//
//  Created by 任玉祥 on 2016/11/3.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (Extension)

NS_ASSUME_NONNULL_BEGIN

/**
 写入一个对象
 
 @param value 对象
 @param defaultName key
 */
+ (void)setObject:(id)value forKey:(NSString *)defaultName;

/**
 获取对象
 
 @param defaultName key
 @return 对象
 */
+ (nullable id)objectForKey:(NSString *)defaultName;


/**
 移除对象
 
 @param defaultName key
 */
+ (void)removeObjectForKey:(NSString *)defaultName;


/**
 写入 NSInteger
 
 @param value 值
 @param defaultName key
 */
+ (void)setInteger:(NSInteger)value forKey:(NSString *)defaultName;

/**
 获取 NSInteger
 
 @param defaultName key
 @return NSInteger
 */
+ (NSInteger)integerForKey:(NSString *)defaultName;


/**
 写入 float
 
 @param value 值
 @param defaultName key
 */
+ (void)setFloat:(float)value forKey:(NSString *)defaultName;
/**
 获取 float
 
 @param defaultName key
 @return float
 */
+ (float)floatForKey:(NSString *)defaultName;


/**
 写入 double
 
 @param value 值
 @param defaultName key
 */
+ (void)setDouble:(double)value forKey:(NSString *)defaultName;
/**
 获取 double
 
 @param defaultName key
 @return double
 */
+ (double)doubleForKey:(NSString *)defaultName;


/**
 写入 BOOL
 
 @param value 值
 @param defaultName key
 */
+ (void)setBool:(BOOL)value forKey:(NSString *)defaultName;
/**
 获取 BOOL
 
 @param defaultName key
 @return BOOL
 */
+ (BOOL)boolForKey:(NSString *)defaultName;


/**
 获取字符串
 
 @param defaultName key
 @return 字符串
 */
+ (nullable NSString *)stringForKey:(NSString *)defaultName;


/**
 获取数组
 
 @param defaultName key
 @return 数组
 */
+ (nullable NSArray *)arrayForKey:(NSString *)defaultName;


/**
 获取字符串数组
 
 @param defaultName key
 @return 数组
 */
+ (nullable NSArray<NSString *> *)stringArrayForKey:(NSString *)defaultName;


/**
 获取字典
 
 @param defaultName key
 @return 字典
 */
+ (nullable NSDictionary<NSString *, id> *)dictionaryForKey:(NSString *)defaultName;


/**
 获取data
 
 @param defaultName key
 @return data
 */
+ (nullable NSData *)dataForKey:(NSString *)defaultName;


NS_ASSUME_NONNULL_END


@end
