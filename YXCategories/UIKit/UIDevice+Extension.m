//
//  UIDevice+Extension.m
//  YXCategoriesDemo
//
//  Created by JiaQi on 2016/11/11.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import "UIDevice+Extension.h"
#import <sys/types.h>
#import <sys/sysctl.h>

@implementation UIDevice (Extension)
+ (NSString *)UUID
{
    return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
}

+ (UIDeviceMode)deviceMode
{
    int mib[2];
    size_t len;
    char *machine;
    
    mib[0] = CTL_HW;
    mib[1] = HW_MACHINE;
    sysctl(mib, 2, NULL, &len, NULL, 0);
    machine = malloc(len);
    sysctl(mib, 2, machine, &len, NULL, 0);
    
    NSString *platform = [NSString stringWithCString:machine encoding:NSASCIIStringEncoding];
    free(machine);
    // iPhone
    if ([platform isEqualToString:@"iPhone1,1"]) return iPhone2G;
    if ([platform isEqualToString:@"iPhone1,2"]) return iPhone3G;
    if ([platform isEqualToString:@"iPhone2,1"]) return iPhone3GS;
    if ([platform isEqualToString:@"iPhone3,1"]) return iPhone4;
    if ([platform isEqualToString:@"iPhone3,2"]) return iPhone4;
    if ([platform isEqualToString:@"iPhone3,3"]) return iPhone4;
    if ([platform isEqualToString:@"iPhone4,1"]) return iPhone4s;
    if ([platform isEqualToString:@"iPhone5,1"]) return iPhone5;
    if ([platform isEqualToString:@"iPhone5,2"]) return iPhone5;
    if ([platform isEqualToString:@"iPhone5,3"]) return iPhone5c;
    if ([platform isEqualToString:@"iPhone5,4"]) return iPhone5c;
    if ([platform isEqualToString:@"iPhone6,1"]) return iPhone5s;
    if ([platform isEqualToString:@"iPhone6,2"]) return iPhone5s;
    if ([platform isEqualToString:@"iPhone7,2"]) return iPhone6;
    if ([platform isEqualToString:@"iPhone7,1"]) return iPhone6Plus;
    if ([platform isEqualToString:@"iPhone8,1"]) return iPhone6s;
    if ([platform isEqualToString:@"iPhone8,2"]) return iPhone6sPlus;
    if ([platform isEqualToString:@"iPhone8,3"]) return iPhoneSE;
    if ([platform isEqualToString:@"iPhone8,4"]) return iPhoneSE;
    if ([platform isEqualToString:@"iPhone9,1"]) return iPhone7;
    if ([platform isEqualToString:@"iPhone9,2"]) return iPhone7Plus;
    
    //iPod Touch
    if ([platform isEqualToString:@"iPod1,1"])   return iPodTouch;
    if ([platform isEqualToString:@"iPod2,1"])   return iPodTouch2G;
    if ([platform isEqualToString:@"iPod3,1"])   return iPodTouch3G;
    if ([platform isEqualToString:@"iPod4,1"])   return iPodTouch4G;
    if ([platform isEqualToString:@"iPod5,1"])   return iPodTouch5G;
    if ([platform isEqualToString:@"iPod7,1"])   return iPodTouch6G;
    
    //iPad
    if ([platform isEqualToString:@"iPad1,1"])   return iPad;
    if ([platform isEqualToString:@"iPad2,1"])   return iPad2;
    if ([platform isEqualToString:@"iPad2,2"])   return iPad2;
    if ([platform isEqualToString:@"iPad2,3"])   return iPad2;
    if ([platform isEqualToString:@"iPad2,4"])   return iPad2;
    if ([platform isEqualToString:@"iPad3,1"])   return iPad3;
    if ([platform isEqualToString:@"iPad3,2"])   return iPad3;
    if ([platform isEqualToString:@"iPad3,3"])   return iPad3;
    if ([platform isEqualToString:@"iPad3,4"])   return iPad4;
    if ([platform isEqualToString:@"iPad3,5"])   return iPad4;
    if ([platform isEqualToString:@"iPad3,6"])   return iPad4;
    
    //iPad Air
    if ([platform isEqualToString:@"iPad4,1"])   return iPadAir;
    if ([platform isEqualToString:@"iPad4,2"])   return iPadAir;
    if ([platform isEqualToString:@"iPad4,3"])   return iPadAir;
    if ([platform isEqualToString:@"iPad5,3"])   return iPadAir2;
    if ([platform isEqualToString:@"iPad5,4"])   return iPadAir2;
    
    //iPad mini
    if ([platform isEqualToString:@"iPad2,5"])   return iPadmini;
    if ([platform isEqualToString:@"iPad2,6"])   return iPadmini;
    if ([platform isEqualToString:@"iPad2,7"])   return iPadmini;
    if ([platform isEqualToString:@"iPad4,4"])   return iPadmini2;
    if ([platform isEqualToString:@"iPad4,5"])   return iPadmini2;
    if ([platform isEqualToString:@"iPad4,6"])   return iPadmini2;
    if ([platform isEqualToString:@"iPad4,7"])   return iPadmini3;
    if ([platform isEqualToString:@"iPad4,8"])   return iPadmini3;
    if ([platform isEqualToString:@"iPad4,9"])   return iPadmini3;
    if ([platform isEqualToString:@"iPad5,1"])   return iPadmini4;
    if ([platform isEqualToString:@"iPad5,2"])   return iPadmini4;
    
    if ([platform isEqualToString:@"i386"])      return Simulator;
    if ([platform isEqualToString:@"x86_64"])    return Simulator;
    
    return unknow;
}

