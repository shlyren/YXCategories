//
//  NSObject+Extension.m
//  YXCategoriesDemo
//
//  Created by JiaQi on 2017/1/10.
//  Copyright © 2017年 任玉祥. All rights reserved.
//

#import "NSObject+Extension.h"

@implementation NSObject (Extension)
- (NSComparisonResult)compareWithObj:(id)obj
{
//    
//    NSArray *classArr = @[[NSString class], [NSNumber class], [NSDate class], [NSDateInterval class], [NSIndexPath class], [NSDecimalNumber class]];
    
     NSAssert2([self isKindOfClass:[obj class]], @"%@ isNotKindOfClass %@", NSStringFromClass([obj class]), NSStringFromClass([self class]));
    
    if ([self isKindOfClass:[NSString class]] && [obj isKindOfClass:[NSString class]]) {
        return [(NSString *)self compare:(NSString *)obj];
    }else if ([self isKindOfClass:[NSNumber class]] && [obj isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)self compare:(NSNumber *)obj];
    }else if ([self isKindOfClass:[NSDate class]] && [obj isKindOfClass:[NSDate class]]) {
        return [(NSDate *)self compare:(NSDate *)obj];
    }else if ([self isKindOfClass:[NSDateInterval class]] && [obj isKindOfClass:[NSDateInterval class]]) {
        return [(NSDateInterval *)self compare:(NSDateInterval *)obj];
    }else if ([self isKindOfClass:[NSIndexPath class]] && [obj isKindOfClass:[NSIndexPath class]]) {
        return [(NSIndexPath *)self compare:(NSIndexPath *)obj];
    }
    
    NSAssert(0, @"%@ is not support compareWithObj", NSStringFromClass([self class]));
    
    return NSOrderedSame;
}
@end
