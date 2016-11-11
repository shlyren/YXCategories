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
/**
 发送通知
 
 @param notification 通知对象
 */
+ (void)postNotification:(NSNotification *)notification
{
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}
/**
 发送通知
 
 @param aName 通知名
 @param anObject 发送对象
 */
+ (void)postNotificationName:(NSNotificationName)aName object:(nullable id)anObject
{
    [[NSNotificationCenter defaultCenter] postNotificationName:aName object:anObject];
}

/**
 发送通知
 
 @param aName 通知名
 @param anObject 对象
 @param userInfo 通知内容
 */
+ (void)postNotificationName:(NSNotificationName)aName object:(nullable id)anObject userInfo:(nullable NSDictionary *)userInfo
{
    [[NSNotificationCenter defaultCenter] postNotificationName:aName object:anObject userInfo:userInfo];
}

/**
 移除通知
 
 @param observer 监听者
 */
+ (void)removeObserver:(id)observer
{
    [[NSNotificationCenter defaultCenter] removeObserver:observer];
}

/**
 移除通知
 
 @param observer 监听着
 @param aName 通知名
 @param anObject 发布者
 */
+ (void)removeObserver:(id)observer name:(nullable NSNotificationName)aName object:(nullable id)anObject
{
    [[NSNotificationCenter defaultCenter] removeObserver:observer name:aName object:anObject];
}

/**
 监听通知
 
 @param observer 监听着
 @param aSelector 回调
 @param aName 通知名
 @param anObject 发布者
 */
+ (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSNotificationName)aName object:(id)anObject
{
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:aSelector name:aName object:anObject];
}

NS_ASSUME_NONNULL_END

@end
