//
//  UIDevice+Extension.m
//  YXCategoriesDemo
//
//  Created by JiaQi on 2016/11/11.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import "UIDevice+Extension.h"

@implementation UIDevice (Extension)
+ (NSString *)UUID
{
    return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
}
@end
