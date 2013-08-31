//
//  GoodByeModal.m
//  UIkitTest
//
//  Created by apple on 13-7-11.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "GoodByeModal.h"

@interface GoodByeModal ()

@end

@implementation GoodByeModal

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    // 标签
    UILabel *label = [[UILabel alloc]initWithFrame:self.view.bounds];
    label.backgroundColor = [UIColor blackColor];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"您好。我是模态画面。";
    [self.view addSubview:label];
    
    // 按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"good－bye～" forState:UIControlStateNormal];
    [button sizeToFit];
    CGPoint newPoint = self.view.center;
    newPoint.y += 50;
    button.center = newPoint;
    [button addTarget:self action:@selector(goodbyeDidPush) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)goodbyeDidPush
{
    //关闭模态对话框
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
