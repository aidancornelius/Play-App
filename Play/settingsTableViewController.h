//
//  settingsTableViewController.h
//  Play
//
//  Created by Aidan Cornelius-Bell on 14/09/2015.
//  Copyright © 2015 Teacher Solutions Pty Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface settingsTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UISwitch *internetContentOutlet;

- (IBAction)internetContentValueChanged:(id)sender;

@end
