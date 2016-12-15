//
//  UIDevice+Extension.h
//  YXCategoriesDemo
//
//  Created by JiaQi on 2016/11/11.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import <UIKit/UIKit.h>


//UIViewAnimationOptions;
typedef NS_OPTIONS(NSInteger ,UIDeviceMode) {
    unknow          = 0,
    
    iPhone2G        = 1 << 0,
    iPhone3G        = 2 << 1,
    iPhone3GS       = 3 << 2,
    iPhone4         = 4 << 3,
    iPhone4s        = 5 << 4,
    iPhone5         = 6 << 5,
    iPhone5s        = 7 << 6,
    iPhone5c        = 8 << 7,
    iPhone6         = 9 << 8,
    iPhone6Plus     = 10 << 9,
    iPhone6s        = 11 << 10,
    iPhone6sPlus    = 12 << 11,
    iPhoneSE        = 13 << 12,
    iPhone7         = 14 << 13,
    iPhone7Plus     = 15 << 14,
    
    iPodTouch       = 1 << 20,
    iPodTouch2G     = 2 << 20,
    iPodTouch3G     = 3 << 20,
    iPodTouch4G     = 4 << 20,
    iPodTouch5G     = 5 << 20,
    iPodTouch6G     = 6 << 20,
    
    iPad            = 1 << 24,
    iPad2           = 2 << 24,
    iPad3           = 3 << 24,
    iPad4           = 4 << 24,
    iPad5           = 5 << 24,
    iPad6           = 6 << 24,
    iPadAir         = 7 << 24,
    iPadAir2        = 8 << 24,
    iPadmini        = 9 << 24,
    iPadmini2       = 10 << 24,
    iPadmini3       = 11 << 24,
    iPadmini4       = 12 << 24,
    
    Simulator       = 1 << 30,
    
};
@interface UIDevice (Extension)
/** UUID */
@property (class, nonatomic, readonly) NSString *UUID;
/** 当前设备类型, 枚举 */
@property (class, nonatomic, readonly, assign) UIDeviceMode deviceMode;
/** 当前设备的字符串 */
@property (nonatomic, class, readonly) NSString *deviceModeString;


/**
 判断当前的设备是否在 `deviceMode` 的枚举中

 @param deviceMode 包含的设备枚举
 @return bool值
 */
+ (BOOL)belongTo:(UIDeviceMode)deviceMode;
@end
