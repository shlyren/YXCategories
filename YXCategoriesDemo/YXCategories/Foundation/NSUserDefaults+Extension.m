//
//  NSUserDefaults+Extension.m
//  YXCategoriesDemo
//
//  Created by 任玉祥 on 2016/11/3.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import "NSUserDefaults+Extension.h"

@implementation NSUserDefaults (Extension)

NS_ASSUME_NONNULL_BEGIN
/**
 写入一个对象
 
 @param value 对象
 @param defaultName key
 */
+ (void)setObject:(id)value forKey:(NSString *)defaultName
{
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:defaultName];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
/**
 获取对象
 
 @param defaultName key
 @return 对象
 */
+ (nullable id)objectForKey:(NSString *)defaultName
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:defaultName];
}
/**
 移除对象
 
 @param defaultName key
 */
+ (void)removeObjectForKey:(NSString *)defaultName
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:defaultName];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

/**
 写入 NSInteger
 
 @param value 值
 @param defaultName key
 */
+ (void)setInteger:(NSInteger)value forKey:(NSString *)defaultName
{
    [[NSUserDefaults standardUserDefaults] setInteger:value forKey:defaultName];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
/**
 获取 NSInteger
 
 @param defaultName key
 @return NSInteger
 */
+ (NSInteger)integerForKey:(NSString *)defaultName
{
    return [[NSUserDefaults standardUserDefaults] integerForKey:defaultName];
}

/**
 写入 float
 
 @param value 值
 @param defaultName key
 */
+ (void)setFloat:(float)value forKey:(NSString *)defaultName
{
    [[NSUserDefaults standardUserDefaults] setFloat:false forKey:defaultName];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
/**
 获取 float
 
 @param defaultName key
 @return float
 */
+ (float)floatForKey:(NSString *)defaultName
{
    return [[NSUserDefaults standardUserDefaults] floatForKey:defaultName];
}

/**
 写入 double
 
 @param value 值
 @param defaultName key
 */
+ (void)setDouble:(double)value forKey:(NSString *)defaultName
{
    [[NSUserDefaults standardUserDefaults] setDouble:value forKey:defaultName];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

/**
 获取 double
 
 @param defaultName key
 @return double
 */
+ (double)doubleForKey:(NSString *)defaultName
{
    return [[NSUserDefaults standardUserDefaults] doubleForKey:defaultName];
}

/**
 写入 BOOL
 
 @param value 值
 @param defaultName key
 */
+ (void)setBool:(BOOL)value forKey:(NSString *)defaultName
{
    [[NSUserDefaults standardUserDefaults] setBool:value forKey:defaultName];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
/**
 获取 BOOL

 @param defaultName key
 @return BOOL
*/
+ (BOOL)boolForKey:(NSString *)defaultName
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:defaultName];
}


+ (nullable NSString *)stringForKey:(NSString *)defaultName
{
    return [[NSUserDefaults standardUserDefaults] stringForKey:defaultName];
}

+ (nullable NSArray<NSString *> *)stringArrayForKey:(NSString *)defaultName
{
    return [[NSUserDefaults standardUserDefaults] stringArrayForKey:defaultName];
}

+ (nullable NSArray *)arrayForKey:(NSString *)defaultName
{
    return [[NSUserDefaults standardUserDefaults] arrayForKey:defaultName];
}

+ (nullable NSDictionary<NSString *, id> *)dictionaryForKey:(NSString *)defaultName
{
    return [[NSUserDefaults standardUserDefaults] dictionaryForKey:defaultName];
}

+ (nullable NSData *)dataForKey:(NSString *)defaultName
{
    return [[NSUserDefaults standardUserDefaults] dataForKey:defaultName];
}
NS_ASSUME_NONNULL_END

@end
