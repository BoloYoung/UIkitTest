//
//  ViewController2.m
//  UIkitTest
//
//  Created by apple on 13-7-10.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"您好";
        UIImage *icon = [UIImage imageNamed:@"mindmap.png"];
        self.tabBarItem = [[[UITabBarItem alloc] initWithTitle:@"您好" image:icon tag:0] autorelease];
        // Custom initialization
    }
    return self;
}


- (void)buttonDidPush
{
    // 自己移向背面
    // 结果是viewController1显示在前
    NSLog(@"holy sh**!");
//    [self.view.window sendSubviewToBack:self.view];
    [self.view.window sendSubviewToBack:self.view];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // 追加“您好，世界！”标签
    // 背景为黑色、文字为白色
    UILabel * label = [[[UILabel alloc] initWithFrame:self.view.bounds] autorelease];
    label.text = @"您好，世界！";
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor blackColor];
    label.textColor = [UIColor whiteColor];
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:label];
    
    // 追加按钮
    // 单击按钮后画面跳转
    UIButton * button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"画面跳转" forState:UIControlStateNormal];
    [button sizeToFit];
    CGPoint newPonit = self.view.center;
    newPonit.y += 50;
    button.center = newPonit;
    button.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    [button addTarget:self action:@selector(buttonDidPush) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
