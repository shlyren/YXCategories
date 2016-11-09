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

+ (void)setObject:(id)value forKey:(NSString *)defaultName;
+ (nullable id)objectForKey:(NSString *)defaultName;


+ (void)removeObjectForKey:(NSString *)defaultName;


+ (void)setInteger:(NSInteger)value forKey:(NSString *)defaultName;
+ (NSInteger)integerForKey:(NSString *)defaultName;

+ (void)setFloat:(float)value forKey:(NSString *)defaultName;
+ (float)floatForKey:(NSString *)defaultName;

+ (void)setDouble:(double)value forKey:(NSString *)defaultName;
+ (double)doubleForKey:(NSString *)defaultName;

+ (void)setBool:(BOOL)value forKey:(NSString *)defaultName;
+ (BOOL)boolForKey:(NSString *)defaultName;

NS_ASSUME_NONNULL_END








@end
