//
//  UITableView+Extension.m
//  tableView扩展
//
//  Created by 丨柠萌酱丶 on 16/3/9.
//  Copyright © 2016年 丨柠萌酱丶. All rights reserved.
//

#import "UITableView+Extension.h"

@implementation UITableView (Extension)

/**
 *  通过tableViewDataSource来判断当没有数据时,去掉tableviewCell的分割线，并在tableview上显示一些信息
 *
 *  @param message 显示的内容
 *  @param rowCount   row的个数
 */
- (void)tableViewShowMessage:(NSString *)message numberOfRows:(NSInteger)rowCount;
{
    if (rowCount == 0)
    {
        // Display a message when the table is empty
        // 没无数据的时分，UILabel的表现款式
        UILabel *messageLabel = [[UILabel alloc] init];
        
        messageLabel.text = message;
        messageLabel.font = [UIFont preferredFontForTextStyle: UIFontTextStyleBody];
        messageLabel.textColor = [UIColor lightGrayColor];
        messageLabel.textAlignment = NSTextAlignmentCenter;
        [messageLabel sizeToFit];
        
        self.backgroundView = messageLabel;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    else
    {
        self.backgroundView = nil;
        self.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    }
}

- (void)tableViewShowActivityIndicatorViewWithRows:(NSInteger)row;
{
    if (row == 0)
    {
        // Display a message when the table is empty
        // 没无数据的时分，UILabel的表现款式
        
        UIActivityIndicatorView *indView = [UIActivityIndicatorView new];
        indView.frame = CGRectMake((self.frame.size.width - 30) * 0.5, (self.frame.size.height - 30) * 0.5, 30, 30);
        self.backgroundView = indView;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    else
    {
        self.backgroundView = nil;
        self.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    }

}


- (void)tableViewShowImage:(NSString *)imageName numberOfRows:(NSInteger)rowCount;
{
    
    if (!rowCount)
    {
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.backgroundView = imageView;
        
    }else {
        self.backgroundView = nil;
        self.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    }
}

/**
 *  隐藏tableViewCell多余的分割线
 */
- (void)tableViewSetExtraCellLineHidden
{
    
    UIView *view = [UIView new];
    
    view.backgroundColor = [UIColor whiteColor];
    
    [self setTableFooterView:view];
    
}


/**
 注册tableViewCell
 
 @param cellClass UITableViewCell class
 */
- (void)registerNibWithCell:(Class)cellClass
{
    [self registerNib:[UINib nibWithNibName:NSStringFromClass(cellClass) bundle:nil] forCellReuseIdentifier:NSStringFromClass(cellClass)];
}
- (void)registerClass:(Class)cellClass
{
    [self registerClass:cellClass forCellReuseIdentifier:NSStringFromClass(cellClass)];
}

/**
 从缓存池获取cell
 
 @param cellClass cell class
 
 @return cell
 */
- (__kindof UITableViewCell *)dequeueReusableCell:(Class)cellClass
{
    return [self dequeueReusableCellWithIdentifier:NSStringFromClass(cellClass)];
}

@end
