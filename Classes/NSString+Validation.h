//
//  NSString+Validation.h
//  Gamblino
//
//  Created by Nils Hayat on 8/8/12.
//  Copyright (c) 2012 Casserole Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Validation)

- (BOOL)isAValidEmailAddress;
- (BOOL)isAValidPhoneNumber;

@end
