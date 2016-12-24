//
//  NSNotificationCenter+Extension.h
//  YXCategoriesDemo
//
//  Created by 任玉祥 on 2016/11/10.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSNotificationCenter (Extension)

/**
 发送通知
 
 @param notification 通知对象
 */
+ (void)postNotification:(NSNotification *)notification;

/**
 发送通知
 
 @param aName 通知名
 @param anObject 发送对象
 */
+ (void)postNotificationName:(NSNotificationName)aName object:(nullable id)anObject;


/**
 发送通知
 
 @param aName 通知名
 @param anObject 对象
 @param userInfo 参数
 */
+ (void)postNotificationName:(NSNotificationName)aName object:(nullable id)anObject userInfo:(nullable NSDictionary *)userInfo;


/**
 移除通知
 
 @param observer 监听者
 */
+ (void)removeObserver:(id)observer;


/**
 移除通知
 
 @param observer 监听着
 @param aName 通知名
 @param anObject 发布者
 */
+ (void)removeObserver:(id)observer name:(nullable NSNotificationName)aName object:(nullable id)anObject;


/**
 监听通知
 
 @param observer 监听着
 @param aSelector 回调
 @param aName 通知名
 @param anObject 发布者
 */
+ (void)addObserver:(id)observer selector:(SEL)aSelector name:(nullable NSNotificationName)aName object:(nullable id)anObject;

@end
NS_ASSUME_NONNULL_END
