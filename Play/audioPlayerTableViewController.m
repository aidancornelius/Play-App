//
//  audioPlayerTableViewController.m
//  Play
//
//  Created by Aidan Cornelius-Bell on 2/11/2015.
//  Copyright © 2015 Teacher Solutions Pty Ltd. All rights reserved.
//

#import "audioPlayerTableViewController.h"

@interface audioPlayerTableViewController ()

@end

@implementation audioPlayerTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"ts_long_podcast" ofType:@"m4a"]] error:nil];
    
    [audioPlayer prepareToPlay];
    
    [audioPlayer play];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
