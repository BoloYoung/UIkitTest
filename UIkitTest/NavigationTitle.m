//
//  NavigationTitle.m
//  UIkitTest
//
//  Created by apple on 13-7-12.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "NavigationTitle.h"
#import "NavigationTitle2.h"


@interface NavigationTitle ()
- (void)sliderDidChange;
@end

@implementation NavigationTitle

- (void)dealloc
{
    [slider_ release];
    [label_ release];
    [super dealloc];
}

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
    // 顶部信息
    self.navigationItem.prompt = @"移动滑块改变画面颜色";
    // 创建UISLider实例，滑块变化时调用sliderDidChange:方法
    slider_ = [[UISlider alloc]init];
    slider_.frame = self.navigationController.navigationBar.bounds;
    slider_.minimumValue = 0.0;
    slider_.maximumValue = 1.0;
    slider_.value = slider_.maximumValue / 2.0;
    [slider_ addTarget:self action:@selector(sliderDidChange) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = slider_;
    [self.view addSubview:slider_];
    
    // 创建标签，并根据滑块的值改变标签的颜色
    label_ = [[UILabel alloc] init];
    label_.frame = CGRectInset(self.view.bounds, 20, 20);
    label_.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    label_.backgroundColor = [UIColor blackColor];
    [self.view addSubview:label_];
//    self.navigationItem.titleView = label_;
    // 调用sliderDidChange方法设置滑块初始值
    [self sliderDidChange];
//    [self.view bringSubviewToFront:slider_];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(RightButtonDidPush)];
}

- (void)RightButtonDidPush
{
    NavigationTitle2 *navi2 = [[[NavigationTitle2 alloc] init] autorelease];
    [self.navigationController pushViewController:navi2 animated:YES];
    
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
//    [self.navigationController setToolbarHidden:NO animated:NO];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark-----------Private Mathods---------
//画面显示时隐藏返回按钮，触摸画面后显示返回按钮
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.navigationItem setHidesBackButton:NO animated:YES];
}

- (void)sliderDidChange
{
    UIColor *color = [[[UIColor alloc] initWithRed:slider_.value green:slider_.value blue:slider_.value alpha:1.0] autorelease];
    self.navigationController.navigationBar.tintColor = color;
    label_.backgroundColor = color;
}

@end
