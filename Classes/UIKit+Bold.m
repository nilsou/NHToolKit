//
//  UIButton+Bold.m
//  Hukkster
//
//  Created by Nils Hayat on 6/13/13.
//  Copyright (c) 2013 Hukkster. All rights reserved.
//

#import "UIKit+Bold.h"

@implementation UIButton (Bold)

-(void)boldRange:(NSRange)range {	
	NSArray *fontNames = [UIFont fontNamesForFamilyName:self.titleLabel.font.familyName];
	NSString *boldFontName;
	for (NSString *fontName in fontNames) {
		NSRange textRange = [[fontName lowercaseString] rangeOfString:@"bold"];
		if (textRange.location != NSNotFound) {
			boldFontName = fontName;
			break;
		}
	}
	
	if (boldFontName) {
		NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:self.titleLabel.text attributes:@{NSForegroundColorAttributeName:[self titleColorForState:UIControlStateNormal]}];
		[attributedText addAttributes:@{NSFontAttributeName: [UIFont fontWithName:boldFontName size:self.titleLabel.font.pointSize]} range:range];
		
		NSMutableAttributedString *highlightedAttributedText = [[NSMutableAttributedString alloc] initWithString:self.titleLabel.text attributes:@{NSForegroundColorAttributeName: [self titleColorForState:UIControlStateHighlighted]}];
		[highlightedAttributedText addAttributes:@{NSFontAttributeName: [UIFont fontWithName:boldFontName size:self.titleLabel.font.pointSize]} range:range];
		
		[self setAttributedTitle:attributedText forState:UIControlStateNormal];
		[self setAttributedTitle:highlightedAttributedText forState:UIControlStateHighlighted];
	}
}

- (void) boldSubstring: (NSString*) substring {
    NSRange range = [self.titleLabel.text rangeOfString:substring];
    [self boldRange:range];
}

@end


@implementation UILabel (Bold)

-(void)boldRange:(NSRange)range {
	NSArray *fontNames = [UIFont fontNamesForFamilyName:self.font.familyName];
	NSString *boldFontName;
	for (NSString *fontName in fontNames) {
		NSRange textRange = [[fontName lowercaseString] rangeOfString:@"bold"];
		if (textRange.location != NSNotFound) {
			boldFontName = fontName;
			break;
		}
	}
	
	if (boldFontName) {		
		NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
		[attributedText addAttributes:@{NSFontAttributeName: [UIFont fontWithName:boldFontName size:self.font.pointSize]} range:range];
		
		self.attributedText = attributedText;
	}
}

- (void) boldSubstring: (NSString*) substring {
    NSRange range = [self.text rangeOfString:substring];
    [self boldRange:range];
}

@end