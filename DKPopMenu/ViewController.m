//
//  ViewController.m
//  DKPopMenu
//
//  Created by NSLog on 2017/7/31.
//  Copyright © 2017年 DK-Coder. All rights reserved.
//

#import "ViewController.h"
#import "DKPopMenu.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake(CGRectGetWidth(self.view.frame) - 120.f, 100.f, 120.f, 50.f);
    button.backgroundColor = [UIColor orangeColor];
    [button setTitle:@"显示" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonPressed:(UIButton *)sender
{
    DKPopMenu *menu = [[DKPopMenu alloc] init];
    menu.arrayTitles = @[@"选项1", @"选项2", @"选项3"];
    [menu showPopMenuOnView:self.view frame:CGRectMake(CGRectGetMinX(sender.frame), CGRectGetMaxY(sender.frame), CGRectGetWidth(sender.frame), 300.f)];
}
@end
