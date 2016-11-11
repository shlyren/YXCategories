//
//  NSNotificationCenter+Extension.m
//  YXCategoriesDemo
//
//  Created by 任玉祥 on 2016/11/10.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import "NSNotificationCenter+Extension.h"

NS_ASSUME_NONNULL_BEGIN
@implementation NSNotificationCenter (Extension)

+ (void)postNotification:(NSNotification *)notification
{
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}
+ (void)postNotificationName:(NSNotificationName)aName object:(nullable id)anObject
{
    [[NSNotificationCenter defaultCenter] postNotificationName:aName object:anObject];
}
+ (void)postNotificationName:(NSNotificationName)aName object:(nullable id)anObject userInfo:(nullable NSDictionary *)aUserInfo
{
    [[NSNotificationCenter defaultCenter] postNotificationName:aName object:anObject userInfo:aUserInfo];
}

+ (void)removeObserver:(id)observer
{
    [[NSNotificationCenter defaultCenter] removeObserver:observer];
}
+ (void)removeObserver:(id)observer name:(nullable NSNotificationName)aName object:(nullable id)anObject
{
    [[NSNotificationCenter defaultCenter] removeObserver:observer name:aName object:anObject];
}
+ (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSNotificationName)aName object:(id)anObject
{
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:aSelector name:aName object:anObject];
}

NS_ASSUME_NONNULL_END

@end
