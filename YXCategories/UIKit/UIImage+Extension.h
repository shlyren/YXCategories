//
//  UIImage+Extension.h
//  YXCategoriesDemo
//
//  Created by 任玉祥 on 2016/11/3.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

/**
 *  图片拉伸
 *
 *  @param imageName 图片名
 */
+ (UIImage *)resizingImageWithImageName:(NSString *)imageName;

/**
 *  图片拉伸
 */
- (UIImage *)resizingImage;

/**
 根据颜色生成一张尺寸为1*1的相同颜色图片
 
 @param color 颜色
 
 @return 图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 *  生成带边框的圆形图片
 *
 *  @param borderW 边框宽度
 *  @param color   边框颜色
 *  @param image   图片
 *
 *  @return 新的图片对象
 */
+ (UIImage *)imageWithBorderW:(CGFloat)borderW color:(UIColor *)color image:(UIImage *)image;


/**
 *  生成带边框的圆形图片
 *
 *  @return 新的图片对象
 */
- (UIImage *)imageWithBorderW:(CGFloat)borderW color:(UIColor *)color;

/**
 *  给定一个不要渲染的图片名称,生成一个最原始的图片
 *
 *  @param imageName 图片名称
 *
 *  @return 新的图片
 */
+ (UIImage *)imageWithOriginalImageName:(NSString *)imageName;

/**
 生成原始图片
 
 @return 新的图片
 */
- (UIImage *)originalImage;

/**
 图片压缩
 
 @param targetWidth 目标宽度 scale = 1.0
 
 @return 压缩后的图片
 */
- (UIImage *)compressImageToTargetWidth:(CGFloat)targetWidth;

/**
 *  根据一张图片返回一个裁剪后的image
 */
- (UIImage *)circleImage;
@end
