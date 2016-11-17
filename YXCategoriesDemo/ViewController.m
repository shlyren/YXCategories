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
@property (weak, nonatomic) IBOutlet UIButton *btn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    /**
     pod spec lint
     pod trunk push YXCategories.podspec --allow-warnings
     
     */
    
    [self.btn addTouchUpInsideAction:^(UIButton *button) {
       
        NSLog(@"\n%@ \n%@",self.btn, button);
        
    }];
    
    [self.tf addEditingChangedAction:^(UITextField *textField) {
        NSLog(@"\n%@ \n%@",self.tf, textField);
    }];
    
    UIView *sv = self.view;
    [self.view addTapAction:^(UIView *view) {
        NSLog(@"\n%@ \n%@",sv, view);
    }];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [MBProgressHUD showTitle:@"test"];
    
}


@end
