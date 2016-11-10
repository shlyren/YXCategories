//
//  NSString+Extension.m
//  YXCategoriesDemo
//
//  Created by 任玉祥 on 2016/11/3.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import "NSString+Extension.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Extension)
/**
 时间戳 -> yyy-MM-dd HH:mm
 */
- (NSString *)formatDate
{
    // 时间格式
    NSInteger linux = self.integerValue;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:linux / 1000];
    NSDateFormatter *dataFormatter = [[NSDateFormatter alloc]init];
    [dataFormatter setDateFormat: @"yyyy-MM-dd HH:mm"];
    // 配置区域
    NSLocale *local1 = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    [dataFormatter setLocale:local1];
    NSString *dataTime = [dataFormatter stringFromDate:date];
    return dataTime;
}

/**
 去掉空
 
 @return str
 */
- (NSString *)stringByTrim
{
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    return [self stringByTrimmingCharactersInSet:set];
}

/**
 *  判断字符串是否为空
 *
 *  @return boolean
 */
- (BOOL)isBlankString
{
    if (self == nil || self == NULL) {
        return YES;
    }
    if ([self isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

/**
 判断字符串是否为电话号码(移动,电信,联通)
 
 @return 是否合法
 */
- (BOOL)isPhoneNum
{
    
    NSString *str = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    if (str.length != 11) return false;
    
    NSString *regex = @"^((13[0-9])|(147)|(15[^4,\\D])|(18[0-9])|(17[0-9]))\\d{8}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    BOOL isMatch = [pred evaluateWithObject:str];
    return isMatch;
    
    //    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    //    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    //    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    //    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    //    NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    //
    //    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    //    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    //    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    //    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    //    BOOL res1 = [regextestmobile evaluateWithObject:str];
    //    BOOL res2 = [regextestcm evaluateWithObject:str];
    //    BOOL res3 = [regextestcu evaluateWithObject:str];
    //    BOOL res4 = [regextestct evaluateWithObject:str];
    //
    //    return (res1 || res2 || res3 || res4);
}

/**
  验证金额是否合法 支持0 0.0 0.00 两位小数
 
 @return 是否合法
 */
- (BOOL)isMoney
{
    NSString *str = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (!str.length) return true;
    
    NSString *regex = @"^(([0-9]|([1-9][0-9]{0,9}))((\\.[0-9]{0,2})?))$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:str];
    return isMatch;
}


/**
 获取今年的字符串
 
 @return 今年字符串
 */
+ (NSString *)currentYear
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"yyyy"];
    return [formatter stringFromDate:[NSDate date]];
}

/**
 获取当前时间戳
 
 @return 当前的时间戳
 */
+ (long)UnixTime
{
    return [[NSDate date] timeIntervalSince1970] * 1000;
}

/**
 md5 加密
 
 @return 加密后的字符串
 */
- (NSString *)md5
{
    const void *cStr = [self UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    //    CC_LONG x = (CC_LONG)strlen(cStr);
    CC_MD5(cStr, (CC_LONG)strlen(cStr), digest); // This is the md5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return output;
}

/**
 *  计算当前字符串显示所需的实际frame，返回值的x = 0, y = 0
 */
- (CGRect)textRectWithSize:(CGSize)size attributes:(NSDictionary *)attributes{
    return [self boundingRectWithSize:size options:  NSStringDrawingUsesLineFragmentOrigin attributes: attributes context: nil];
}
@end