+ (NSString *)deviceModeString
{
    
    switch ([self deviceMode])
    {
        case iPhone2G:  	return @"iPhone2G";
        case iPhone3G:      return @"iPhone3G";
        case iPhone3GS:     return @"iPhone3GS";
        case iPhone4:       return @"iPhone4";
        case iPhone4s:      return @"iPhone4s";
        case iPhone5:       return @"iPhone5";
        case iPhone5c:      return @"iPhone5c";
        case iPhone5s:      return @"iPhone5s";
        case iPhone6:       return @"iPhone6";
        case iPhone6Plus:   return @"iPhone6Plus";
        case iPhoneSE:      return @"iPhoneSE";
        case iPhone6s:      return @"iPhone6s";
        case iPhone6sPlus:  return @"iPhone6sPlus";
        case iPhone7:       return @"iPhone7";
        case iPhone7Plus:   return @"iPhone7Plus";
            
        case iPodTouch:     return @"iPodTouch";
        case iPodTouch2G:   return @"iPodTouch2G";
        case iPodTouch3G:   return @"iPodTouch3G";
        case iPodTouch4G:   return @"iPodTouch4G";
        case iPodTouch5G:   return @"iPodTouch5G";
        case iPodTouch6G:   return @"iPodTouch6G";
            
        case iPad:          return @"iPad";
        case iPad2:         return @"iPad2";
        case iPad3:         return @"iPad3";
        case iPad4:         return @"iPad4";
        case iPad5:         return @"iPad5";
        case iPad6:         return @"iPad6";
            
        case iPadAir:       return @"iPadAir";
        case iPadAir2:      return @"iPadAir2";
        case iPadmini:      return @"iPadmini";
        case iPadmini2:     return @"iPadmini2";
        case iPadmini3:     return @"iPadmini3";
        case iPadmini4:     return @"iPadmini4";
            
        case Simulator: return @"Simulator";
        default: return @"未知";
    }
    
    
//    int mib[2];
//    size_t len;
//    char *machine;
//    
//    mib[0] = CTL_HW;
//    mib[1] = HW_MACHINE;
//    sysctl(mib, 2, NULL, &len, NULL, 0);
//    machine = malloc(len);
//    sysctl(mib, 2, machine, &len, NULL, 0);
//    
//    NSString *platform = [NSString stringWithCString:machine encoding:NSASCIIStringEncoding];
//    free(machine);
//    // iPhone
//    if ([platform isEqualToString:@"iPhone1,1"]) {
//        YXCurrentMode = iPhone2G;
//        return @"iPhone2G";
//    }
//    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone3G";
//    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone3GS";
//    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone4";
//    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone4";
//    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone4";
//    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone4s";
//    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone5";
//    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone5";
//    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone5c";
//    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone5c";
//    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone5s";
//    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone5s";
//    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone6";
//    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone6Plus";
//    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone6s";
//    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone6sPlus";
//    if ([platform isEqualToString:@"iPhone8,3"]) return @"iPhoneSE";
//    if ([platform isEqualToString:@"iPhone8,4"]) return @"iPhoneSE";
//    if ([platform isEqualToString:@"iPhone9,1"]) return @"iPhone7";
//    if ([platform isEqualToString:@"iPhone9,2"]) return @"iPhone7Plus";
//    
//    //iPod Touch
//    if ([platform isEqualToString:@"iPod1,1"])   return @"iPodTouch";
//    if ([platform isEqualToString:@"iPod2,1"])   return @"iPodTouch2G";
//    if ([platform isEqualToString:@"iPod3,1"])   return @"iPodTouch3G";
//    if ([platform isEqualToString:@"iPod4,1"])   return @"iPodTouch4G";
//    if ([platform isEqualToString:@"iPod5,1"])   return @"iPodTouch5G";
//    if ([platform isEqualToString:@"iPod7,1"])   return @"iPodTouch6G";
//    
//    //iPad
//    if ([platform isEqualToString:@"iPad1,1"])   return @"iPad";
//    if ([platform isEqualToString:@"iPad2,1"])   return @"iPad2";
//    if ([platform isEqualToString:@"iPad2,2"])   return @"iPad2";
//    if ([platform isEqualToString:@"iPad2,3"])   return @"iPad2";
//    if ([platform isEqualToString:@"iPad2,4"])   return @"iPad2";
//    if ([platform isEqualToString:@"iPad3,1"])   return @"iPad3";
//    if ([platform isEqualToString:@"iPad3,2"])   return @"iPad3";
//    if ([platform isEqualToString:@"iPad3,3"])   return @"iPad3";
//    if ([platform isEqualToString:@"iPad3,4"])   return @"iPad4";
//    if ([platform isEqualToString:@"iPad3,5"])   return @"iPad4";
//    if ([platform isEqualToString:@"iPad3,6"])   return @"iPad4";
//    
//    //iPad Air
//    if ([platform isEqualToString:@"iPad4,1"])   return @"iPadAir";
//    if ([platform isEqualToString:@"iPad4,2"])   return @"iPadAir";
//    if ([platform isEqualToString:@"iPad4,3"])   return @"iPadAir";
//    if ([platform isEqualToString:@"iPad5,3"])   return @"iPadAir2";
//    if ([platform isEqualToString:@"iPad5,4"])   return @"iPadAir2";
//    
//    //iPad mini
//    if ([platform isEqualToString:@"iPad2,5"])   return @"iPadmini1G";
//    if ([platform isEqualToString:@"iPad2,6"])   return @"iPadmini1G";
//    if ([platform isEqualToString:@"iPad2,7"])   return @"iPadmini1G";
//    if ([platform isEqualToString:@"iPad4,4"])   return @"iPadmini2";
//    if ([platform isEqualToString:@"iPad4,5"])   return @"iPadmini2";
//    if ([platform isEqualToString:@"iPad4,6"])   return @"iPadmini2";
//    if ([platform isEqualToString:@"iPad4,7"])   return @"iPadmini3";
//    if ([platform isEqualToString:@"iPad4,8"])   return @"iPadmini3";
//    if ([platform isEqualToString:@"iPad4,9"])   return @"iPadmini3";
//    if ([platform isEqualToString:@"iPad5,1"])   return @"iPadmini4";
//    if ([platform isEqualToString:@"iPad5,2"])   return @"iPadmini4";
//    
//    if ([platform isEqualToString:@"i386"])      return @"iPhoneSimulator";
//    if ([platform isEqualToString:@"x86_64"])    return @"iPhoneSimulator";
//    return platform;
}

+ (BOOL)belongTo:(UIDeviceMode)deviceMode
{
    return [UIDevice deviceMode] & deviceMode;
}
@end
