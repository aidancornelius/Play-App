//
//  playQuotesViewController.m
//  Play
//
//  Created by Aidan Cornelius-Bell on 6/11/2015.
//  Copyright © 2015 Teacher Solutions Pty Ltd. All rights reserved.
//

#import "playQuotesViewController.h"

@interface playQuotesViewController ()

@end

@implementation playQuotesViewController

@synthesize webView, activityView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"playQuotes.pdf" ofType:nil]]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)webViewDidStartLoad:(UIWebView *)webView {
    activityView.hidden = NO;
    [activityView startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    activityView.hidden = YES;
    [activityView stopAnimating];
}

- (IBAction)shareButton:(id)sender {
    
    NSData *pdfData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"playQuotes.pdf" ofType:nil]];
    
    NSArray *shareItems = @[@"Play Presentation via @TeachrSolutions from the Importance of Play App https://itunes.apple.com/us/app/importance-play-teacher-solutions/id1047980226?ls=1&mt=8", pdfData];
    
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:shareItems applicationActivities:nil];
    
    NSArray *excludeActivities = @[UIActivityTypeAssignToContact,
                                   UIActivityTypeSaveToCameraRoll,
                                   UIActivityTypeAddToReadingList,
                                   UIActivityTypePostToFlickr,
                                   UIActivityTypePostToVimeo,
                                   UIActivityTypeMail,
                                   UIActivityTypeMessage,
                                   UIActivityTypePostToFacebook,
                                   UIActivityTypePostToWeibo,
                                   UIActivityTypePostToTencentWeibo];
    
    activityVC.excludedActivityTypes = excludeActivities;
    
    [self presentViewController:activityVC animated:YES completion:nil];
}
@end
