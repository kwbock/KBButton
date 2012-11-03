//
//  KBButtonCell.m
//  CustomButtons
//
//  Created by Kyle Bock on 11/2/12.
//  Copyright (c) 2012 Kyle Bock. All rights reserved.
//

#import "KBButtonCell.h"

@implementation KBButtonCell

- (void)setKBButtonType:(BButtonType)type {
    [[NSGraphicsContext currentContext] saveGraphicsState];
    kbButtonType = type;
    [[NSGraphicsContext currentContext] restoreGraphicsState];
}

- (NSColor*)getColorForButtonType {
    switch (kbButtonType) {
        case BButtonTypeDefault:
            return [NSColor colorWithCalibratedRed:0.85f green:0.85f blue:0.85f alpha:1.00f];
            break;
        case BButtonTypePrimary:
            return [NSColor colorWithCalibratedRed:0.00f green:0.33f blue:0.80f alpha:1.00f];
            break;
        case BButtonTypeInfo:
            return [NSColor colorWithCalibratedRed:0.18f green:0.59f blue:0.71f alpha:1.00f];
            break;
        case BButtonTypeSuccess:
            return [NSColor colorWithCalibratedRed:0.32f green:0.64f blue:0.32f alpha:1.00f];
            break;
        case BButtonTypeWarning:
            return [NSColor colorWithCalibratedRed:0.97f green:0.58f blue:0.02f alpha:1.00f];
            break;
        case BButtonTypeDanger:
            return [NSColor colorWithCalibratedRed:0.74f green:0.21f blue:0.18f alpha:1.00f];
            break;
        case BButtonTypeInverse:
            return [NSColor colorWithCalibratedRed:0.13f green:0.13f blue:0.13f alpha:1.00f];
    }
}

- (void)drawBezelWithFrame:(NSRect)frame inView:(NSView *)controlView
{
    //[self setKBButtonType:BButtonTypeDefault];
    //NSLog(@"test %@", [self color]);
    NSGraphicsContext* ctx = [NSGraphicsContext currentContext];
    
    CGFloat roundedRadius = 3.0f;
    
    //NSColor *color = [NSColor colorWithDeviceRed:0.00f green:0.33f blue:0.80f alpha:1.00f];
    NSColor *color = [self getColorForButtonType];
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
    NSColor *titleColor;
    if ([self isLightColor:[self getColorForButtonType]]) {
        titleColor = [NSColor blackColor];
    } else {
        titleColor = [NSColor whiteColor];
    }
    
    [attrString addAttribute:NSForegroundColorAttributeName value:titleColor range:NSMakeRange(0, [[self title] length])];
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

- (BOOL) isLightColor:(NSColor *)color {
    int   totalComponents = [color numberOfComponents];
    bool  isGreyscale     = totalComponents == 2 ? YES : NO;
    
    CGFloat sum;
    
    if (isGreyscale) {
        sum = [color redComponent];
    } else {
        sum = ([color redComponent]+[color greenComponent]+[color blueComponent])/3.0;
    }
    
    return (sum > 0.8);
}

@end
