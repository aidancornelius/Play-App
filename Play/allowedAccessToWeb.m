//
//  allowedAccessToWeb.m
//  Play
//
//  Created by Aidan Cornelius-Bell on 14/09/2015.
//  Copyright © 2015 Teacher Solutions Pty Ltd. All rights reserved.
//

#import "allowedAccessToWeb.h"

@implementation allowedAccessToWeb

+ (BOOL) allowedAccessToWebContent {
    NSArray *path;
    NSString *documentFolder;
    NSString *filePath;
    
    // Setup the appSettings.plist
    path =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    documentFolder = [path objectAtIndex:0];
    filePath = [documentFolder stringByAppendingFormat:@"/appSettings.plist"];
    
    NSMutableDictionary *applicationSettings = [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
    
    if ([[applicationSettings valueForKey:@"allowInternetContent"] boolValue] == YES) {
        return YES;
    } else {
        return NO;
    }
}

@end
