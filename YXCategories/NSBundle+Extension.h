//
//  NSBundle+Extension.h
//  驴宝宝
//
//  Created by 任玉祥 on 2016/11/9.
//  Copyright © 2016年 JiaQi Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSBundle (Extension)
+ (id)loadFileName:(NSString *)fileName;
+ (NSDictionary *)loadDictFileName:(NSString *)fileName;
+ (NSArray *)loadArrayFileName:(NSString *)fileName;
@end
