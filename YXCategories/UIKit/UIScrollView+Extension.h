//
//  UIScrollView+Extension.h
//  YXCategoriesDemo
//
//  Created by 任玉祥 on 2016/11/3.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (Extension)

@property (assign, nonatomic) CGFloat insetT;
@property (assign, nonatomic) CGFloat insetB;
@property (assign, nonatomic) CGFloat insetL;
@property (assign, nonatomic) CGFloat insetR;

@property (assign, nonatomic) CGFloat offsetX;
@property (assign, nonatomic) CGFloat offsetY;

@property (assign, nonatomic) CGFloat contentW;
@property (assign, nonatomic) CGFloat contentH;

@end
