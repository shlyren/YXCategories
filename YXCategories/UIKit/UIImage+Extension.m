//
//  UIImage+Extension.m
//  YXCategoriesDemo
//
//  Created by 任玉祥 on 2016/11/3.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

/**
 *  图片拉伸
 *
 *  @param imageName 图片名
 */
+ (UIImage *)resizingImageWithImageName:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed: imageName];
    image = [image resizableImageWithCapInsets: UIEdgeInsetsMake(image.size.height * 0.5, image.size.width * 0.5, image.size.height * 0.5 - 1,  image.size.width * 0.5 - 1)];
    
    return image;
}

/**
 *  图片拉伸
 */
- (UIImage *)resizingImage
{
    return [self resizableImageWithCapInsets:UIEdgeInsetsMake(self.size.height * 0.5, self.size.width * 0.5, self.size.height * 0.5 - 1, self.size.width * 0.5 - 1)];
}

// 根据颜色生成一张尺寸为1*1的相同颜色图片
+ (UIImage *)imageWithColor:(UIColor *)color
{
    // 描述矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    // 渲染上下文
    CGContextFillRect(context, rect);
    // 从上下文中获取图片
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return theImage;
}

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
{
    
    CGSize imageSize = CGSizeMake(image.size.width + 2 * borderW, image.size.height + 2 * borderW);
    
    // 1、开启上下文
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, YES);
    
    // 2、绘制一个大圆
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(0, 0, imageSize.width, imageSize.height)];
    
    [color set];
    // 3、填充
    [path fill];
    
    // 4、设置裁剪路径
    path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(borderW, borderW, image.size.width, image.size.height)];
    
    // 5、裁剪
    [path addClip];
    
    // 6、把圆绘制到上下文中
    [image drawInRect: CGRectMake(borderW, borderW, image.size.width, image.size.height)];
    
    // 7、获取新的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 8、关闭上下文
    UIGraphicsEndImageContext();
    
    // 9、返回新的图片
    return newImage;
    
}


/**
 *  生成带边框的圆形图片
 *
 *  @return 新的图片对象
 */
- (UIImage *)imageWithBorderW:(CGFloat)borderW color:(UIColor *)color
{
    return [UIImage imageWithBorderW:borderW color:color image:self];
}

/**
 *  给定一个不要渲染的图片名称,生成一个最原始的图片
 *
 *  @param imageName 图片名称
 *
 *  @return 新的图片
 */
+ (UIImage *)imageWithOriginalImageName:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed: imageName];
    return [image imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
}

/**
 生成原始图片
 
 @return 新的图片
 */
- (UIImage *)originalImage
{
    return [self imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

/**
 图片压缩
 
 @param targetWidth 目标宽度 scale = 1.0
 
 @return 压缩后的图片
 */
- (UIImage *)compressImageToTargetWidth:(CGFloat)targetWidth
{
    
    CGFloat width = self.size.width;
    CGFloat height = self.size.height;
    
    targetWidth *= [[UIScreen mainScreen] scale];
    CGFloat targetHeight = targetWidth / width * height;
    
    UIGraphicsBeginImageContext(CGSizeMake(targetWidth, targetHeight));
    [self drawInRect:CGRectMake(0, 0, targetWidth, targetHeight)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

/**
 *  根据一张图片返回一个裁剪后的image
 */
- (UIImage *)circleImage
{
    UIGraphicsBeginImageContextWithOptions(self.size, false, 0);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    
    [path addClip];
    
    [self drawAtPoint:CGPointZero];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

@end
