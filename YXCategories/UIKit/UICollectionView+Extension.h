//
//  UICollectionVew+Extension.h
//  驴宝宝
//
//  Created by 任玉祥 on 2016/10/25.
//  Copyright © 2016年 yuxiang.ren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionView (Extension)
/**
 xib 注册UICollectionViewCell
 
 @param cellClass UICollectionViewCell
 */
- (void)registerNibWithCell:(Class)cellClass;

/**
 从缓存池获取cell

 @param cellClass cellClass
 @param indexPath indexPath
 @return cell
 */
- (__kindof UICollectionViewCell *)dequeueReusableCell:(Class)cellClass forIndexPath:(NSIndexPath *)indexPath;


/**
 class 注册UICollectionViewCell
 
 @param cellClass UICollectionViewCell
 */
- (void)registerCell:(Class)cellClass;
@end
