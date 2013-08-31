//
//  TabBarController.m
//  UIkitTest
//
//  Created by apple on 13-7-11.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "TabBarController.h"
#import "ViewController1.h"
#import "ViewController2.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"TabBar";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view
    ViewController1 *viewController1 = [[[ViewController1 alloc] init]autorelease];
    ViewController2 *viewController2 = [[[ViewController2 alloc] init] autorelease];
    ViewController1 *tab3 = [[[ViewController1 alloc] init] autorelease];
    ViewController2 *tab4 = [[[ViewController2 alloc] init] autorelease];
    ViewController1 *tab5 = [[[ViewController1 alloc] init] autorelease];
    ViewController2 *tab6 = [[[ViewController2 alloc] init] autorelease];
    ViewController1 *tab7 = [[[ViewController1 alloc] init] autorelease];
    NSArray *tabs = [[NSArray alloc] initWithObjects:viewController1, viewController2,tab3,tab4,tab5,tab6,tab7, nil];
//    [(UITabBarController*)self setViewControllers:tabs animated:YES];
    self.customizableViewControllers = [NSArray arrayWithObjects:tab4,tab5,tab6,tab7, nil];
    
    [self setViewControllers:tabs animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
