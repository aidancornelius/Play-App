//
//  homeTableViewController.m
//  Play
//
//  Created by Aidan Cornelius-Bell on 18/09/2015.
//  Copyright © 2015 Teacher Solutions Pty Ltd. All rights reserved.
//

#import "homeTableViewController.h"

@interface homeTableViewController ()

@end

@implementation homeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@", indexPath);
    
    // Index 2.1, Play Research View
    /* if ((indexPath.section == 2) && (indexPath.row == 1)) {
        SFSafariViewController *webView = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:@"https://docs.google.com/document/d/1jlGQMHAZdwFgr7vt57zG7m3DB28lQKOi-QhO68KhM2M/view"]];
        [self.navigationController presentViewController:webView animated:YES completion:nil];
    } */
}

@end
