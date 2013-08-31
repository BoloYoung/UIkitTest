//
//  ModalDialog.m
//  UIkitTest
//
//  Created by apple on 13-7-11.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "ModalDialog.h"
#import "GoodByeModal.h"

@interface ModalDialog ()

@end

@implementation ModalDialog

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
    CGPoint newPoint;
    newPoint = self.view.center;
    newPoint.y -= 20;
    self.view.center = newPoint;
    
    UILabel *label = [[UILabel alloc] initWithFrame:self.view.frame];
    label.backgroundColor = [UIColor blueColor];
    label.text = @"模板画面";
    label.textAlignment = NSTextAlignmentLeft;
    label.textColor = [UIColor blackColor];
//    newPoint = label.center;
//    newPoint.y -= 20;
//    label.center = newPoint;
    [self.view addSubview:label];
    
    //按钮1
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button1 setTitle:@"CoverVertical" forState:UIControlStateNormal];
    [button1 sizeToFit];
    newPoint = self.view.center;
    newPoint.y -= 50;
//    newPoint.x -= 80;
    button1.center = newPoint;
    [button1 addTarget:self action:@selector(CallModalDialog1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    //按钮2
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button2 setTitle:@"FlipHorizontal" forState:UIControlStateNormal];
    [button2 sizeToFit];
    newPoint = self.view.center;
    newPoint.y += 0;
    button2.center = newPoint;
    [button2 addTarget:self action:@selector(CallModalDialog2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    //按钮3
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button3 setTitle:@"CrossDissolve" forState:UIControlStateNormal];
    [button3 sizeToFit];
    newPoint = self.view.center;
    newPoint.y += 50;
//    newPoint.x += 80;
    button3.center = newPoint;
    [button3 addTarget:self action:@selector(CallModalDialog3) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    
    //按钮4
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button4 setTitle:@"PartialCurl" forState:UIControlStateNormal];
    [button4 sizeToFit];
    newPoint = self.view.center;
    newPoint.y += 100;
    button4.center = newPoint;
    [button4 addTarget:self action:@selector(CallModalDialog4) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button4];
}

- (void)CallModalDialog1
{
    id dialog = [[GoodByeModal alloc] init];
    ((GoodByeModal*)dialog).modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:dialog animated:YES completion:nil];
}

- (void)CallModalDialog2
{
    id dialog = [[GoodByeModal alloc] init];
    ((GoodByeModal*)dialog).modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:dialog animated:YES completion:nil];
}

- (void)CallModalDialog3
{
    id dialog = [[GoodByeModal alloc] init];
    ((GoodByeModal*)dialog).modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:dialog animated:YES completion:nil];
}

- (void)CallModalDialog4
{
    id dialog = [[GoodByeModal alloc] init];
    ((GoodByeModal*)dialog).modalTransitionStyle = UIModalTransitionStylePartialCurl;
    [self presentViewController:dialog animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
