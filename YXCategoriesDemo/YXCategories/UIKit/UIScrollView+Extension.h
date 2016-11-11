//
//  UIScrollView+Extension.h
//  YXCategoriesDemo
//
//  Created by 任玉祥 on 2016/11/3.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (Extension)
/** 顶部内边距 */
@property (assign, nonatomic) CGFloat insetT;
/** 底部内边距 */
@property (assign, nonatomic) CGFloat insetB;
/** 左边内边距 */
@property (assign, nonatomic) CGFloat insetL;
/** 右边内边距 */
@property (assign, nonatomic) CGFloat insetR;

/** x偏移量 */
@property (assign, nonatomic) CGFloat offsetX;
/** y偏移量 */
@property (assign, nonatomic) CGFloat offsetY;

/** 内容宽度 */
@property (assign, nonatomic) CGFloat contentW;
/** 内容高度 */
@property (assign, nonatomic) CGFloat contentH;

@end
