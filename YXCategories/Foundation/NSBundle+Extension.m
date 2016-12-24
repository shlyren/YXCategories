//
//  NSBundle+Extension.m
//   
//
//  Created by 任玉祥 on 2016/11/9.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import "NSBundle+Extension.h"

@implementation NSBundle (Extension)

+ (NSString *)bundleIdentifier
{
    return [NSBundle mainBundle].infoDictionary[@"CFBundleIdentifier"];
}

+ (NSString *)shortVersionString
{
    return [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
}

+ (NSString *)bundleVersion
{
    return [NSBundle mainBundle].infoDictionary[@"CFBundleVersion"];
}

+ (id)objectWithJson:(NSString *)fileName
{
    
    NSData *data = [NSData dataWithContentsOfFile:[[self mainBundle] pathForResource:fileName ofType:@"json"]];
    return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
}


+ (NSDictionary *)dictWithJson:(NSString *)fileName
{
    if ([[self objectWithJson:fileName] isKindOfClass:[NSDictionary class]]) {
        return [self objectWithJson:fileName];
    }
    return nil;
}

+ (NSArray *)arrayWithJson:(NSString *)fileName
{
    if ([[self objectWithJson:fileName] isKindOfClass:[NSArray class]]) {
        return [self objectWithJson:fileName];
    }
    return nil;
}




/**
 加载 mainBundle 字典
 
 @param fileName 文件名
 @return 字典
 */
+ (NSDictionary *)dictWithPlist:(NSString *)fileName
{
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];
    return [NSDictionary dictionaryWithContentsOfFile:path];
}

/**
 加载 mainBundle 数组
 
 @param fileName 文件名
 @return 数组
 */
+ (NSArray *)arrayWithPlist:(NSString *)fileName
{
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];
    return [NSArray arrayWithContentsOfFile:path];
}
@end
