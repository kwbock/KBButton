//
//  KBAppDelegate.m
//  KBButton
//
//  Created by Kyle Bock on 11/2/12.
//  Copyright (c) 2012 Kyle Bock. All rights reserved.
//

#import "KBAppDelegate.h"

@implementation KBAppDelegate

@synthesize button;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [[button cell] setKBButtonType:BButtonTypePrimary];
}

@end
