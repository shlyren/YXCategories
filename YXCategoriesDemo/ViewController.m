//
//  ViewController.m
//  YXCategoriesDemo
//
//  Created by 任玉祥 on 2016/11/3.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import "ViewController.h"
#import "YXCategories.h"
@import MessageUI;

@interface ViewController ()<MFMessageComposeViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *tf;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *btn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    /**
     pod spec lint
     pod trunk push YXCategories.podspec --allow-warnings
     */
    
}
- (IBAction)remove
{
//   [self.btn removeTapAction];
//    [self.view removeTapAction];
//    [self.tf removeEditingChangedAction];
    [self.label removeTapAction];

}

- (IBAction)add
{
    
    
    if ([MFMessageComposeViewController canSendText]) {
        MFMessageComposeViewController *message = [MFMessageComposeViewController new];

        message.messageComposeDelegate = self;
        message.body = @"短信内容";
        message.recipients = @[@"18951959661"];
        [self presentViewController:message animated:true completion:^{
            
        }];
    }else {
        NSLog(@"不支持发短信");
    }
    
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    NSLog(@"%zd", result);
    
    switch (result) {
        case MessageComposeResultCancelled:
            NSLog(@"取消");
            break;
        case MessageComposeResultSent:
            NSLog(@"发送成功");
            
            break;
            
        default:
            break;
    }
    
    [controller dismissViewControllerAnimated:true completion:nil];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"string  %@,  %zd", [UIDevice deviceModeString], [UIDevice belongTo:iPhone2G | iPhone7]);

}

@end
