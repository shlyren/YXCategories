//
//  NSObject+Extension.h
//  YXCategoriesDemo
//
//  Created by JiaQi on 2017/1/10.
//  Copyright © 2017年 任玉祥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Extension)

/**
 判断两个对象的大小
 @[[NSString class], [NSNumber class], [NSDate class], [NSDateInterval class], [NSIndexPath class], [NSDecimalNumber class]]
 @param obj 需要对比的对象
 @return 结果
 */
- (NSComparisonResult)compareWithObj:(id)obj;
@end
