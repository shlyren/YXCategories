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
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

/**
 *  判断字符串是否为空
 *
 *  @return boolean
 */
- (BOOL)isBlankString
{
    return self == nil || self == NULL || [self isKindOfClass:[NSNull class]] || self.stringByTrim.length == 0;
}

/**
 判断字符串是否为电话号码(移动,电信,联通)
 
 @return 是否合法
 */
- (BOOL)isPhoneNum
{
    
    NSString *str = self;
    
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
    NSString *str = self;
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


- (UIColor *)color
{
    //删除字符串中的空格
    NSString *cString = [[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6)
    {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"])
    {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"])
    {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6)
    {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((CGFloat)r / 255.0f) green:((CGFloat)g / 255.0f) blue:((CGFloat)b / 255.0f) alpha:1.0f];

}

- (NSArray *)arryWithEndDate:(NSString *)endDateStr;
{
    
    if (endDateStr.length < 6) return nil;
    
    // 获取连接符
    NSString *enDash = @"";
    if (endDateStr.length > 6)
        enDash = [endDateStr substringWithRange:NSMakeRange(4, endDateStr.length - 6)];
    
    /** 时间格式 */
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = [NSString stringWithFormat:@"yyyy%@MM", enDash];
    NSDateFormatter *yearFor = [NSDateFormatter new];
    yearFor.dateFormat = [NSString stringWithFormat:@"yyyy"];
    NSDateFormatter *monthFor = [NSDateFormatter new];
    monthFor.dateFormat = [NSString stringWithFormat:@"MM"];
    
    /** 截止的时间 */
    NSDate *endDate = [formatter dateFromString:endDateStr];
    if (endDate == nil) return nil;
    NSInteger endYear = [[yearFor stringFromDate:endDate] integerValue];;
    NSInteger endMonth = [[monthFor stringFromDate:endDate] integerValue];
    
    /** 当前的时间 */
    NSDate *currentDate = [NSDate date];
    NSInteger currentYear = [[yearFor stringFromDate:currentDate] integerValue];
    NSInteger currentMonth = [[monthFor stringFromDate:currentDate] integerValue];;
    
    NSInteger maxMonth = 0;
    NSInteger minMonth = 0;
    NSMutableArray *tmpArr = [NSMutableArray array];
    for (NSInteger resYear = currentYear; resYear >= endYear; resYear--)
    {
        maxMonth = resYear == currentYear ? currentMonth : 12;
        minMonth = resYear == endYear ? endMonth : 1;
        
        for (NSInteger resMonth = maxMonth; resMonth >= minMonth; resMonth--)
            [tmpArr addObject:[NSString stringWithFormat:@"%zd%@%02zd",resYear, enDash,resMonth]];
    }
    
    return tmpArr;
}

/**
 *  计算当前字符串显示所需的实际frame，返回值的x = 0, y = 0
 */
- (CGRect)textRectWithSize:(CGSize)size attributes:(NSDictionary *)attributes
{
    return [self boundingRectWithSize:size options:  NSStringDrawingUsesLineFragmentOrigin attributes: attributes context: nil];
}
@end
