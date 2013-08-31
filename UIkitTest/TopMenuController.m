//
//  TopMenuController.m
//  UIkitTest
//
//  Created by apple on 13-7-10.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "TopMenuController.h"
#import "ViewController1.h"
#import "ViewController2.h"
#import "ModalDialog.h"
#import "NavigationTitle.h"
#import "ToolBarView.h"
#import "UsualUikit.h"

@interface TopMenuController ()

@end

@implementation TopMenuController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        // 创建显示用数组
        self.title = @"主菜单";
        items_ = [[NSMutableArray alloc] initWithObjects:@"ViewViewController",@"TabBarController",@"ModalDialog",@"NavigationTitle",@"ToolBarView",@"UsualUikit",nil];
        details_ = [[NSMutableArray alloc] initWithObjects:@"视图", @"选择视图", @"模态视图", @"导航视图", @"工具条", @"常用UI控件", nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"View1 DidLoad");
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"View1 WillAppear");
}

- (void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"View1 WillDisAppear");
    [self.tableView resignFirstResponder];
}

- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"View1 DidAppear");
}

- (void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"View1 DidDisappear");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [items_ count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *CellIdentifier = @"simple-cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier ];
//    if (!cell) {
//        cell = [[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:@"simple-cell"];
//    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
    
    // Configure the cell...
    cell.textLabel.text = [items_ objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [details_ objectAtIndex:indexPath.row];
    cell.highlighted = NO;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
    Class class = NSClassFromString([items_ objectAtIndex:indexPath.row]);
    id viewController = [[[class alloc] init] autorelease];
    if(viewController)
    {
        if([[NSString stringWithFormat:@"%@",[viewController class]] isEqual:@"ToolBarView"])
        {
//            self.hidesBottomBarWhenPushed = NO ;
        }
        
        [[tableView cellForRowAtIndexPath:indexPath] setHighlighted:NO animated:YES];
        NSLog(@"%@",[tableView cellForRowAtIndexPath:indexPath].textLabel.text);
        [self.navigationController pushViewController:viewController animated:YES];

    }
}

@end
