//
//  settingsTableViewController.m
//  Play
//
//  Created by Aidan Cornelius-Bell on 14/09/2015.
//  Copyright © 2015 Teacher Solutions Pty Ltd. All rights reserved.
//

#import "settingsTableViewController.h"

@interface settingsTableViewController ()

@end

@implementation settingsTableViewController

@synthesize internetContentOutlet;

NSArray *path;
NSString *documentFolder;
NSString *filePath;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Setup the appSettings.plist
    path =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    documentFolder = [path objectAtIndex:0];
    filePath = [documentFolder stringByAppendingFormat:@"/appSettings.plist"];
    
    NSMutableDictionary *applicationSettings = [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
    
    internetContentOutlet.on = [[applicationSettings valueForKey:@"allowInternetContent"] boolValue];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            // Push Notification Settings Requested
            // Deep link to Settings.app
            NSURL *appSettings = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
            [[UIApplication sharedApplication] openURL:appSettings];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)internetContentValueChanged:(id)sender {
    NSMutableDictionary *applicationSettings = [[NSMutableDictionary alloc] init];
    
    applicationSettings = [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
    
    [applicationSettings setValue:[NSNumber numberWithBool:internetContentOutlet.on] forKey:@"allowInternetContent"];
    
    [applicationSettings writeToFile:filePath atomically:YES];
}

@end
