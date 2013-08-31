//
//  ViewController1.m
//  UIkitTest
//
//  Created by apple on 13-7-10.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 ()

@end

@implementation ViewController1

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Hello";
        UIImage *icon = [UIImage imageNamed:@"mindmap.png"];
        self.tabBarItem = [[[UITabBarItem alloc] initWithTitle:self.title image:icon tag:0]autorelease];
        // Custom initialization
//        self.tabBarItem.badgeValue = @"";
    }
    return self;
}

- (void)buttonDidPush
{
    //自己移向背面
    //结果是ViewController2显示在前面
    NSLog(@"%f",[UIScreen mainScreen].bounds.origin.y);
//    [self.view.window sendSubviewToBack:self.view];
    
    [self.view.window sendSubviewToBack:self.view];
    
    //
    if(!self.tabBarItem.badgeValue)
    {
        self.tabBarItem.badgeValue = @"1";
    }
    else
    {
        self.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d", ([self.tabBarItem.badgeValue integerValue] + 1)];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    //追加“Hello World”标签
    //背景为白色、文字为黑色
    UILabel *label = [[[UILabel alloc] initWithFrame:self.view.bounds] autorelease];
    label.text = @"Hello World!";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    label.backgroundColor = [UIColor whiteColor];
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:label];
    NSLog(@"center.y = %f\nbounds.x = %f\nbounds.y = %f",label.center.y,label.frame.size.width,label.frame.size.height);
    //追加按钮
    //单击按钮跳转到其他画面
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"画面跳转" forState:UIControlStateNormal];
    [button sizeToFit];
    CGPoint newPoint = self.view.center;
    newPoint.y += 50;
    button.center = newPoint;
    button.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    [button addTarget:self action:@selector(buttonDidPush) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    NSLog(@"%f",button.center.y);
	// Do any additional setup after loading the view.
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
