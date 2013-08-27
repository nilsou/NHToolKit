//
//  NSString+Validation.m
//  Gamblino
//
//  Created by Nils Hayat on 8/8/12.
//  Copyright (c) 2012 Casserole Labs. All rights reserved.
//

#import "NSString+Validation.h"

@implementation NSString (Validation)

- (BOOL)isAValidEmailAddress
{
    BOOL stricterFilter = YES; //Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSString *laxString = @".+@.+\\.[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

- (BOOL)isAValidPhoneNumber
{
	NSError *error;
	NSDataDetector *detector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingAllTypes error:&error];

	NSTextCheckingResult *result = [detector firstMatchInString:self options:0 range:NSMakeRange(0, [self length])];
	
	return (result.range.location == 0 && result.range.length == self.length);
}

@end
