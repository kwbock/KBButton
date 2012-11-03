//
//  KBAppDelegate.h
//  KBButton
//
//  Created by Kyle Bock on 11/2/12.
//  Copyright (c) 2012 Kyle Bock. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "KBButton/KBButton.h"

@interface KBAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSButton *button;

@end
