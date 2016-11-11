//
//  NSBundle+Extension.h
//  驴宝宝
//
//  Created by 任玉祥 on 2016/11/9.
//  Copyright © 2016年 JiaQi Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSBundle (Extension)

/**
 加载 mainBundle 文件

 @param fileName 文件名
 @return 文件
 */
+ (id)loadFileName:(NSString *)fileName;

/**
 加载 mainBundle 字典
 
 @param fileName 文件名
 @return 字典
 */
+ (NSDictionary *)loadDictFileName:(NSString *)fileName;

/**
 加载 mainBundle 数组
 
 @param fileName 文件名
 @return 数组
 */
+ (NSArray *)loadArrayFileName:(NSString *)fileName;
@end
