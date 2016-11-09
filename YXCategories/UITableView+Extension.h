//
//  UITableView+Extension.h
//  tableView扩展
//
//  Created by 丨柠萌酱丶 on 16/3/9.
//  Copyright © 2016年 丨柠萌酱丶. All rights reserved.
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



/**
 注册tableViewCell

 @param cellClass UITableViewCell
 */
- (void)registerNibWithCell:(Class)cellClass;


/**
 从缓存池获取cell

 @param cellClass cell class

 @return cell
 */
- (__kindof UITableViewCell *)dequeueReusableCell:(Class)cellClass;
@end
