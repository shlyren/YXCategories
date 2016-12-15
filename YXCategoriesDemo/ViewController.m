//
//  ViewController.m
//  YXCategoriesDemo
//
//  Created by 任玉祥 on 2016/11/3.
//  Copyright © 2016年 任玉祥. All rights reserved.
//

#import "ViewController.h"
#import "YXCategories.h"


@interface ViewController ()

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
    [self.label addTapAction:^(__kindof UIView *view) {
        NSLog(@"\n%@",view);
    }];
    
//    [self.btn addTouchUpInsideAction:^(UIButton *button) {
//        NSLog(@"\n%@ \n%@",self.btn, button);
//    }];
//    
//            [self.view addTapAction:^(__kindof UIView *view) {
//                NSLog(@"\n%@", view);
//            }];b
    
//        [self.tf addEditingChangedAction:^(UITextField *textField) {
//            NSLog(@"\n%@ \n%@",self.tf, textField);
//        }];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"string  %@,  %zd", [UIDevice deviceModeString], [UIDevice belongTo:iPhone2G | iPhone7]);

}

@end
