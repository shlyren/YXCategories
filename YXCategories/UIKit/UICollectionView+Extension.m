//
//  UICollectionVew+Extension.m
//   
//
//  Created by 任玉祥 on 2016/10/25.
//  Copyright © 2016年  任玉祥. All rights reserved.
//

#import "UICollectionView+Extension.h"
#ifdef __OBJC__
@implementation UICollectionView (Extension)

/**
 注册UICollectionViewCell
 
 @param cellClass UICollectionViewCell
 */
- (void)registerNibWithCell:(Class)cellClass
{
    [self registerNib:[UINib nibWithNibName:NSStringFromClass(cellClass) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass(cellClass)];
}


- (__kindof UICollectionViewCell *)dequeueReusableCell:(Class)cellClass forIndexPath:(NSIndexPath *)indexPath
{
    return [self dequeueReusableCellWithReuseIdentifier:NSStringFromClass(cellClass) forIndexPath:indexPath];
}

- (void)registerClass:(Class)cellClass
{
    [self registerClass:cellClass forCellWithReuseIdentifier:NSStringFromClass(cellClass)];
}
@end
#endif
