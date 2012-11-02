//
//  KBButtonCell.m
//  CustomButtons
//
//  Created by Kyle Bock on 11/2/12.
//  Copyright (c) 2012 Kyle Bock. All rights reserved.
//

#import "KBButtonCell.h"

@implementation KBButtonCell

- (void)drawBezelWithFrame:(NSRect)frame inView:(NSView *)controlView
{
    NSGraphicsContext* ctx = [NSGraphicsContext currentContext];
    
    CGFloat roundedRadius = 3.0f;
    
    NSColor *color = [NSColor colorWithDeviceRed:0.00f green:0.33f blue:0.80f alpha:1.00f];
    
    // Draw darker overlay if button is pressed
    if([self isHighlighted]) {
        [ctx saveGraphicsState];
        [[NSBezierPath bezierPathWithRoundedRect:frame
                                         xRadius:roundedRadius
                                         yRadius:roundedRadius] setClip];
        [[self darkenColor:color value:0.12f] setFill];
        NSRectFillUsingOperation(frame, NSCompositeSourceOver);
        [ctx restoreGraphicsState];
        
        return;
    }
    
    // create background color
    [ctx saveGraphicsState];
    [[NSBezierPath bezierPathWithRoundedRect:frame
                                     xRadius:roundedRadius
                                     yRadius:roundedRadius] setClip];
    [[self darkenColor:color value:0.12f] setFill];
    NSRectFillUsingOperation(frame, NSCompositeSourceOver);
    [ctx restoreGraphicsState];
    
    
    //draw inner button area
    [ctx saveGraphicsState];
    
    NSBezierPath* bgPath = [NSBezierPath bezierPathWithRoundedRect:NSInsetRect(frame, 1.0f, 1.0f) xRadius:roundedRadius yRadius:roundedRadius];
    [bgPath setClip];
    
    NSColor* topColor = [self lightenColor:color value:0.12f];
    
    // gradient for inner portion of button
    // this
    NSGradient* bgGradient = [[NSGradient alloc] initWithColorsAndLocations:
                              topColor, 0.0f,
                              color, 1.0f,
                              nil];
    [bgGradient drawInRect:[bgPath bounds] angle:90.0f];
    
    [ctx restoreGraphicsState];
}

- (NSRect) drawTitle:(NSAttributedString *)title withFrame:(NSRect)frame inView:(NSView *)controlView {
    NSGraphicsContext* ctx = [NSGraphicsContext currentContext];
    
    [ctx saveGraphicsState];
    NSMutableAttributedString *attrString = [title mutableCopy];
    [attrString beginEditing];
    [attrString addAttribute:NSForegroundColorAttributeName value:[NSColor whiteColor] range:NSMakeRange(0, [[self title] length])];
    [attrString endEditing];
    NSRect r = [super drawTitle:attrString withFrame:frame inView:controlView];
    // 5) Restore the graphics state
    [ctx restoreGraphicsState];
    
    return r;
}

- (NSColor *)lightenColor:(NSColor *)oldColor value:(float)value {
    float red = [oldColor redComponent];
    red += value;
    
    float green = [oldColor greenComponent];
    green += value;
    
    float blue = [oldColor blueComponent];
    blue += value;
    
    return [NSColor colorWithCalibratedRed:red green:green blue:blue alpha:1.0f];
}

- (NSColor *)darkenColor:(NSColor *)oldColor value:(float)value {
    float red = [oldColor redComponent];
    red -= value;
    
    float green = [oldColor greenComponent];
    green -= value;
    
    float blue = [oldColor blueComponent];
    blue -= value;
    
    return [NSColor colorWithCalibratedRed:red green:green blue:blue alpha:1.0f];
}

@end
