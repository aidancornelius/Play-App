//
//  assetTable.m
//  Play
//
//  Created by Aidan Cornelius-Bell on 9/10/2015.
//  Copyright © 2015 Teacher Solutions Pty Ltd. All rights reserved.
//

#import "assetTable.h"

@implementation assetTable

NSMutableDictionary *webViewURLArray;
NSMutableDictionary *mediaViewURLArray;

+ (void) instantiateWebViewURLArrayWithValues {
    [webViewURLArray setValue:@"localhtml" forKey:@"0-0-type"];
    [webViewURLArray setValue:@"what_is_this_app.html" forKey:@"0-0"];
    
    [webViewURLArray setValue:@"localhtml" forKey:@"0-1-type"];
    [webViewURLArray setValue:@"how_to_use_this_app.html" forKey:@"0-1"];
}

+ (void) instantiateMediaViewURLArrayWithValues {
    
}


+ (NSMutableArray *) webViewLoadRequestFrom: (NSString *)origin {
    [self instantiateWebViewURLArrayWithValues];
    
    NSMutableArray *returnWebViewDelivery = [NSMutableArray alloc];
    
    if ([webViewURLArray objectForKey:origin]) {
        [returnWebViewDelivery addObject:[webViewURLArray objectForKey:[NSString stringWithFormat:@"%@-type", origin]]];
        [returnWebViewDelivery addObject:[webViewURLArray objectForKey:origin]];
    } else {
        [returnWebViewDelivery addObject:@"NO"];
    }
    
    return returnWebViewDelivery;
}

+ (NSString *) mediaViewLoadRequestFrom: (NSString *)origin {
    return origin;
}

+ (NSString *) tableViewLoadRequestFrom: (NSString *)origin {
    return origin;
}

@end
