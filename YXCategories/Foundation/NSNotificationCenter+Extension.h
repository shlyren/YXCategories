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
+ (void)postNotification:(NSNotification *)notification;
+ (void)postNotificationName:(NSNotificationName)aName object:(nullable id)anObject;
+ (void)postNotificationName:(NSNotificationName)aName object:(nullable id)anObject userInfo:(nullable NSDictionary *)aUserInfo;

+ (void)removeObserver:(id)observer;
+ (void)removeObserver:(id)observer name:(nullable NSNotificationName)aName object:(nullable id)anObject;

+ (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSNotificationName)aName object:(id)anObject;

@end
NS_ASSUME_NONNULL_END
