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

-(UIColor *)topSeparatorColor
{
    if (!_topSeparatorColor) {
        _topSeparatorColor = [UIColor whiteColor];
    }
    return _topSeparatorColor;
}

-(UIColor *)bottomSeparatorColor
{
    if (!_bottomSeparatorColor) {
        _bottomSeparatorColor = [UIColor colorWithRed:.62745098f green:.588235294f blue:.490196078f alpha:1.0f];
    }
    return _bottomSeparatorColor;
}

-(void)drawRect:(CGRect)rect
{
    [super drawRect:rect];

    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);    
    
    CGFloat separatorSize;
    if (self.thickLines) {
        separatorSize = 1.0f;
    } else {
        CGFloat scale = self.contentScaleFactor;
        BOOL isRetinaDisplay = (scale == 2.0f);
        if (isRetinaDisplay) {
            separatorSize = 0.5f;
        } else {
            separatorSize = 1.0f;
        }
    }
    
    
    CGRect separator = self.bounds;
    separator.origin.y = separator.size.height - separatorSize;
    separator.size.height = separatorSize;
    
    CGContextSetFillColorWithColor(context, self.bottomSeparatorColor.CGColor);
    CGContextFillRect(context, separator);
    
    separator.origin.y = 0.0f;
    CGContextSetFillColorWithColor(context, self.topSeparatorColor.CGColor);
    CGContextFillRect(context, separator);
    
    
    CGContextRestoreGState(context);
    
    [super drawRect:rect];
    
}
@end
