//
//  presentationNAudioViewController.h
//  Play
//
//  Created by Aidan Cornelius-Bell on 19/10/2015.
//  Copyright © 2015 Teacher Solutions Pty Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface presentationNAudioViewController : UIViewController <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

- (IBAction)shareButton:(id)sender;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityView;

@end
