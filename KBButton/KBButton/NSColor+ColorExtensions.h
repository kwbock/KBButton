//
//  NSColor+ColorExtensions.h
//  KBButton
//
//  Created by Kyle Bock on 11/3/12.
//  Copyright (c) 2012 Kyle Bock. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSColor (ColorExtensions)

- (NSColor *)lightenColorByValue:(float)value;
- (NSColor *)darkenColorByValue:(float)value;
- (BOOL)isLightColor;
@end
