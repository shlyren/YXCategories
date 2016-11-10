//
//  UICollectionVew+Extension.m
//  驴宝宝
//
//  Created by 任玉祥 on 2016/10/25.
//  Copyright © 2016年 yuxiang.ren. All rights reserved.
//

#import "UICollectionView+Extension.h"

@implementation UICollectionView (Extension)

/**
 注册UICollectionViewCell
 
 @param cell UICollectionViewCell
 */
- (void)registerNibWithCell:(UICollectionViewCell *)cell
{
    [self registerNib:[UINib nibWithNibName:NSStringFromClass([cell class]) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([cell class])];
}
@end
