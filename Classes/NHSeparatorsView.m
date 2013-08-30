//
//  NHSeparatorsView.m
//  Gamblino
//
//  Created by Nils Hayat on 10/16/12.
//  Copyright (c) 2012 Casserole Labs. All rights reserved.
//

#import "NHSeparatorsView.h"

@implementation NHSeparatorsView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    }
    return self;
}

-(void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    CGFloat separatorThickness;
    if (self.thickLines) {
        separatorThickness = 1.0f;
    } else {
        CGFloat scale = self.contentScaleFactor;
        BOOL isRetinaDisplay = (scale == 2.0f);
        if (isRetinaDisplay) {
            separatorThickness = 0.5f;
        } else {
            separatorThickness = 1.0f;
        }
    }
    
    // Bottom
    CGRect separator = self.bounds;
    separator.origin.y = separator.size.height - separatorThickness;
    separator.size.height = separatorThickness;
    
    if (self.bottomSeparatorColor) {
        CGContextSetFillColorWithColor(context, self.bottomSeparatorColor.CGColor);
        CGContextFillRect(context, separator);
    }
    
    // Top
    separator.origin.y = 0.0f;
    if (self.topSeparatorColor) {
        CGContextSetFillColorWithColor(context, self.topSeparatorColor.CGColor);
        CGContextFillRect(context, separator);
    }
    
    // Right
    separator = self.bounds;
    separator.origin.x = separator.size.width - separatorThickness;
    separator.size.width = separatorThickness;
    
    if (self.rightSeparatorColor) {
        CGContextSetFillColorWithColor(context, self.rightSeparatorColor.CGColor);
        CGContextFillRect(context, separator);
    }
    
    
    // Left
    separator.origin.x = 0.0f;
    if (self.leftSeparatorColor) {
        CGContextSetFillColorWithColor(context, self.leftSeparatorColor.CGColor);
        CGContextFillRect(context, separator);
    }
    
    CGContextRestoreGState(context);
    
    [super drawRect:rect];
    
}
@end
