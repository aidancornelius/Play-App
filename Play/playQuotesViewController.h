//
//  playQuotesViewController.h
//  Play
//
//  Created by Aidan Cornelius-Bell on 6/11/2015.
//  Copyright © 2015 Teacher Solutions Pty Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface playQuotesViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *webView;

- (IBAction)shareButton:(id)sender;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityView;

@end
