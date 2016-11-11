//
//  NSBundle+Extension.m
//  驴宝宝
//
//  Created by 任玉祥 on 2016/11/9.
//  Copyright © 2016年 JiaQi Inc. All rights reserved.
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

+ (id)loadFileName:(NSString *)fileName
{
    NSData *data = [NSData dataWithContentsOfFile:[[self mainBundle] pathForResource:fileName ofType:nil]];
    return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
}


+ (NSDictionary *)loadDictFileName:(NSString *)fileName
{
    if ([[self loadFileName:fileName] isKindOfClass:[NSDictionary class]]) {
        return [self loadFileName:fileName];
    }
    return nil;
}

+ (NSArray *)loadArrayFileName:(NSString *)fileName
{
    if ([[self loadFileName:fileName] isKindOfClass:[NSArray class]]) {
        return [self loadFileName:fileName];
    }
    return nil;
}
@end
