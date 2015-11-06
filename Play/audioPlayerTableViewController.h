//
//  audioPlayerTableViewController.h
//  Play
//
//  Created by Aidan Cornelius-Bell on 2/11/2015.
//  Copyright © 2015 Teacher Solutions Pty Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
@import AVFoundation;
@import MediaPlayer;

@interface audioPlayerTableViewController : UITableViewController <AVAudioPlayerDelegate>

@property (weak, nonatomic) IBOutlet UITableViewCell *pauseButton;

@end
