//
//  ViewViewController.m
//  UIkitTest
//
//  Created by apple on 13-7-11.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "ViewViewController.h"
#import "ViewController1.h"
#import "ViewController2.h"

@interface ViewViewController ()

@end


@implementation ViewViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

//        [window_ makeKeyAndVisible];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    window_ = [[UIView alloc] initWithFrame:CGRectMake(0, 40, 320, 420)] ;
    view1 = [[ViewController1 alloc] init];
    view2 = [[ViewController2 alloc] init];
    [self.view.window addSubview:view1.view];
    [self.view.window addSubview:view2.view];
    [self.view.window bringSubviewToFront:view1.view];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
