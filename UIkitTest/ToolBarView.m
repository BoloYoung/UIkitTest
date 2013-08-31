//
//  ToolBarView.m
//  UIkitTest
//
//  Created by apple on 13-7-14.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "ToolBarView.h"
#import "ToolBarView2.h"

@interface ToolBarView ()

@end

@implementation ToolBarView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        UIBarButtonItem * button = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(buttonDidPush)] autorelease];
        UIBarButtonItem *spacer = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil] autorelease];
        UIBarButtonItem *button2 = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemUndo target:self action:@selector(buttonDidPush)] autorelease];
        NSArray *buttons = [NSArray arrayWithObjects:button, spacer, button2, nil];
        [self setToolbarItems:buttons animated:YES];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setToolbarHidden:NO animated:YES];
    NSLog(@"View2 WillAppear");
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setToolbarHidden:YES animated:YES];
    NSLog(@"View2 WillDisAppear");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSLog(@"View2 DidLoad");
    UILabel *label = [[[UILabel alloc] initWithFrame:self.view.bounds] autorelease];
    label.text = @"FirstToolBarView";
    label.textAlignment = NSTextAlignmentCenter;
    label.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    
    [self.view addSubview:label];
}

- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"View2 DidAppear");
}

- (void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"View2 DidDisappear");
}

- (void)buttonDidPush
{
    ToolBarView2 *tool2 = [[[ToolBarView2 alloc] init] autorelease];
//    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:tool2 animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
