//
//  UITableView+Extension.h
//  tableView扩展
//
//  Created by 任玉祥 on 16/3/9.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (Extension)

/**
 *  通过tableViewDataSource来判断当没有数据时,去掉tableviewCell的分割线，并在tableview上显示一些信息
 *
 *  @param message 显示的内容
 *  @param rowCount   row的个数
 */
- (void)tableViewShowMessage:(NSString *)message numberOfRows:(NSInteger)rowCount;


- (void)tableViewShowActivityIndicatorViewWithRows:(NSInteger)row;

/**
 *  没有内容时显示一张图片
 *
 *  @param imageName 图片名字
 *  @param rowCount  row的个数
 */
- (void)tableViewShowImage:(NSString *)imageName numberOfRows:(NSInteger)rowCount;

/**
 *  隐藏tableViewCell多余的分割线
 *  cellForRowAtIndexPath 方法中调用
 */
- (void)tableViewSetExtraCellLineHidden;


#ifdef __OBJC__
/**
 xib 注册tableViewCell  reuseIdentifier 为cell类名的字符串
 
 @param cellClass UITableViewCell
 */
- (void)registerNibWithCell:(Class)cellClass;

/**
 class 注册tableViewCell reuseIdentifier 为cell类名的字符串
 
 @param cellClass UITableViewCell
 */
- (void)registerClass:(Class)cellClass;

/**
 从缓存池获取cell reuseIdentifier 为cell类名的字符串
 
 @param cellClass cell class
 
 @return cell
 */
- (__kindof UITableViewCell *)dequeueReusableCell:(Class)cellClass;
#endif
@end
