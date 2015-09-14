//
//  loginOrRegisterWebViewController.m
//  Play
//
//  Created by Aidan Cornelius-Bell on 14/09/2015.
//  Copyright © 2015 Teacher Solutions Pty Ltd. All rights reserved.
//

#import "loginOrRegisterWebViewController.h"
#import "allowedAccessToWeb.h"
#import "settingsTableViewController.h"

@interface loginOrRegisterWebViewController ()

@end

@implementation loginOrRegisterWebViewController

@synthesize webView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[allowedAccessToWeb alloc] init];
    
    [self allowedToLoadWebContent];
}

- (void) viewDidAppear:(BOOL)animated {
    [self allowedToLoadWebContent];
}

- (void) allowedToLoadWebContent {
    if ([allowedAccessToWeb allowedAccessToWebContent]) {
        // We were allowed acess, let's go!
        [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.teachersolutions.com.au/register/fplayapp"]]];
    } else {
        // We weren't allowed access, let's ask if they want to give it..
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Internet Access" message:@"You have disabled Play's access to the internet in Settings. Unfortunately you cannot access this feature without internet accesss." preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *enableAction = [UIAlertAction actionWithTitle:@"Go to Settings" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            // Load the settings view if requested.
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            UIViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"settings"];
            
            [self.navigationController showViewController:controller sender:NULL];
        }];
        UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"Continue" style:UIAlertActionStyleCancel handler:^(UIAlertAction * action) {
            // Pops back to the last view, hopefully that didn't require web content too
            [self.navigationController popViewControllerAnimated:YES];
        }];
        [alert addAction:defaultAction]; [alert addAction:enableAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
