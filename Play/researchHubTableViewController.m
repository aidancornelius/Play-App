//
//  researchHubTableViewController.m
//  Play
//
//  Created by Aidan Cornelius-Bell on 6/11/2015.
//  Copyright © 2015 Teacher Solutions Pty Ltd. All rights reserved.
//

#import "researchHubTableViewController.h"

@interface researchHubTableViewController ()

@end

@implementation researchHubTableViewController

#pragma mark - Data Source Definition

NSArray *content;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    content  = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ResearchData" ofType:@"plist"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SFSafariViewController *webView = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:[[content objectAtIndex:indexPath.row] valueForKey:@"url"]]];
    [self.navigationController presentViewController:webView animated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [content count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"weblink" forIndexPath:indexPath];
    
    cell.textLabel.text = [[content objectAtIndex:indexPath.row] valueForKey:@"name"];
    cell.detailTextLabel.text = [[content objectAtIndex:indexPath.row] valueForKey:@"url"];
    
    return cell;
}

@end
