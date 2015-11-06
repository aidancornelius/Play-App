//
//  linkTableViewController.m
//  Play
//
//  Created by Aidan Cornelius-Bell on 19/10/2015.
//  Copyright © 2015 Teacher Solutions Pty Ltd. All rights reserved.
//

#import "linkTableViewController.h"

@interface linkTableViewController ()

@end

@implementation linkTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@", indexPath);
    
    // Index 2.1, Play Research View
    if ((indexPath.section == 0) && (indexPath.row == 0)) {
        SFSafariViewController *webView = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:@"https://www.facebook.com/groups/importanceofplay/"]];
        [self.navigationController presentViewController:webView animated:YES completion:nil];
    }
    if ((indexPath.section == 0) && (indexPath.row == 1)) {
        SFSafariViewController *webView = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:@"https://www.facebook.com/teachersolutions/"]];
        [self.navigationController presentViewController:webView animated:YES completion:nil];
    }
    if ((indexPath.section == 0) && (indexPath.row == 2)) {
        SFSafariViewController *webView = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:@"https://www.teachersolutions.com.au"]];
        [self.navigationController presentViewController:webView animated:YES completion:nil];
    }
    if ((indexPath.section == 0) && (indexPath.row == 3)) {
        SFSafariViewController *webView = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:@"https://www.pinterest.com/teachrsolutions/"]];
        [self.navigationController presentViewController:webView animated:YES completion:nil];
    }
    if ((indexPath.section == 0) && (indexPath.row == 4)) {
        SFSafariViewController *webView = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:@"https://www.pinterest.com/teachrsolutions/importance-of-play/"]];
        [self.navigationController presentViewController:webView animated:YES completion:nil];
    }
    if ((indexPath.section == 0) && (indexPath.row == 5)) {
        SFSafariViewController *webView = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:@"http://engineroom.xyz/"]];
        [self.navigationController presentViewController:webView animated:YES completion:nil];
    }
    
}


@end
