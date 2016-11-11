//
//  NSBundle+Extension.h
//  驴宝宝
//
//  Created by 任玉祥 on 2016/11/9.
//  Copyright © 2016年 JiaQi Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSBundle (Extension)
/** bundleIdentifier */
@property (nonatomic, class, strong, readonly) NSString *bundleIdentifier;
/** app版本号 */
@property (class, nonatomic, strong, readonly) NSString *shortVersionString;
/** 内建版本号 */
@property (class, nonatomic, strong, readonly) NSString *bundleVersion;

/**
 加载 mainBundle 文件

 @param fileName 文件名 .json
 @return 文件
 */
+ (id)loadFileName:(NSString *)fileName;

/**
 加载 mainBundle 字典
 
 @param fileName 文件名 .json
 @return 字典
 */
+ (NSDictionary *)loadDictFileName:(NSString *)fileName;

/**
 加载 mainBundle 数组
 
 @param fileName 文件名 .json
 @return 数组
 */
+ (NSArray *)loadArrayFileName:(NSString *)fileName;
@end
