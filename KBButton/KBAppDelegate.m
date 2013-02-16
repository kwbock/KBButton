//
//  KBAppDelegate.m
//  KBButton
//
//  Created by Kyle Bock on 11/2/12.
//  Copyright (c) 2012 Kyle Bock. All rights reserved.
//

#import "KBAppDelegate.h"

@implementation KBAppDelegate

@synthesize defaultButton, primaryButton, infoButton, successButton, warningButton, dangerButton, inverseButton;

- (void)awakeFromNib {
    [[defaultButton cell] setKBButtonType:BButtonTypeDefault];
    [[primaryButton cell] setKBButtonType:BButtonTypePrimary];
    [[infoButton cell] setKBButtonType:BButtonTypeInfo];
    [[successButton cell] setKBButtonType:BButtonTypeSuccess];
    [[warningButton cell] setKBButtonType:BButtonTypeWarning];
    [[dangerButton cell] setKBButtonType:BButtonTypeDanger];
    [[inverseButton cell] setKBButtonType:BButtonTypeInverse];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication {
    return YES;
}

@end
