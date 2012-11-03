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

@property (assign) IBOutlet NSButton *defaultButton;
@property (assign) IBOutlet NSButton *primaryButton;
@property (assign) IBOutlet NSButton *infoButton;
@property (assign) IBOutlet NSButton *successButton;
@property (assign) IBOutlet NSButton *warningButton;
@property (assign) IBOutlet NSButton *dangerButton;
@property (assign) IBOutlet NSButton *inverseButton;

@end
