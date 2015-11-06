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

@synthesize pauseButton;

AVAudioPlayer *audioPlayer;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSError *error = [NSError alloc];
    
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"ts_long_podcast" withExtension:@"m4a"] error:&error];
    
    NSLog(@"Audio Player Status: %@", [error localizedDescription]);
    
    [self updateMPNowPlayingInfoCentre:NO];
    
    [MPRemoteCommandCenter sharedCommandCenter].previousTrackCommand.enabled = NO;
    [MPRemoteCommandCenter sharedCommandCenter].skipBackwardCommand.enabled = NO;
    [MPRemoteCommandCenter sharedCommandCenter].seekBackwardCommand.enabled = NO;
    [MPRemoteCommandCenter sharedCommandCenter].nextTrackCommand.enabled = NO;
    [MPRemoteCommandCenter sharedCommandCenter].skipForwardCommand.enabled = NO;
    [MPRemoteCommandCenter sharedCommandCenter].seekForwardCommand.enabled = NO;
}

- (void) updateMPNowPlayingInfoCentre: (bool)playing {
    // Hacky, but workable. Update the home screen and inter-app audio info.
    NSDictionary *info;
    
    if (playing) {
        info = @{ MPMediaItemPropertyArtist: @"Teacher Solutions Pty Ltd",
                            MPMediaItemPropertyAlbumTitle: @"Play App",
                            MPMediaItemPropertyTitle: @"Importance of Play Podcast",
                            MPNowPlayingInfoPropertyPlaybackRate: @1.0f };
    } else {
        info = @{ MPMediaItemPropertyArtist: @"Teacher Solutions Pty Ltd",
                                MPMediaItemPropertyAlbumTitle: @"Play App",
                                MPMediaItemPropertyTitle: @"Importance of Play Podcast",
                                MPNowPlayingInfoPropertyPlaybackRate: @0.0f };
    }
    
    [MPNowPlayingInfoCenter defaultCenter].nowPlayingInfo = info;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@", indexPath);
    
    pauseButton.hidden = NO;
    
    // Index 2.1, Play Research View
    if ((indexPath.section == 0) && (indexPath.row == 1)) {
        NSLog(@"Playing: Chapter 1");
        [audioPlayer play];
        [self updateMPNowPlayingInfoCentre:YES];
    }
#pragma mark - Modified to allow pause button on index 2
    if ((indexPath.section == 0) && (indexPath.row == 2)) {
        if ([audioPlayer isPlaying]) {
            NSLog(@"The audio is currently playing, it will now pause.");
            pauseButton.textLabel.text = @"Resume";
            [self updateMPNowPlayingInfoCentre:NO];
            [audioPlayer pause];
        } else {
            NSLog(@"The audio is currently paused, it will now resume.");
            pauseButton.textLabel.text = @"Pause";
            [self updateMPNowPlayingInfoCentre:YES];
            [audioPlayer play];
        }
    }
    
    if ((indexPath.section == 0) && (indexPath.row == 3)) {
        NSLog(@"Playing: Chapter 3");
        [audioPlayer playAtTime:4000];
        [self updateMPNowPlayingInfoCentre:YES];
    }
    
    if ((indexPath.section == 0) && (indexPath.row == 4)) {
        NSLog(@"Playing: Chapter 4");
        [audioPlayer playAtTime:6000];
        [self updateMPNowPlayingInfoCentre:YES];
    }
    
    if ((indexPath.section == 0) && (indexPath.row == 5)) {
        NSLog(@"Playing: Chapter 5");
        [audioPlayer playAtTime:8000];
        [self updateMPNowPlayingInfoCentre:YES];
    }
    
    if ((indexPath.section == 0) && (indexPath.row == 6)) {
        NSLog(@"Playing: Chapter 2");
        [audioPlayer playAtTime:2000];
        [self updateMPNowPlayingInfoCentre:YES];
    }
}

- (void)remoteControlReceivedWithEvent:(UIEvent *)event {
    if (event.type == UIEventTypeRemoteControl)
    {
        if (event.subtype == UIEventSubtypeRemoteControlPlay)
        {
            [audioPlayer play];
            [self updateMPNowPlayingInfoCentre:YES];
        }
        else if (event.subtype == UIEventSubtypeRemoteControlPause)
        {
            [audioPlayer pause];
            [self updateMPNowPlayingInfoCentre:NO];
        }
    }
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    if (flag) {
        pauseButton.hidden = YES;
    }
}

- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error {
    NSLog(@"Audio player encountered a decoding error: %@", [error localizedDescription]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [audioPlayer stop];
    [self updateMPNowPlayingInfoCentre:NO];
}

- (void) viewDidDisappear:(BOOL)animated {
    [audioPlayer pause];
    [self updateMPNowPlayingInfoCentre:NO];
}

@end
