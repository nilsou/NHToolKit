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
    
    CGContextSetLineWidth(context, 1.0);
    
    if (self.dotted) {
        CGFloat dash[] = {1.0, 1.0};
        CGContextSetLineDash(context, 0, dash, 2);
    }
    
    if (self.topSeparatorColor) {
        CGContextSetStrokeColorWithColor(context, self.topSeparatorColor.CGColor);
        CGContextMoveToPoint(context, CGRectGetMinX(self.bounds), CGRectGetMinY(self.bounds));
        CGContextAddLineToPoint(context, CGRectGetMaxX(self.bounds), CGRectGetMinY(self.bounds));
        CGContextStrokePath(context);
    }
    
    if (self.bottomSeparatorColor) {
        CGContextSetStrokeColorWithColor(context, self.bottomSeparatorColor.CGColor);
        CGContextMoveToPoint(context, CGRectGetMinX(self.bounds), CGRectGetMaxY(self.bounds));
        CGContextAddLineToPoint(context, CGRectGetMaxX(self.bounds), CGRectGetMaxY(self.bounds));
        CGContextStrokePath(context);
    }
    
    if (self.leftSeparatorColor) {
        CGContextSetStrokeColorWithColor(context, self.leftSeparatorColor.CGColor);
        CGContextMoveToPoint(context, CGRectGetMinX(self.bounds), CGRectGetMinY(self.bounds));
        CGContextAddLineToPoint(context, CGRectGetMinX(self.bounds), CGRectGetMaxY(self.bounds));
        CGContextStrokePath(context);
    }
    
    if (self.rightSeparatorColor) {
        CGContextSetStrokeColorWithColor(context, self.rightSeparatorColor.CGColor);
        CGContextMoveToPoint(context, CGRectGetMaxX(self.bounds), CGRectGetMinY(self.bounds));
        CGContextAddLineToPoint(context, CGRectGetMaxX(self.bounds), CGRectGetMaxY(self.bounds));
        CGContextStrokePath(context);
    }
    
    CGContextRestoreGState(context);
    
    [super drawRect:rect];
}

@end
