//
//  NavigationTitle2.m
//  UIkitTest
//
//  Created by apple on 13-7-14.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "NavigationTitle2.h"

@interface NavigationTitle2 ()

@end

@implementation NavigationTitle2

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationItem.prompt = @"NavigationItem Head Message";
        self.navigationItem.title = @"NavigationItrm Title";
        
        UIBarButtonItem *rightButton = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(RightButtonDidPush)] autorelease];
        self.navigationItem.rightBarButtonItem = rightButton;
        
        UIImage *image = [UIImage imageNamed:@"boluo.png"];
        UIImageView *imageview = [[UIImageView alloc] initWithImage:image];
        imageview.bounds = CGRectMake(0, 0, 30, 30);
        UIBarButtonItem *icon = [[UIBarButtonItem alloc] initWithCustomView:imageview];
//        NSArray *lefts = [NSArray arrayWithObjects:self.navigationItem.leftBarButtonItem, icon, nil];
        self.navigationItem.leftBarButtonItem = icon;
    }
    return self;
}

- (void)RightButtonDidPush
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
